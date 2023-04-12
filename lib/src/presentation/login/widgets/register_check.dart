import 'package:flutter/material.dart';
import 'package:moneyApp/login_auth.dart';
import 'package:moneyApp/src/presentation/login/widgets/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  // initially show login page
  bool showLoginPage = true;

  //toggle betwwen login and register
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginAuth();
    } else {
      return RegisterAuth();
    }
  }
}
