import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool isLoading = false;

  Future<void> resetPassword() async {
    if (passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields"),
        ),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match"),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password Created Successfully"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffFFF6E8),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 20,
          ),
          child: Column(
            children: [

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: 20),

                      Image.asset(
                        "assets/images/logo.png",
                        height: 55,
                      ),

                      const SizedBox(height: 35),

                      const Text(
                        "Create Password",
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff980000),
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Enter password to secure your account.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(height: 40),

                      const Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextField(
                        controller: passwordController,
                        obscureText: obscurePassword,
                        decoration: InputDecoration(
                          hintText: "Enter Password",

                          filled: true,
                          fillColor: Colors.white,

                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),

                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                            icon: Icon(
                              obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.grey,
                            ),
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xff980000),
                            ),
                          ),
                        ),
                      ),


                      const SizedBox(height: 30),

                                const Text(
                                "Confirm Password",
                                style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                ),
                                ),

                                const SizedBox(height: 10),

                                TextField(
                                controller: confirmPasswordController,
                                obscureText: obscureConfirmPassword,
                                decoration: InputDecoration(
                                hintText: "Re-enter Password",

                                filled: true,
                                fillColor: Colors.white,

                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),

                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscureConfirmPassword = !obscureConfirmPassword;
                                    });
                                  },
                                  icon: Icon(
                                    obscureConfirmPassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Colors.grey,
                                  ),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Color(0xff980000),
                                  ),
                                ),
                                ),
                                ),

                                const SizedBox(height: 50),

                                ],
                                ),
                                ),
                                ),

                                SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: ElevatedButton(
                                onPressed: isLoading ? null : resetPassword,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff980000),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: isLoading
                                    ? const SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : const Text(
                                        "Confirm",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                ),
                                ),

                                const SizedBox(height: 10),

                                ],
                                ),
                                ),
                                ),
                                );
                                }
                                }