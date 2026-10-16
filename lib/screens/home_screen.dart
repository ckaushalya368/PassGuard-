import 'package:flutter/material.dart';

import '../utils/password_checker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPasswordVisible = false;
  final TextEditingController passwordController = TextEditingController();

  String passwordStrength = "";

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Icon
                const Icon(
                  Icons.security,
                  size: 80,
                  color: Colors.purpleAccent,
                ),

                const SizedBox(height: 20),

                // App Name
                const Text(
                  "PassGuard",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Check your password strength",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),

                const SizedBox(height: 40),

                // Password Input
                TextField(
                  controller: passwordController,

                  onChanged: (value) {
                    setState(() {
                      passwordStrength = "";
                    });
                  },
                  obscureText: !isPasswordVisible,

                  decoration: InputDecoration(
                    labelText: "Enter Password",
                    hintText: "Type your password",

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),

                      onPressed: () {
                        String password = passwordController.text;
                        String result = checkPasswordStrength(password);

                        setState(() {
                          passwordStrength = result;
                        });

                        setState(() {
                          passwordStrength = result;
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Check Button
                // Check Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      String password = passwordController.text;

                      String result = checkPasswordStrength(password);

                      setState(() {
                        passwordStrength = result;
                      });
                    },
                    child: const Text(
                      "Check Strength",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                // Space between button and result
                const SizedBox(height: 20),

                // Display Password Strength
                if (passwordStrength.isNotEmpty)
                  Text(
                    passwordStrength == "Please enter a password"
                        ? passwordStrength
                        : "Password Strength: $passwordStrength",

                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                      color: passwordStrength == "Strong"
                          ? Colors.green
                          : passwordStrength == "Medium"
                          ? Colors.orange
                          : Colors.red,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
