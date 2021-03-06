import 'dart:convert';
import 'dart:developer';
import 'dart:html';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // TODO Test data <<<<<<<<<<<<<<
  // Get your AppID from ZEGOCLOUD Console [My Projects] : https://console.zegocloud.com/project
  final int appID = 12345;

  // TODO Heroku server url for example
  // Get the server from: https://github.com/ZEGOCLOUD/dynamic_token_server_nodejs
  final String tokenServerUrl = 'https://xxx.herokuapp.com'; // https://xxx.herokuapp.com


  /// Check the permission or ask for the user if not grant
  ///
  /// TODO Copy to your project
  Future<bool> requestPermission() async {
    PermissionStatus microphoneStatus = await Permission.microphone.request();
    if (microphoneStatus != PermissionStatus.granted) {
      log('Error: Microphone permission not granted!!!');
      return false;
    }
    PermissionStatus cameraStatus = await Permission.camera.request();
    if (cameraStatus != PermissionStatus.granted) {
      log('Error: Camera permission not granted!!!');
      return false;
    }
    return true;
  }

  /// Get the ZEGOCLOUD's API access token
  ///
  /// There are some API of ZEGOCLOUD need to pass the token to use.
  /// We use Heroku service for test.
  /// You can get your temporary token from ZEGOCLOUD Console [My Projects -> project's Edit -> Basic Configurations] : https://console.zegocloud.com/project  for both User1 and User2.
  /// Read more about the token: https://docs.zegocloud.com/article/14140
  Future<String> getToken(String userID) async {
    final response =
    await http.get(Uri.parse('$tokenServerUrl/access_token?uid=$userID'));
    if (response.statusCode == 200) {
      final jsonObj = jsonDecode(response.body);
      return jsonObj['token'];
    } else {
      return "";
    }
  }

  /// Get the necessary arguments to join the room for start the talk or live streaming
  ///
  ///  TODO DO NOT use special characters for userID and roomID.
  ///  We recommend only contain letters, numbers, and '_'.
  Future<Map<String, String>> getJoinRoomArgs(String roomID) async {
    final userID = math.Random().nextInt(10000).toString();
    final String token = await getToken(userID);
    return {
      'userID': userID,
      'token': token,
      'roomID': roomID,
      'appID': appID.toString(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'ZEGOCLOUD',
            style: TextStyle(fontSize: 30, color: Colors.blue),
          ),
          ElevatedButton(
              onPressed: () async {
                await requestPermission();
                // TODO This room id for test only
                //  You can talk to other user with the same roomID
                //  So you need to set an unique roomID for every talk
                Navigator.pushReplacementNamed(context, '/call_page',
                    arguments: await getJoinRoomArgs("123456_1v1"));
              },
              child: const Text('Start 1v1 talk')),
          ElevatedButton(
              onPressed: () async {
                await requestPermission();
                // TODO This room id for test only
                //  You can talk to other user with the same roomID
                //  So you need to set an unique roomID for every talk
                Navigator.pushReplacementNamed(context, '/group_call_page',
                    arguments: await getJoinRoomArgs("654321_group"));
              },
              child: const Text('Start group talk')),
        ],
      ),
    );
  }
}
