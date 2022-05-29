import 'package:flutter/material.dart';
import 'dart:async';

import '../../widgets/reusable_components.dart';
import '../OnboardingScreen/onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => navigateToAndBurn(context,const OnBoardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [firstColor, secondColor, thirdColor],
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter)),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image(
            image: AssetImage(
              'assets/images/appLogo.png',
            ),
          ),
        ),
      ),
    );
  }
}
