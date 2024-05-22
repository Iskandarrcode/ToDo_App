import 'package:dars1/contacts_MVC/views/screens/contacts_screens.dart';
import 'package:dars1/todo_MVC/views/screens/todo_screen1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ContactScreen(),
      home: TodoApp(),
    );
  }
}
