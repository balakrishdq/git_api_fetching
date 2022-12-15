import 'package:api_test/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreenFields extends StatelessWidget {
  const WelcomeScreenFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 450,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(200, 100),
                bottomRight: Radius.elliptical(200, 100),
              ),
              boxShadow: [
                BoxShadow(color: Colors.white, offset: Offset(0, 1))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Image(
              image: AssetImage(
                'assets/images/welcome_logo.png',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Text(
            'View Latest Repository,Anytime',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Text(
            'Choose from any repository from the lastest\nlist with new additions published every month',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 40, right: 30),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SignupScreen.routeName);
            },
            child: Text(
              'Start Browsing',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              padding: EdgeInsets.only(
                left: 60,
                right: 60,
                top: 10,
                bottom: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
