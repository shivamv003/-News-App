
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_getx/authentication/login.dart';
import 'package:news_getx/authentication/signin.dart';


class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
         
          Column(
            children: <Widget>[
              AppBar(
                backgroundColor: const Color.fromARGB(
                    0, 255, 255, 255), 
                elevation: 0, 
                title: const Text(
                  'Sign Up Page',
                  style: TextStyle(color: Colors.white),
                ),
                automaticallyImplyLeading: false,
              ),
              
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    SignInPage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 165, 163, 163),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.all(15),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      child: const Text('     Sign Up     '),
                    ),
                    const SizedBox(height: 15),
                    RichText(
                      text: TextSpan(
                        text: 'Already have an account ?',
                        style:
                            const TextStyle(color: Color.fromARGB(255, 41, 0, 0), fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Login ',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
