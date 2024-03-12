import 'dart:async';

import 'package:flutter/material.dart';
import 'package:job_lister/screens/welcome_page.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FadeTransition(
              opacity: _animation,
              child: Image.asset(
                'assets/splash.png',
                height: 300,
                width: 350,
              ),
            ),
          ),
          SizedBox(height: 20), // Add space between the image and text
          Text(
            "Job Finder",
            style: TextStyle(
              fontSize: 24, // Set font size to 24
              fontWeight: FontWeight.bold, // Set font weight to bold
              fontFamily: 'Roboto', // Change font family as needed
              color: Colors.blue, // Set text color to blue
              // Add more text styles as needed
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
