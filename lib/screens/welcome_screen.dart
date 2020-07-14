import 'package:flutter/material.dart';
import 'package:fluttertodo/constants.dart';
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
  void dispose() {
    print('WelcomeScreen dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 90),
              child: Center(
                child: Text(
                  'Your Logo',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                MainButton(
                  title: 'Login',
                  type: ButtonType.login,
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                MainButton(
                  title: 'SignUp',
                  type: ButtonType.login,
                  onPressed: () {
                    Navigator.pushNamed(context, SignupScreen.id);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
