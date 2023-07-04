import 'package:flutter/material.dart';
import 'package:real_estate_app/widgets/TextFields.dart';
import 'signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        reverse: MediaQuery.of(context).viewInsets.bottom < 1 ? true : false,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: Image.asset(
                'assets/images/login.png',
                width: double.infinity,
              ),
            ),
            const Padding(
                padding:  EdgeInsets.only(left: 10),
                child: Text(
                  "Login To Your Account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xff8F74D7)),
                )),
            const SizedBox(
              height: 5,
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                //textFields(name,password or not , foucasable,keyboardtype)
                child: textFields("Email", false, false,TextInputType.emailAddress)),
            const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: textFields("Password", true, false,TextInputType.text)),
            Padding(
              padding: const EdgeInsets.only(left: 155, top: 10),
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
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: TextButton(
                style: TextButton.styleFrom(
                  fixedSize:Size(300, 50) ,
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                  padding: EdgeInsets.all(10),
                  
                ),
                onPressed: () {},
                child: const  Text(
                  'LogIn',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
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
            const Padding(padding:EdgeInsets.only(left: 2,top: 15) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(backgroundImage: AssetImage('assets/images/google_logo.png'),radius:19,backgroundColor: Colors.transparent,),
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(backgroundImage: AssetImage('assets/images/facebook_logo.png'),radius: 20,),
              ],
            ),
            ),
          Padding(padding:EdgeInsets.symmetric(horizontal: 2,vertical: 15),child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don\'t have account? "),
              GestureDetector(onTap: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Signup()),
          );},child: Text("SignUp",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Theme.of(context).secondaryHeaderColor),),),
            ],
          ) ,
          ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
            ),
          ],
        ),
      ),
    );
  }
}
