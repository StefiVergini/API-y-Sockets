import socket

def cliente_github(host='localhost', puerto=5555):
    cliente = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    cliente.connect((host, puerto))

    try:
        while True:
            usuario = input("\n🔍 Ingrese un usuario de GitHub (o ENTER para salir): ")
            if not usuario:
                break

            cliente.sendall(usuario.encode())

            # Recibir datos desde el servidor (hasta 4096 bytes)
            respuesta = cliente.recv(4096).decode()
            print(f"\n{respuesta}")

    finally:
        cliente.close()
        print("🔌 Conexión cerrada.")

if __name__ == "__main__":
    cliente_github()