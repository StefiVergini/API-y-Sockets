import socket

def cliente_github(host='localhost', puerto=12345):
    cliente = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    cliente.connect((host, puerto))

    try:
        usuario = input("👤 Ingrese su nombre de usuario de GitHub: ")
        cliente.sendall(usuario.encode())

        print(cliente.recv(4096).decode())  # Confirmación

        while True:
            comando = input("💬 Ingrese un comando (/repos o /adios): ").strip()
            cliente.sendall(comando.encode())

            respuesta = cliente.recv(4096).decode()
            print(respuesta)

            if comando == "/adios":
                break

    finally:
        cliente.close()
        print("🔌 Conexión cerrada.")

if __name__ == "__main__":
    cliente_github()
