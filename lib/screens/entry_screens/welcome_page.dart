import 'package:flutter/material.dart';
import 'package:job_lister/Utils/buttons.dart';
import 'package:job_lister/screens/finders_module/presentation/finders_widget.dart';
import 'package:job_lister/screens/recruiter_screens/recruiters_widget.dart';

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
                  SizedBox(height: 20),
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
