
import 'package:flutter/material.dart';
import 'package:job_lister/Utils/buttons.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Who Are You?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              AnimatedButton(
                key: UniqueKey(), // Providing a unique key
                text: 'Recruiter',
                onPressed: () {
                  // Add navigation logic for recruiter
                },
              ),
              SizedBox(height: 20),
              AnimatedButton(
                key: UniqueKey(), // Providing a unique key
                text: 'Finder',
                onPressed: () {
                  // Add navigation logic for finder
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

