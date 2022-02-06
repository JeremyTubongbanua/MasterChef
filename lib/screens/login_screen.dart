import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masterchef/screens/tabs_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

enum AuthState {
  LOGIN,
  SIGN_UP,
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  AuthState authState = AuthState.LOGIN;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        constraints: BoxConstraints(maxWidth: 700),
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.3,
            ),
            Text(
              'MasterChef',
              style: TextStyle(fontSize: 42),
            ),
            Text(
              'Developed by Jeremy Tubongbanua',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              height: authState == AuthState.LOGIN ? size.height * 0.4 : size.height * 0.5,
              width: double.infinity,
              child: Card(
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(label: Text('Email')),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        obscureText: true,
                        decoration: InputDecoration(label: Text('Password')),
                        controller: passController,
                      ),
                    ),
                    if (authState == AuthState.SIGN_UP)
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          keyboardType: TextInputType.name,
                          obscureText: true,
                          decoration: InputDecoration(label: Text('Confirm Password')),
                          controller: confirmPassController,
                        ),
                      ),
                    if (isLoading) CircularProgressIndicator(),
                    TextButton(
                      onPressed: () async {
                        try {
                          if (authState == AuthState.LOGIN) {
                            setState(() {
                              isLoading = true;
                            });
                            await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passController.text);
                            setState(() {
                              isLoading = false;
                            });
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successful')));
                          } else {
                            if (passController.text == confirmPassController.text) {
                              setState(() {
                                isLoading = true;
                              });
                              await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passController.text);
                              setState(() {
                                isLoading = false;
                              });
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign Up Successful')));
                            }
                          }
                          Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
                        } catch (e) {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                        }
                        setState(() {
                          isLoading = false;
                        });
                      },
                      child: authState == AuthState.LOGIN ? Text('Login') : Text('Sign Up'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          if (authState == AuthState.SIGN_UP) {
                            authState = AuthState.LOGIN;
                          } else {
                            authState = AuthState.SIGN_UP;
                          }
                        });
                      },
                      child: authState != AuthState.LOGIN ? Text('Login Instead') : Text('Sign Up Instead'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
