import 'package:api_test/widgets/welcome/welcome_screen_fields.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        colors: [
          Color(0xffffb3e6),
          Colors.white,
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.centerLeft,
      ),
      body: WelcomeScreenFields(),
    );
  }
}
