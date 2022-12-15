import 'package:api_test/dbClass/user.dart';
import 'package:api_test/screens/home_screen.dart';
import 'package:api_test/services/user_service.dart';
import 'package:api_test/widgets/signup/chips_part.dart';
import 'package:api_test/widgets/signup/single_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup-screen';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController interestController = TextEditingController();

  bool _validateFirstname = false;
  bool _validateLastname = false;
  bool _validateEmail = false;
  bool _validatePassword = false;
  bool _validatePhone = false;
  bool _validateInterest = false;

  var _userService = UserService();

  var _user = User();

  final formKey = GlobalKey<FormState>();

  var databaseHelper;

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        colors: [
          Color(0xffffb3e6),
          Colors.white,
          Color(0xffcce6ff),
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.82,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade50,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Gap(10),
                              Text(
                                'Signup',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gap(30),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white,
                                              blurRadius: 3,
                                              blurStyle: BlurStyle.inner,
                                              spreadRadius: 1,
                                              offset: Offset(0, 1),
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextFormField(
                                          controller: firstnameController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'First Name',
                                            errorText: _validateFirstname
                                                ? "Field can't be empty"
                                                : null,
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 19,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Gap(35),
                                    SizedBox(
                                      width: 120,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white,
                                              blurRadius: 3,
                                              blurStyle: BlurStyle.inner,
                                              spreadRadius: 1,
                                              offset: Offset(0, 1),
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextFormField(
                                          controller: lastnameController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'Last Name',
                                            errorText: _validateLastname
                                                ? "Field can't be empty"
                                                : null,
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 19,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleField(
                                controller: emailController,
                                title: 'Email',
                                errorText: _validateEmail
                                    ? "Field can't be empty"
                                    : null,
                                iconName: Icons.email_outlined,
                                obscureText: false,
                                keyType: TextInputType.emailAddress,
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some value';
                                  }
                                  return null;
                                },
                              ),
                              SingleField(
                                controller: passwordController,
                                title: 'Password',
                                errorText: _validatePassword
                                    ? "Field can't be empty"
                                    : null,
                                iconName: Icons.lock_outline,
                                obscureText: true,
                                keyType: TextInputType.text,
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some value';
                                  }
                                  return null;
                                },
                              ),
                              SingleField(
                                controller: phoneController,
                                title: 'Phone',
                                errorText: _validatePhone
                                    ? "Field can't be empty"
                                    : null,
                                iconName: Icons.phone_callback,
                                obscureText: false,
                                keyType: TextInputType.number,
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some value';
                                  }
                                  return null;
                                },
                              ),
                              ChipsPart(
                                controller: interestController,
                                errorText: _validateInterest
                                    ? "Field can't be empty"
                                    : null,
                              ),
                              Gap(20),
                              Row(
                                children: [
                                  Checkbox(
                                    value: _isChecked,
                                    activeColor: Colors.deepPurple,
                                    checkColor: Colors.white,
                                    onChanged: (bool? newBool) {
                                      setState(() {
                                        _isChecked = newBool!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Accept our Terms and Conditions',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(right: 30),
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      firstnameController.text.isEmpty
                          ? _validateFirstname = true
                          : _validateFirstname = false;
                      lastnameController.text.isEmpty
                          ? _validateLastname = true
                          : _validateLastname = false;
                      emailController.text.isEmpty
                          ? _validateEmail = true
                          : _validateEmail = false;
                      passwordController.text.isEmpty
                          ? _validatePassword = true
                          : _validatePassword = false;
                      phoneController.text.isEmpty
                          ? _validatePhone = true
                          : _validatePhone = false;
                      interestController.selection.isValid
                          ? _validateInterest = true
                          : _validateInterest = false;
                    });
                    if (_validateFirstname == false &&
                        _validateLastname == false &&
                        _validateEmail == false &&
                        _validatePassword == false &&
                        _validatePhone == false &&
                        _validateInterest == false) {
                      print('Good data to be save');

                      _user.firstName = firstnameController.text.toString();
                      _user.lastName = lastnameController.text.toString();
                      _user.email = emailController.text.toString();
                      _user.password = passwordController.text.toString();
                      _user.phoneNum =
                          int.parse(phoneController.text.toString());
                      _user.interest = interestController.text.toString();

                      var result = await _userService.SaveUser(_user);

                      print(result);
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    }
                  },
                  child: Text(
                    'Signup',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    padding: EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 10),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
