import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_audio_call/home_page.dart';
import 'package:video_audio_call/login_page.dart';
import 'package:video_audio_call/services/cache.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadInitialData();
  }

  loadInitialData() async {
    await AppCache.instance.setPref();
    await Future.delayed(const Duration(seconds: 5));
    // AppCache.instance.clearCache();
    String userId = await AppCache.instance
            .fatchData(prefKey: AppCacheKeys.instance.useId) ??
        '';
    String username = await AppCache.instance
            .fatchData(prefKey: AppCacheKeys.instance.userName) ??
        '';
    log('SSS userId $userId');
    if (userId.isNotEmpty) {
      await ZIMKit.instance.connectUser(id: userId, name: username);
    }

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                userId.isNotEmpty ? const HomeScreen() : const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: const Center(child: FlutterLogo())),
    );
  }
}
