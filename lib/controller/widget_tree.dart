import 'package:flutter/material.dart';
import 'package:real_estate_app/screens/onboarding.dart';
import '../model/auth.dart';
import '../screens/login.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(builder: (context, snapshot) {
      if (snapshot.hasData) {
        return const Login();
      } else {
        return const OnboardScreen();
      }
    },
    stream: Auth().authStateChageds,);
  }
}
