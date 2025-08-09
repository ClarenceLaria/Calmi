import 'package:calmi_app/widgets/social_icon_button.dart';
import 'package:calmi_app/widgets/text_field.dart';
import 'package:calmi_app/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color.fromARGB(255, 152, 175, 98);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),

              const SizedBox(height: 10),

              // Title
              const Text(
                "Join Mindify Today ✨",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                "Start Your Journey to Better Mental Health",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),

              const SizedBox(height: 25),

              // Email Field
              CustomTextField(
                label: "Email",
                icon: Icons.email_outlined,
              ),

              const SizedBox(height: 15),

              // Password Field
              CustomTextField(
                label: "Password",
                icon: Icons.lock_outline,
                obscureText: true,
                suffixIcon: Icons.visibility_off,
              ),

              const SizedBox(height: 15),

              // Terms and Conditions
              Row(
                children: [
                  Checkbox(
                    activeColor: primaryColor,
                    value: true,
                    onChanged: (_) {},
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "I agree to Mindify ",
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Terms & Conditions.",
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // Sign in link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ", style: TextStyle(fontSize: 14)),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Divider with text
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or continue with",
                        style: TextStyle(color: Colors.grey[600])),
                  ),
                  const Expanded(child: Divider(thickness: 1)),
                ],
              ),

              const SizedBox(height: 20),

              // Social buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialIconButton(icon: FaIcon(FontAwesomeIcons.google, color: Colors.red)),
                  SocialIconButton(icon: FaIcon(FontAwesomeIcons.apple, color: Colors.black)),
                  SocialIconButton(icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue)),
                  SocialIconButton(icon: FaIcon(FontAwesomeIcons.xTwitter, color: Colors.black)),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 0.5),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AuthScreen())
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            ),
            child: Text(
              "Sign up",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }  
}
