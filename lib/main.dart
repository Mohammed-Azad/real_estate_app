import 'package:flutter/material.dart';
import 'screens/onboarding.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primaryColor: const Color(0XffA98EBB),
        primaryColorLight:const  Color(0XffF0D9FF),
        secondaryHeaderColor:const Color(0xff8F74D7),
        hintColor:const Color(0xff9685C2),
        scaffoldBackgroundColor:const Color(0xffFEFDFF)
      ),
      home: OnboardScreen(),
    );
    
  }
}

