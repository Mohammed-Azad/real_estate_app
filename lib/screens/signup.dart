import 'package:flutter/material.dart';
import 'package:real_estate_app/widgets/TextFields.dart';
import 'package:sizer/sizer.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/auth.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _confirmpassword = TextEditingController();
  String? errormessage = '';
  Future<void> createUserWithEmailAndPassword() async {
    try {
        await Auth().createUserwithEmailAndPassword(
            email: _email.text.toLowerCase().trim(), password: _password.text.trim());
      
    } on FirebaseAuthException catch (e) {
      setState(() {
        errormessage = e.message;
      });
    }
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
                height: 2.h,
              ),
              SizedBox(
                width: 100.w,
                height: 200,
                child: Image.asset(
                  'assets/images/signup.png',
                  width: double.infinity,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 1.w),
                  child: const Text(
                    "Create New Account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xff8F74D7)),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                child: Column(
                  children: [
                    textFields("Email", false, false,
                        TextInputType.emailAddress, _email),
                    SizedBox(
                      height: 2.h,
                    ),
                    textFields(
                        "Password", true, false, TextInputType.text, _password),
                    SizedBox(
                      height: 2.h,
                    ),
                    textFields("Confirm Password", true, false,
                        TextInputType.text, _confirmpassword),
                  ],
                ),
                //textFields(name,password or not , foucasable,keyboardtype,controller)
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: const Size(300, 50),
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: () {
                    if (_email.text.isEmpty &&
                        _password.text.isEmpty &&
                        _confirmpassword.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text(" is full empty ",style: TextStyle(fontSize: 18),),backgroundColor: Theme.of(context).secondaryHeaderColor,),
                      );
                    }else if(_email.text.isEmpty &&_password.text.isNotEmpty&&_confirmpassword.text.isNotEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text(" email is empty ",style: TextStyle(fontSize: 18)),backgroundColor: Theme.of(context).secondaryHeaderColor,),
                        
                      );
                    }else if(_email.text.isNotEmpty&& _confirmpassword.text!=_password.text&&_confirmpassword.text.isNotEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text(" confirmpassword not match password ",style: TextStyle(fontSize: 18)),backgroundColor: Theme.of(context).secondaryHeaderColor),
                      );
                    }else if( _password.text.length<4 && _confirmpassword.text.length<4&&_confirmpassword.text.isNotEmpty&&_password.text.isNotEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text(" password is to short",style: TextStyle(fontSize: 18)),backgroundColor: Theme.of(context).secondaryHeaderColor),
                      );
                    }else if((!_email.text.contains('@'))&&_email.text.isNotEmpty&&_password.text.isEmpty&&_confirmpassword.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text(" email is not correct",style: TextStyle(fontSize: 18)),backgroundColor: Theme.of(context).secondaryHeaderColor),
                      );
                    }else if(_email.text.isNotEmpty&&_password.text.isEmpty&&_confirmpassword.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text("password feild is empty",style: TextStyle(fontSize: 18)),backgroundColor: Theme.of(context).secondaryHeaderColor),
                      );
                    }else if(_email.text.isNotEmpty&&_password.text.isNotEmpty&&_confirmpassword.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text(" confirm password is empty",style: TextStyle(fontSize: 18)),backgroundColor: Theme.of(context).secondaryHeaderColor),
                      );
                    }else if(_email.text.isNotEmpty&&_password.text.isEmpty&&_confirmpassword.text.isNotEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text(" password is empty",style: TextStyle(fontSize: 18)),backgroundColor: Theme.of(context).secondaryHeaderColor),
                      );
                    }else{
                    createUserWithEmailAndPassword();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                    }
                  },
                  child: const Text(
                    'SignUp',
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
                      "Or Sign Up with",
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
                padding: EdgeInsets.only(left: 2.w, top: 2.h),
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
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      },
                      child: Text(
                        "SignIn",
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
