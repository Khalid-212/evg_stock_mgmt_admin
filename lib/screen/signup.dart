import 'package:evg_stock_mgmt_admin/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Let's get",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "started",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),

                // Input fields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      // Email field
                      const CustomInput(
                        cardWidth: 20,
                        hintText: 'Enter your email',
                        icon: Icons.email,
                        obscureText: false,
                      ),
                      const SizedBox(height: 24), // Space between fields
                      // Password field
                      const CustomInput(
                        cardWidth: 300,
                        hintText: 'Enter your phone number',
                        obscureText: false,
                        icon: Icons.phone,
                      ),
                      const SizedBox(height: 24),
                      // const SizedBox(height: 24), // Space between fields
                      // Password field
                      const CustomInput(
                        cardWidth: 20,
                        hintText: 'Enter your password',
                        obscureText: true,
                        icon: Icons.lock,
                      ),
                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0080F6),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text('Sign up'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30), // Space before footer
                // Footer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Color(0xFF0080F6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
