import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_audio_call/call_page.dart';
import 'package:video_audio_call/services/cache.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Conversations'),
          actions: const [],
        ),
        body: ZIMKitConversationListView(
          onPressed: (context, conversation, defaultAction) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ZIMKitMessageListPage(
                  conversationID: conversation.id,
                  conversationType: conversation.type,
                );
              },
            ));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String userId = await AppCache.instance
                    .fatchData(prefKey: AppCacheKeys.instance.useId) ??
                '';
            String userName = await AppCache.instance
                    .fatchData(prefKey: AppCacheKeys.instance.userName) ??
                '';
            log('SSS for user $userName id is $userId');
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return CallPage(
                    callID: '11112222',
                    userID: userId == 'demo1' ? '2222' : '1111',
                    userName: userName);
              },
            ));
          },
          child: const Icon(Icons.call),
        ),
      ),
    );
  }
}
