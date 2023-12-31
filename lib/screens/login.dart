import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/widgets/TextFields.dart';
import 'package:sizer/sizer.dart';

import '../models/auth.dart';
import 'home.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String? errormessage = '';
  bool isLogin = true;
  Future<void> signInWithEmailAndPassword() async {
    await Auth().signInwithEmailAndPassword(
        email: _email.text.toLowerCase().trim(),
        password: _password.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: SingleChildScrollView(
          reverse: MediaQuery.of(context).viewInsets.bottom < 1 ? true : false,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: double.infinity,
                height: 30.h,
                child: Image.asset(
                  'assets/images/login.png',
                  width: double.infinity,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: const Text(
                    "Login to your account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xff8F74D7)),
                  )),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                  //textFields(name,password or not , foucasable,keyboardtype,controller)
                  child: textFields("Email", false, false,
                      TextInputType.emailAddress, _email)),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: textFields(
                      "Password", true, false, TextInputType.text, _password)),
              Padding(
                padding: EdgeInsets.only(left: 60.w),
                child: GestureDetector(
                  child: const Text(
                    "Forget password ?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff8F74D7)),
                  ),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h),
                child: TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: const Size(300, 50),
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: () async {
                    try {
                      await signInWithEmailAndPassword();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    } on FirebaseAuthException catch (exception) {
                      switch (exception.code) {
                        case "user-not-found":
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                " User not found! ",
                                style: TextStyle(fontSize: 18),
                              ),
                              backgroundColor:
                                  Theme.of(context).secondaryHeaderColor,
                            ),
                          );
                          break;
                        case "invalid-email":
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                "Invalid Email! ",
                                style: TextStyle(fontSize: 18),
                              ),
                              backgroundColor:
                                  Theme.of(context).secondaryHeaderColor,
                            ),
                          );
                          break;
                        case "wrong-password":
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                " Password incorrect! ",
                                style: TextStyle(fontSize: 18),
                              ),
                              backgroundColor:
                                  Theme.of(context).secondaryHeaderColor,
                            ),
                          );
                          break;
                        default:
                          print("Unknown error.");
                      }
                    }
                  },
                  child: const Text(
                    'LogIn',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 20.0,
                        endIndent: 10.0,
                        thickness: 1,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Text(
                      "Or Sign in with",
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 10.0,
                        endIndent: 20.0,
                        thickness: 1,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 1.w, top: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/google_logo.png'),
                      radius: 19,
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/facebook_logo.png'),
                      radius: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 3.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Signup()),
                        );
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Theme.of(context).secondaryHeaderColor),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
