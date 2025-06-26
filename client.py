import socket

# Configuración del cliente
HOST = '127.0.0.1'
PORT = 12345

def cliente_github(HOST, PORT):
    #inicializacion del servidor  socket.AF_INET (IP tipo ipv4) socket.SOCK_STREAM (de tipo TCP)
    cliente = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    #conectar al cliente con el servidor
    cliente.connect((HOST, PORT))

    try:
        while True:
            mensaje = cliente.recv(4096).decode()
            print(mensaje, end='')

            entrada = input(">")
            cliente.sendall(entrada.encode('utf-8'))

            if entrada.strip().lower() == "/adios":
                print(cliente.recv(4096).decode())
                break

    finally:
        cliente.close()
        print("Conexión cerrada.")

if __name__ == "__main__":
    cliente_github(HOST, PORT)
