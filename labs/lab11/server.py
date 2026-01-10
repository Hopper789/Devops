import socket
HOST = "0.0.0.0"
PORT = 5000
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    print(f"Server started on {HOST}:{PORT}")
    conn, addr = s.accept()
    with conn:
        print("Connected by", addr)
        data = conn.recv(1024)
        if data:
            print("Received:", data.decode())
            conn.sendall(b"Hello from server!")