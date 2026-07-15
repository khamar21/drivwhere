import 'package:drivehere/core/constants/app_colors.dart';
import 'package:drivehere/core/routes/route_names.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Widget passwordField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 10),

        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.10),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.shade500),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 18,
              ),
              suffixIcon: IconButton(
                onPressed: onTap,
                icon: Icon(
                  obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.only(
                left: constraints.maxWidth * .05,
                right: constraints.maxWidth * .05,
                bottom: constraints.maxHeight * .03,
                top: constraints.maxHeight * .02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: constraints.maxHeight * .06),

                  Image.asset(
                    "assets/images/logo.png",
                    width: constraints.maxWidth * .16,
                  ),

                  SizedBox(height: constraints.maxHeight * .03),

                  Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: constraints.maxWidth * .10,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff990000),
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    "Enter password to secure your account.",
                    style: TextStyle(
                      color: const Color(0xFF787878),
                      fontSize: constraints.maxWidth * .040,
                    ),
                  ),

                  SizedBox(height: constraints.maxHeight * .05),

                  passwordField(
                    label: "Password",
                    hint: "Enter Password",
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    onTap: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),

                  SizedBox(height: constraints.maxHeight * .02),

                  passwordField(
                    label: "Confirm Password",
                    hint: "Re-enter Password",
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    onTap: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffB00000),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        final password = _passwordController.text.trim();
                        final confirmPassword = _confirmPasswordController.text
                            .trim();

                        if (password.isEmpty || confirmPassword.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Please enter both password fields",
                              ),
                            ),
                          );
                          return;
                        }

                        if (password != confirmPassword) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Passwords do not match"),
                            ),
                          );
                          return;
                        }

                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteNames.login,
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "Confirm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

               //   SizedBox(height: constraints.maxHeight * .03),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
