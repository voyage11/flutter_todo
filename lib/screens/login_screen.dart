import 'package:flutter/material.dart';
import 'package:fluttertodo/constants.dart';
import 'package:fluttertodo/components/main_button.dart';
import 'package:fluttertodo/mixins/app_message.dart';

class LoginScreen extends StatefulWidget with AppMessage {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _passwordNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                login();
              },
            ),
            SizedBox(
              height: 80,
            ),
            MainButton(
              title: 'Login',
              onPressed: () {
                login();
              },
            )
          ],
        ),
      ),
    );
  }

  void login() {
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
//    AppMessage.show(
//      context: context,
//      title: 'Error',
//      description: 'This is error.',
//      type: MessageType.error,
//    );
  }
}
