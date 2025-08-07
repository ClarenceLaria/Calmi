import 'package:calmi_app/features/social_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 40),
              Column(
                children: [
                  Image.asset('assets/logo.png', height: 60), // 🍀 Your logo here
                  const SizedBox(height: 32),
                  const Text(
                    "Let's Get Started!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Let's dive in into your account",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const SocialButton(
                    icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                    text: 'Continue with Google',
                  ),
                  const SizedBox(height: 12),
                  const SocialButton(
                    icon: FaIcon(FontAwesomeIcons.apple, color: Colors.black),
                    text: 'Continue with Apple',
                  ),
                  const SizedBox(height: 12),
                  const SocialButton(
                    icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                    text: 'Continue with Facebook',
                  ),
                  const SizedBox(height: 12),
                  const SocialButton(
                    icon: FaIcon(FontAwesomeIcons.xTwitter, color: Colors.black),
                    text: 'Continue with X',
                  ),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to signup
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9BB774),
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("Sign up"),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to login
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Color(0xFF9BB774),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Privacy Policy"),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Text("·", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Text("Terms of Service"),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
