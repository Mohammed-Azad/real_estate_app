import 'package:flutter/material.dart';
import 'package:real_estate_app/model/auth.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'widgets/widget_tree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final User? user = Auth().currentuser;
  Future<void> _signout() async {
    await Auth().signOut();
  }

  Widget _userId() {
    return Text(user?.email ?? "User Email");
  }

  Widget _signoutButton() {
    return ElevatedButton(onPressed: _signout, child: const Text("SignOut"));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              primaryColor: const Color(0XffA98EBB),
              primaryColorLight: const Color(0XffF0D9FF),
              secondaryHeaderColor: const Color(0xff8F74D7),
              hintColor: const Color(0xff9685C2),
              scaffoldBackgroundColor: const Color(0xffFEFDFF),
              primaryColorDark: const Color(0xff8F74D7),
            ),
            home: const WidgetTree());
      },
    );
  }
}
