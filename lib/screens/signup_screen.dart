import 'package:flutter/material.dart';
import 'package:fluttertodo/constants.dart';
import 'package:fluttertodo/components/main_button.dart';
import 'package:fluttertodo/mixins/app_message.dart';
import 'package:fluttertodo/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'todo_screen.dart';

class SignupScreen extends StatefulWidget with AppMessage {
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
              autocorrect: false,
              enableSuggestions: false,
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
              autocorrect: false,
              enableSuggestions: false,
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
              type: ButtonType.login,
              onPressed: () {
                signUp();
              },
            )
          ],
        ),
      ),
    );
  }

  void signUp() async {
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');

    if (_emailController.text == '') {
      AppMessage.show(
          context: context,
          title: 'Error',
          description: 'Please enter an email.',
          type: MessageType.error);
    } else if (_passwordController.text == '') {
      AppMessage.show(
          context: context,
          title: 'Error',
          description: 'Please enter a password.',
          type: MessageType.error);
    } else {
      Auth()
          .signUp(
        _emailController.text,
        _passwordController.text,
      )
          .then((FirebaseUser user) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => TodoScreen()),
          (route) => false,
        );
      }).catchError((e) => AppMessage.show(
              context: context,
              title: 'Error',
              description: e.toString(),
              type: MessageType.error));
    }
  }
}
