import 'dart:io';

import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String message = 'yeye';
  TextToSpeech tts = TextToSpeech();
  @override
  void initState() {
    super.initState();
    initClient();
  }

  void initClient() async {
    while (true) {
      Socket socket = await Socket.connect('192.168.1.13', 9000);
      socket.listen((List<int> event) {
        String _message = String.fromCharCodes(event).trim();
        print('Received message from server : $_message');
        tts.speak(_message);
        socket.close();
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => tts.speak('AAAyiiiiii!'),
            icon: Icon(Icons.remove_red_eye_rounded)),
        title: const Text('Insight-Mate',
            style: TextStyle(
                color: Colors.yellow,
                fontSize: 25,
                fontWeight: FontWeight.w800)),
        actions: [
          IconButton(
              onPressed: () => tts.speak('Volcanooo PUSHHHH'),
              icon: const Icon(Icons.volcano))
        ],
      ),
      body: Center(
        child: Container(
          height: 270,
          width: 270,
          decoration: const BoxDecoration(
              color: Colors.lightBlue,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    offset: Offset(10, 10),
                    blurRadius: 20,
                    color: Colors.black26),
                BoxShadow(
                    offset: Offset(-10, -10),
                    blurRadius: 20,
                    color: Colors.white10)
              ]),
          child: IconButton(
            onPressed: () {
              print(message);
            },
            icon: Icon(
              Icons.volume_up,
              size: 125,
              color: Colors.yellow[200],
            ),
          ),
        ),
      ),
    );
  }
}
