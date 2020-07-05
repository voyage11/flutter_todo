import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertodo/components/main_button.dart';
import 'package:fluttertodo/screens/login_screen.dart';
import 'package:fluttertodo/screens/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Screen'),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MainButton(
              title: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            SizedBox(
              height: 10,
            ),
            MainButton(
              title: 'Signup',
              onPressed: () {
                Navigator.pushNamed(context, SignupScreen.id);
              },
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
