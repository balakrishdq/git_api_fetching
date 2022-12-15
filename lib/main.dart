import 'package:api_test/screens/home_screen.dart';
import 'package:api_test/screens/signup_screen.dart';
import 'package:api_test/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const WelcomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        SignupScreen.routeName: (context) => SignupScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
