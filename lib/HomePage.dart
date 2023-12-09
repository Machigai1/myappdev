import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myappdev/BMI.dart';
import 'package:myappdev/ComingSoon.dart';
import 'package:myappdev/LoginPage.dart';
import 'package:myappdev/StepCounter.dart';

class HomePage extends StatefulWidget {
  final String? email;
  const HomePage({super.key, this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF5885AF), 
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildImageCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BMI()),
                      );
                    },
                    isAnimation: false,
                    assetPath: 'assets/bmi.png',
                  ),
                  SizedBox(width: 30),
                  _buildImageCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StepCounter()),
                      );
                    },
                    isAnimation: true,
                    assetPath: 'assets/Steps.json', 
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildImageCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ComingSoon()),
                      );
                    },
                    isAnimation: true,
                    assetPath: 'assets/Comingsoon.json', 
                  ),
                  SizedBox(width: 30),
                  _buildImageCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    isAnimation: true,
                    assetPath: 'assets/Logout.json', 
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCard({
    required VoidCallback onTap,
    required bool isAnimation,
    required String assetPath,
  }) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: isAnimation
              ? Lottie.asset(
                  assetPath,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  assetPath,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}