import socket
import threading
import requests
import mysql.connector

# Configuración del servidor para conexion ip y puerto
HOST = '127.0.0.1'
PORT = 12345


MENU = """
   ============== MENÚ ===============

   /repos        - Ver Repositorios
   /followers    - Ver Seguidores
   /adios        - Salir

   -----------------------------------

Ingrese opción:

"""
# Conexión a MySQL
conexion = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="github_data"
)
#cursor() para recorrer y manipular los datos de la db
cursor = conexion.cursor()

def manejar_cliente(cliente_socket, direccion):
    print(f"[+] Cliente conectado: {direccion}")
    try:
        #usuario_valido primera variable de control ya que no permitira
        #continuar hasta que ingrese un usuario de github valido
        #o, en todo caso ingresar el comando para salir
        usuario_valido = False
        usuario = ""

        #mientras el usuario no exista...
        while not usuario_valido:
            cliente_socket.sendall("\nIngrese su usuario de GitHub (o /adios para salir): ".encode('utf-8'))
            #entrada es lo recibido por el cliente, no lo tomamos como usuario todavia
            entrada = cliente_socket.recv(1024).decode().strip()

            if entrada.lower() == "/adios":
                cliente_socket.sendall("Hasta Pronto!\nDesconectando...\n".encode())
                #cerrar conexion de ese cliente
                cliente_socket.close()
                return

            #llamamos a la funcion usuario_existe retorna el statud_code si es = 200
            if usuario_existe(entrada):
                #si existe la entrada usuario es la entrada
                usuario = entrada
                #se cambia la variable de control para finalizar el bucle
                usuario_valido = True
                
                #primero buscamos en db si ya se encuentra ese usuario no lo agregamos
                buscar_en_db_usuario(usuario)
                insertar_datos(usuario)
                cliente_socket.sendall(f"Usuario encontrado. Datos de {usuario} guardados en la base.\n{MENU}".encode('utf-8'))
            else:
                cliente_socket.sendall("Usuario no encontrado. Intente nuevamente (o escriba /adios para salir).\n".encode('utf-8'))

        # Menú de comandos
        #una vez que se encontro al usuario
        while True:
            #cliente_socket.sendall(MENU.encode('utf-8'))
            comando = cliente_socket.recv(1024).decode().strip().lower()

            if comando == "/repos":
                #funcion para ver repositorios
                respuesta = f"\nRepositorios de {usuario}:\n{obtener_repos(usuario)}\n"
                cliente_socket.sendall((respuesta + MENU).encode('utf-8'))

            elif comando == "/followers":
                #funcion para ver seguidores
                respuesta = f"\nSeguidores de {usuario}:\n{obtener_followers(usuario)}\n"
                cliente_socket.sendall((respuesta + MENU).encode('utf-8'))

            elif comando == "/adios":
                cliente_socket.sendall("Hasta Pronto!\nDesconectando...\n".encode('utf-8'))
                break

            else:
                cliente_socket.sendall(f"\nOpción Inexistente. Ingrese nuevamente.\n{MENU}".encode('utf-8'))

    except Exception as e:
        print(f"[!] Error con cliente {direccion}: {e}")
    finally:
        cliente_socket.close()
        print(f"[-] Cliente desconectado: {direccion}")


#funcion utilizada solo en el caso que exista el usuario de github ingresado
#obtine la url y devuelve status_code = 200 que está ok!
#es decir que la solicitud del cliente fue exitosa
def usuario_existe(usuario):
    url = f"https://api.github.com/users/{usuario}"
    respuesta = requests.get(url)
    return respuesta.status_code == 200

#funcion para guardar los datos en la base de datos
#guarda repositorios y seguidores
def insertar_datos(usuario):
    url_repos = f"https://api.github.com/users/{usuario}/repos"
    #obtener los repos de la api
    res_repos = requests.get(url_repos)
    if res_repos.status_code == 200:
        repos = res_repos.json()
        #recorremos para insertar uno a uno
        for repo in repos:
            cursor.execute("""
                INSERT IGNORE INTO repositorios (id, name, html_url, description, owner)
                VALUES (%s, %s, %s, %s, %s)
            """, (repo['id'], repo['name'], repo['html_url'], repo.get('description'), usuario))

    url_followers = f"https://api.github.com/users/{usuario}/followers"
    #obtener los seguidores de la api
    res_followers = requests.get(url_followers)
    if res_followers.status_code == 200:
        followers = res_followers.json()
        #recorremos para insertar uno a uno
        for follower in followers:
            cursor.execute("""
                INSERT IGNORE INTO followers (id, login, html_url, owner)
                VALUES (%s, %s, %s, %s)
            """, (follower['id'], follower['login'], follower['html_url'], usuario))

    conexion.commit()
   
 #funcion que verifica si ya existe en la db el usuario
 #para no repetir datos
def buscar_en_db_usuario(usuario):
    cursor.execute("SELECT COUNT(*) FROM repositorios WHERE owner = %s", (usuario,))
    nro = cursor.fetchone()[0]
    #si ya existe los borramos y volvemos a insertar para que esté actualizado
    #en la base de datos
    if nro > 0:
        cursor.execute("DELETE FROM repositorios WHERE owner = %s", (usuario,))
        conexion.commit()
        cursor.execute("DELETE FROM followers WHERE owner = %s", (usuario,))
        conexion.commit()

#funcion para mostrar los repositorios del usuario ingresado e insertado en la db
def obtener_repos(usuario):
    cursor.execute("SELECT name, html_url FROM repositorios WHERE owner = %s", (usuario,))
    repos = cursor.fetchall()
    if not repos:
        return "UPS! No hay repositorios.\n"
    return "\n".join([f"- {name} ({url})" for name, url in repos])

#funcion para mostrar los followers del usuario ingresado e insertado en la db
def obtener_followers(usuario):
    cursor.execute("SELECT login, html_url FROM followers WHERE owner = %s", (usuario,))
    seguidores = cursor.fetchall()
    if not seguidores:
        return "UPS! No hay seguidores.\n"
    return "\n".join([f"- {login} ({url})" for login, url in seguidores])



def main(HOST, PORT):
    #inicializacion del servidor  socket.AF_INET (IP tipo ipv4) socket.SOCK_STREAM (de tipo TCP)
    servidor = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    #bind() donde el socket va a recibir las conexiones asociando la ip y el puerto
    servidor.bind((HOST, PORT))
    #servidor se queda en escucha para recibir las conexiones - 5 conexiones en cola maximo
    servidor.listen(5)
    print(f"\nServidor escuchando en {HOST}:{PORT}\n")

    try:
        while True:
            #aceptar la conexion
            cliente_socket, direccion = servidor.accept()
            #inicializacion del hilo para el cliente, se asocia el socket y la direccion
            threading.Thread(target=manejar_cliente, args=(cliente_socket, direccion)).start()
    except KeyboardInterrupt:
        print("\n Servidor detenido.")
    finally:
        #finalizar las conexiones: servidor y base de datos
        cursor.close()
        conexion.close()
        servidor.close()

if __name__ == "__main__":
    main(HOST, PORT)