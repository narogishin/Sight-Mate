# Insight-Mate

This project aims to assist blind people in identifying objects around them using an ESP32_CAM device that is mounted on glasses and an ESP32 with two push buttons in hand. The ESP32 is responsible for collecting data from the push buttons and sending the signal to the server.

The server is implemented using Python and uses two server sockets with different ports. The first port receives the signals from the ESP32 and triggers a machine learning model for object recognition. If the signal received is 1, the server runs the money recognition model, while if it's 2, it runs the object detection model.

OpenCV library is used in the server to get an image from the ESP32_CAM and save the image on the server. Once the machine learning model has completed its job and generated the output, the second part of the socket server (the second port) will send the output to the client, which is a Flutter application.

The Flutter application receives the output from the server and uses the text-to-speech library to read the output. This way, blind people can hear what is happening around them and can recognize objects by clicking on the corresponding push button.
 
 ![Screen-shot of the App](https://imgur.com/a/iEXlOIP)

# Setup

To run the project, you need to set up the ESP32 device and connect it to the push buttons and to a 5v supply. Then you need to set up the server in Python and install the required libraries (e.g., OpenCV in python, text-to-speech in flutter).

Open the ESP32 Code folder and modify the name & password of your local/wifi network. Same thing with the ESP32 Camera and then check it's IP adress in the Serial Monitor after uploading the code and the IP adress of your hosting device to set it into the variable (HOST1, HOST2) in the Python Script : server.py, and inside the bind function in home_screen.dart code of the Flutter App and make sure that PORT2 in python script is the same number in home_screen.dart.

The client part of the project is a Flutter application that can be run on any mobile device. To run the application, you need to have the Flutter SDK installed on your system.

# Usage

After setting up the ESP32 device and running the server, you can run the Flutter application on your mobile device. Once the application is running, click on the corresponding push button on the ESP32 device to trigger the object recognition model. The output of the model will be read out loud by the text-to-speech library on your mobile device.
