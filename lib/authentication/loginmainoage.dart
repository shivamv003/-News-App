// ignore_for_file: prefer_const_constructors

// import 'package:Uptrend/Authentication/forgot.dart';
// import 'package:Uptrend/home%20screen/test2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_getx/authentication/forgot.dart';
import 'package:news_getx/home.dart';
// import 'package:shopping_app/Authentication/forgot.dart';
// import 'package:shopping_app/aduu/test2.dart';
// import 'package:shopping_app/homepage.dart';
// import 'package:shopping_app/test.dart';
// import 'package:shopping_app/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevents closing the dialog by tapping outside
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message!)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '   Email',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                hintText: 'Enter your email',
                filled: true,
                fillColor: const Color.fromARGB(255, 234, 230, 230),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '   Password',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              obscureText: true, // Hides the text being entered
              keyboardType: TextInputType
                  .visiblePassword, // Allows characters and numbers
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock), //
                hintText: 'Enter Your Password',
                filled: true,
                fillColor: const Color.fromARGB(255, 234, 230, 230),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                // text: 'Already have an account ?',
                // style: const TextStyle(color: Colors.black, fontSize: 16),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Forget Password ? ',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 3, 82, 64),
                      fontSize: 16,
                      // decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgetPage()),
                        );
                      },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: _login,
                style: TextButton.styleFrom(
                  side: const BorderSide(width: 1.0),

                  // backgroundColor: const Color.fromARGB(255, 165, 163, 163),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.all(15),
                  // Background color
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                child: const Text(
                  '    Login    ',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainHomePage {
  const MainHomePage();
}
