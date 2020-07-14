import 'package:flutter/material.dart';
import 'package:fluttertodo/models/TodoItem.dart';
import 'package:fluttertodo/models/user_data.dart';
import 'package:fluttertodo/screens/loading_screen.dart';
import 'package:fluttertodo/screens/todo_details_screen.dart';
import 'package:fluttertodo/screens/todo_screen.dart';
import 'package:provider/provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/add_todo_screen.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MaterialApp(
        initialRoute: LoadingScreen.id,
        routes: {
          LoadingScreen.id: (context) => LoadingScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          TodoScreen.id: (context) => TodoScreen(),
          AddTodoScreen.id: (context) => AddTodoScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          TodoDetailsScreen.id: (context) => TodoDetailsScreen(),
        },
      ),
    );
  }
}
