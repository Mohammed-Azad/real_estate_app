import 'package:flutter/material.dart';
import 'package:real_estate_app/screens/home.dart';
import 'package:real_estate_app/screens/onboarding.dart';
import '../models/auth.dart';
import 'package:sizer/sizer.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Home();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const CircularProgressIndicator(
                  backgroundColor: Colors.black54,
                ),
                SizedBox(
                  height: 2.h,
                ),
                const Text("Loading"),
              ]),
            );
          } else {
            return const OnboardScreen();
          }
        },
        stream: Auth().authStateChageds,
      ),
    );
  }
}
