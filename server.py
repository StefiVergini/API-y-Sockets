import socket
import threading
import requests
import mysql.connector

# Conexión a MySQL
conexion = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="github_data"
)
cursor = conexion.cursor()

# Insertar datos desde GitHub
def insertar_datos(usuario):
    url_repos = f"https://api.github.com/users/{usuario}/repos"
    res_repos = requests.get(url_repos)
    if res_repos.status_code == 200:
        repos = res_repos.json()
        for repo in repos:
            cursor.execute("""
                INSERT IGNORE INTO repositorios (id, name, html_url, description, owner)
                VALUES (%s, %s, %s, %s, %s)
            """, (repo['id'], repo['name'], repo['html_url'], repo.get('description'), usuario))
    else:
        print(f"UPS! Error al obtener repositorios de {usuario}")

    url_followers = f"https://api.github.com/users/{usuario}/followers"
    res_followers = requests.get(url_followers)
    if res_followers.status_code == 200:
        followers = res_followers.json()
        for follower in followers:
            cursor.execute("""
                INSERT IGNORE INTO followers (id, login, html_url, owner)
                VALUES (%s, %s, %s, %s)
            """, (follower['id'], follower['login'], follower['html_url'], usuario))
    else:
        print(f"UPS! Error al obtener seguidores de {usuario}")

    conexion.commit()

# Obtener lista de repos guardados
def obtener_repos(usuario):
    cursor.execute("SELECT name, html_url FROM repositorios WHERE owner = %s", (usuario,))
    repos = cursor.fetchall()
    if not repos:
        return "🔍 No hay repositorios guardados.\n"
    return "\n".join([f"  - {name} ({url})" for (name, url) in repos])

# Manejo de cada cliente
def manejar_cliente(cliente_socket, direccion):
    print(f"[+] Conectado: {direccion}")
    try:
        usuario = cliente_socket.recv(1024).decode().strip()
        print(f"[{direccion}] Usuario: {usuario}")

        insertar_datos(usuario)
        cliente_socket.sendall(f"✅ Datos de {usuario} guardados en la base.\n".encode())

        while True:
            comando = cliente_socket.recv(1024).decode().strip()

            if comando == "/repos":
                print(f"[{direccion}] Solicitó /repos")
                datos = obtener_repos(usuario)
                cliente_socket.sendall(f"📁 Repositorios de {usuario}:\n{datos}\n".encode())
            elif comando == "/followers":
                    print(f"[{direccion}] Solicitó /followers")
                    datos = obtener_repos(usuario)
                    cliente_socket.sendall(f"📁 Seguidores de {usuario}:\n{datos}\n".encode())

            elif comando == "/adios":
                cliente_socket.sendall("👋 Adios\n".encode())
                break

            else:
                cliente_socket.sendall("\nComando no reconocido.\n\nIngrese una opción válida:\n".encode())

    except Exception as e:
        print(f"[!] Error: {e}")
    finally:
        cliente_socket.close()
        print(f"[-] Desconectado: {direccion}")

# Servidor principal
def main(host="localhost", puerto=12345):
    servidor = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    servidor.bind((host, puerto))
    servidor.listen(5)
    print(f"🚀 Servidor escuchando en {host}:{puerto}")

    try:
        while True:
            cliente_socket, direccion = servidor.accept()
            hilo = threading.Thread(target=manejar_cliente, args=(cliente_socket, direccion))
            hilo.start()
    except KeyboardInterrupt:
        print("\nServidor detenido.")
    finally:
        cursor.close()
        conexion.close()
        servidor.close()

if __name__ == "__main__":
    main()
