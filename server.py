import socket
import threading
import requests

# Función para manejar cada cliente conectado
def manejar_cliente(cliente_socket, direccion):
    print(f"[+] Conexión establecida con {direccion}")
    try:
        while True:
            usuario = cliente_socket.recv(1024).decode().strip()
            if not usuario:
                break

            print(f"[{direccion}] Consultando datos de {usuario}...")

            # Consultar repositorios
            url_repos = f"https://api.github.com/users/{usuario}/repos"
            res_repos = requests.get(url_repos)
            respuesta = f"📁 Repositorios de {usuario}:\n"
            if res_repos.status_code == 200:
                repos = res_repos.json()
                if repos:
                    for repo in repos:
                        respuesta += f"  - {repo['name']} ({repo['html_url']})\n"
                else:
                    respuesta += "  (No hay repositorios)\n"
            else:
                respuesta += "  (Error al obtener los repositorios)\n"

            # Consultar seguidores
            url_followers = f"https://api.github.com/users/{usuario}/followers"
            res_followers = requests.get(url_followers)
            respuesta += f"\n👥 Seguidores de {usuario}:\n"
            if res_followers.status_code == 200:
                followers = res_followers.json()
                if followers:
                    for follower in followers:
                        respuesta += f"  - {follower['login']} ({follower['html_url']})\n"
                else:
                    respuesta += "  (No hay seguidores)\n"
            else:
                respuesta += "  (Error al obtener los seguidores)\n"

            # Enviar respuesta al cliente
            cliente_socket.sendall(respuesta.encode())

    except Exception as e:
        print(f"[!] Error con {direccion}: {e}")
    finally:
        cliente_socket.close()
        print(f"[-] Conexión cerrada con {direccion}")

# Función principal del servidor
def iniciar_servidor(host='localhost', puerto=5555):
    servidor = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    servidor.bind((host, puerto))
    servidor.listen(5)
    print(f"[✔] Servidor escuchando en {host}:{puerto}")

    while True:
        cliente_socket, direccion = servidor.accept()
        hilo = threading.Thread(target=manejar_cliente, args=(cliente_socket, direccion))
        hilo.start()
        print(f"[+] Clientes activos: {threading.active_count() - 1}")

if __name__ == "__main__":
    iniciar_servidor()
