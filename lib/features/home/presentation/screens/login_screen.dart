import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 30),

                /// Logo
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.08),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.directions_car_filled,
                    color: Color(0xff8E1B1B),
                    size: 40,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff8E1B1B),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Sign in to continue using the app",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 35),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Text("Email"),

                      const SizedBox(height: 8),

                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          prefixIcon: const Icon(Icons.email_outlined),
                          filled: true,
                          fillColor: const Color(0xffF7F7F7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text("Password"),

                      const SizedBox(height: 8),

                      TextField(
                        controller: passwordController,
                        obscureText: obscurePassword,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                          ),
                          filled: true,
                          fillColor: const Color(0xffF7F7F7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color(0xff8E1B1B),
                            ),
                          ),
                        ),
                      ),

                      // Continue from here...
                    ],
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