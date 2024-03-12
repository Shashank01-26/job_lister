import 'package:flutter/material.dart';
import 'package:job_lister/Utils/buttons.dart';
import 'package:job_lister/screens/finders_widget.dart';
import 'package:job_lister/screens/recruiters_widget.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/bg2.jpg', 
            fit: BoxFit.fill,
          ),
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                  
                  SizedBox(height: 20), // Add spacing between the text and buttons
                  Text(
                    "Welcome back,\nLet's start sorting your jobs out!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2, 2),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 70.0,),
                  Text(
                    "Who Are You?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2, 2),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  AnimatedButton(
                    text: 'Recruiter',
                    onPressed: () {
                      // Navigate to the recruiter page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RecruiterPage()),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  AnimatedButton(
                    text: 'Finder',
                    onPressed: () {
                      // Navigate to the finder page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FinderPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
