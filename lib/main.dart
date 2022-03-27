import 'package:flutter/material.dart';
import 'package:shpotify/widgets/auth/auth_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          foregroundColor: Color.fromRGBO(0, 0, 0, 1)
        ),
        primarySwatch: Colors.blue,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          textStyle: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.w700),
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 32)),
        )
      ),
      home: const AuthWidget(),
    );
  }
}