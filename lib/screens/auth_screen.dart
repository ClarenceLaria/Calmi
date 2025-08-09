import 'package:calmi_app/features/social_button.dart';
import 'package:calmi_app/screens/signup_screen.dart';
import 'package:calmi_app/widgets/entry_point.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset('assets/icons/logo-icon.png', height: 60), 
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
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                    },  
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),                  
                    child: const Text("Sign up"),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EntryPoint(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255,152,175,98).withAlpha(50),
                      foregroundColor: const Color(0xFF9BB774),
                      shadowColor: Colors.transparent,
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Color(0xFF9BB774),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Privacy Policy", 
            style: TextStyle(
              color: Colors.grey, 
              fontSize: Theme.of(context).textTheme.bodySmall?.fontSize
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Text("·", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Text("Terms of Service", 
            style: TextStyle(
              color: Colors.grey, 
              fontSize: Theme.of(context).textTheme.bodySmall?.fontSize
              ),
            ),
          ],
        ),
      ),
    );
  }
}
