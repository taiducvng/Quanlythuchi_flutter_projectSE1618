import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moneyApp/login_auth.dart';
import 'package:moneyApp/src/presentation/login/intro/into_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapsnot) {
          //if user is logged in
          if (snapsnot.hasData) {
            return const IntroPage();
          } else {
            return const LoginAuth();
          }
        },
      ),
    );
  }
  
}
