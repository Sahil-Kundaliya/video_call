import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  CallPage(
      {super.key,
      required this.callID,
      required this.userID,
      required this.userName});
  final String callID;
  final String userID;
  final String userName;
  int yourAppID = 1749949191;
  String yourAppSign =
      '58090123bb8381ba58d9da81615b69542b5cbe7541d6a8614c08cd19b168329f';

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID:
          yourAppID, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          yourAppSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userID,
      userName: userName,
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
