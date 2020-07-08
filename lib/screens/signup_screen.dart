import 'package:flutter/material.dart';
import 'package:fluttertodo/constants.dart';
import 'package:fluttertodo/components/main_button.dart';
import 'todo_screen.dart';

class SignupScreen extends StatefulWidget {
  static const String id = 'signup_screen';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FocusNode _passwordNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    print('SignupScreen dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
        backgroundColor: kMainBlueColor,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passwordNode);
              },
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              obscureText: true,
              textInputAction: TextInputAction.done,
              focusNode: _passwordNode,
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              onSubmitted: (_) {
                signUp();
              },
            ),
            SizedBox(
              height: 80,
            ),
            MainButton(
              title: 'SignUp',
              onPressed: () {
                signUp();
              },
            )
          ],
        ),
      ),
    );
  }

  void signUp() {
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => TodoScreen()),
      (route) => false,
    );
  }
}
