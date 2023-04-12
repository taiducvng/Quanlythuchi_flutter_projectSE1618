import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moneyApp/login_auth.dart';
import 'package:moneyApp/src/presentation/login/widgets/auth_page.dart';
import 'package:moneyApp/src/presentation/login/widgets/my_button.dart';
import 'package:moneyApp/src/presentation/login/widgets/my_textfield.dart';
import 'package:moneyApp/src/presentation/login/widgets/square_tile.dart';

import 'my_button1.dart';

class RegisterAuth extends StatefulWidget {
  const RegisterAuth({
    super.key,
  });

  @override
  State<RegisterAuth> createState() => _RegisterAuthState();
}

class _RegisterAuthState extends State<RegisterAuth> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  void signUserUp(BuildContext context) async {
    try {
      if (_passwordController.text == _confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AuthPage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // handle error
      if (e.code == 'user-not-found') {
        print('No user found!');
      } else if (e.code == 'wrong-passsword') {
        print('Wrong password LUL');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // ignore: prefer_const_constructors
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Icon(
                  Icons.monetization_on,
                  size: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome to our FPT Money Manager App',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //username
                MyTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 13,
                ),
                MyTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 13,
                ),
                MyTextField(
                  controller: _confirmpasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 13,
                ),

                const SizedBox(
                  height: 9,
                ),
                //button
                MyButton1(onTap: () => signUserUp(context)),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('You can also register with..')),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google
                    SquareTile(imagePath: 'assets/images/google.png'),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                // not a member? register now
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginAuth()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
