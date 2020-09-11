import 'package:flutter/material.dart';
import 'package:ml_app/Screen/home.dart';
import 'package:ml_app/Screen/mlscreen.dart';
import 'package:ml_app/Screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ml App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      // routes: {
      //   Home.routname : (ctx) => Home(),
      //   MlScreen.routname:(ctx) =>MlScreen()
      // },
    );
  }
}
