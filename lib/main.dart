import 'package:flutter/material.dart';
// import 'package:zego_zimkit/zego_zimkit.dart';

void main() {
  // ZIMKit().init(
  //   appID: 1749949191, // your appid
  //   appSign:
  //       '58090123bb8381ba58d9da81615b69542b5cbe7541d6a8614c08cd19b168329f', // your appSign
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: true ? JitiCallScreen(title: 'Video call demo') : SplashScreen(),
    );
  }
}

// https://getstream.io/resources/projects/webrtc/platforms/flutter/?utm_source=chatgpt.com
