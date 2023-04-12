import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moneyApp/services/auth_service.dart';
import 'package:moneyApp/src/presentation/login/widgets/auth_page.dart';
import 'package:moneyApp/src/presentation/login/widgets/my_button.dart';
import 'package:moneyApp/src/presentation/login/widgets/my_textfield.dart';
import 'package:moneyApp/src/presentation/login/widgets/square_tile.dart';

import 'src/presentation/login/widgets/register_page.dart';

class LoginAuth extends StatefulWidget {
  const LoginAuth({
    super.key,
  });

  @override
  State<LoginAuth> createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void signUserIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AuthPage()),
      );
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                //button
                MyButton(onTap: () => signUserIn(context)),
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
                          child: Text('You can also login with..')),
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
                GestureDetector(
                  onTap: () => AuthService().signInWithGoogle(),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //google
                      SquareTile(imagePath: 'assets/images/google.png'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                // not a member? register now
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterAuth()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Register now',
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
