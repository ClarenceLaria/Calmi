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
              _buildTextField(
                label: "Email",
                icon: Icons.email_outlined,
              ),

              const SizedBox(height: 15),

              // Password Field
              _buildTextField(
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

              const SizedBox(height: 10),

              // Sign in link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
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
                  _buildSocialIcon(FaIcon(FontAwesomeIcons.google, color: Colors.red)),
                  _buildSocialIcon(FaIcon(FontAwesomeIcons.apple, color: Colors.black)),
                  _buildSocialIcon(FaIcon(FontAwesomeIcons.facebook, color: Colors.blue)),
                  _buildSocialIcon(FaIcon(FontAwesomeIcons.xTwitter, color: Colors.black)),
                ],
              ),

              const Spacer(),

              // Sign up button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Sign up",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    bool obscureText = false,
    IconData? suffixIcon,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, size: 20),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: 20) : null,
        hintText: label,
        filled: true,
        fillColor: const Color(0xFFF7F7F7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
      ),
    );
  }

  Widget _buildSocialIcon(Widget icon) {
    return Container(
      height: 48,
      width: 48,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: icon,
    );
  }
}
