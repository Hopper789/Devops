import socket
HOST = "server" # "127.0.0.1" # DNS
PORT = 5000
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((HOST, PORT))
    s.sendall(b"Hello from client!")
    data = s.recv(1024)
    print("Received:", data.decode())