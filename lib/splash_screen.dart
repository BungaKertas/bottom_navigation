import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pembelajaran_ke_5/halaman_bottom.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3,
    ), (){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HalamanBottom(),), (route) => false,);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(
                "ini splashscreen",
              )
            ],
          ),
        ),
      ),
    );
  }
}