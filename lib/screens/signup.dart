import 'package:blog_minimal/controller/auth_controller.dart';
import 'package:blog_minimal/screens/home_page.dart';
import 'package:blog_minimal/screens/signin.dart';
import 'package:blog_minimal/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Sign Up',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: width,
                    child: Image.asset(
                      'assets/images/logo-png.png',
                      width: width * 0.5,
                      height: height * 0.3,
                    )),
                Text('UserName', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: height * 0.01),
                CustomTextField(hint: 'Enter UserName'),
                SizedBox(height: height * 0.03),
                Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: height * 0.01),
                CustomTextField(
                  hint: 'Enter Email',
                  controller: _emailController,
                ),
                SizedBox(height: height * 0.03),
                Text('Password', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: height * 0.01),
                CustomTextField(
                  hint: 'Enter Password',
                  controller: _passwordController,
                ),
                SizedBox(height: height * 0.05),
                Center(
                  child: Container(
                      width: width * 0.5,
                      height: height * 0.06,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff11586b))),
                          onPressed: () async {
                            authController.register(
                                _emailController.text.trim(),
                                _passwordController.text.trim());
                            Get.to(HomePage());
                          },
                          child: Text("Sign-Up"))),
                )
              ],
            ),
          )),
    );
  }
}
