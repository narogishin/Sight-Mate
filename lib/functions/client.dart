import 'dart:io';

void main() async {
  initClient();
}

void initClient() async {
  Socket socket = await Socket.connect('192.168.1.13', 12345);
  socket.listen((List<int> event) {
    String message = String.fromCharCodes(event).trim();
    print('Received message from server : $message');
  });
  // await Future.delayed(const Duration(seconds: 10));
}
