import 'package:flutter/material.dart';
import 'package:video_audio_call/home_page.dart';
import 'package:video_audio_call/services/cache.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(
                labelText: 'User ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () async {
                // Implement login logic here
                String username = _usernameController.text.trim();
                String userId = _userIdController.text.trim();
                await ZIMKit.instance.connectUser(id: userId, name: username);
                await AppCache.instance.setData(
                    prefKey: AppCacheKeys.instance.useId, data: userId);
                await AppCache.instance.setData(
                    prefKey: AppCacheKeys.instance.userName, data: username);

                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return const HomeScreen();
                  },
                ));
                // print('Username: $username, UserID: $userId');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
