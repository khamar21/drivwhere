import 'package:drivehere/core/constants/app_colors.dart';
import 'package:drivehere/core/routes/route_names.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}
class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
  // void _onConfirm() {
  //   final email = emailController.text.trim();

  //   if (email.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text("Please enter email or phone number")),
  //     );
  //     return;
  //   }

  //   Navigator.pushNamed(context, RouteNames.verification, arguments: true);
  // }
  void _onConfirm() {
  Navigator.pushNamed(
    context,
    RouteNames.verification,
    arguments: true,
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
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * .06,
                vertical: constraints.maxHeight * .02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: constraints.maxHeight * .06),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 72,
                      height: 72,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * .035),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),

                  SizedBox(height: constraints.maxHeight * .004),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enter registered email id or phone no.",
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color(0xFF787878),
                      ),
                    ),
                  ),

                  SizedBox(height: constraints.maxHeight * .045),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email or Phone no.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height: constraints.maxHeight * .012),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                          color: Colors.black.withValues(alpha: .10),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: emailController,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 18,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: constraints.maxHeight * .025),

                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 13, color: Colors.black),
                      children: [
                        const TextSpan(text: "Already have an account? "),
                        TextSpan(
                          text: "Log In",
                          style: const TextStyle(
                            color: Color(0xffB30000),
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
                            },
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffB30000),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _onConfirm,
                      child: const Text(
                        "Confirm",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  // SizedBox(height: constraints.maxHeight * .03),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
