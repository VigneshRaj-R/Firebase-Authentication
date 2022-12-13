import 'package:firebase_authentication/view/Login/SignUp/Login/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      goToHome(context);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Firebase",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Authentication",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> goToHome(context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const LoginPage()));
  }
}
