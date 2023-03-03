import socket

# Server 1
HOST1 = 'localhost'  # ip adress of this device connected to the same network of :ESP32, ESP32_CAM, Mobile Phone in which Flutter App runs
PORT1 = 12345 # same port number of ESP32 (with th buttons)

while True:
    # the role of this server is to receive signal or message from the ESP32 : 1 or 2
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s1:
        s1.bind((HOST1, PORT1))
        s1.listen()
        print(f'Server 1 is listening on {HOST1}:{PORT1}')
        conn1, addr1 = s1.accept()
        with conn1:
            print(f'Connected by {addr1}')
            while True:
                data1 = conn1.recv(1024)
                if not data1:
                    break
                data_esp32 = data1.decode('utf-8')
                print(f"Server 1 received: {data_esp32}")
    msg = 'test'
    
    # if the message from ESP32 is 1, then we run the Money Recognition code
    if data_esp32 == '1':
        msg = 'Money Recognition'
        print(msg)
    # if the message from ESP32 is 2, then we run the Object Detection & Recognition code
    elif data_esp32 == '2':
        msg = 'Object Detection & Recognition'
        print(msg)

    # Server 2
    HOST2 = 'localhost'  # same ip adress as before because we are running on the same machine
    PORT2 = 9000 # this port should be the same in the flutter mobile app

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s2:
        # the role of this server is to send the output (string data type) of the machine learning models
        # to the mobile app so it can say it using text to speech
        s2.bind((HOST2, PORT2))
        s2.listen()
        print(f'Server 2 is listening on {HOST2}:{PORT2}')
        conn2, addr2 = s2.accept()
        with conn2:
            print(f'Connected by {addr2}')
            conn2.send(f'we got you bro at {msg}'.encode('utf-8'))
