import 'package:drivehere/core/routes/route_names.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_password_field.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _createPassword() {
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter both password fields")),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      return;
    }

    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteNames.login,
      (route) => false,
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
                  SizedBox(height: constraints.maxHeight * .08),

                  Image.asset(
                    "assets/images/logo.png",
                    width: constraints.maxWidth * .16,
                  ),

                  SizedBox(height: constraints.maxHeight * .03),

                  Text(
                    "Create Password",
                    style: TextStyle(
                      fontSize: constraints.maxWidth * .08,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),

                  SizedBox(height: constraints.maxHeight * .004),

                  Text(
                    "Enter password to secure your account.",
                    style: TextStyle(
                      fontSize: constraints.maxWidth * .040,
                      color: const Color(0xFF787878),
                    ),
                  ),

                  SizedBox(height: constraints.maxHeight * .05),

                  CustomPasswordField(
                    controller: passwordController,
                    labelText: "Password",
                    hintText: "Enter Password",
                  ),

                  SizedBox(height: constraints.maxHeight * .03),

                  CustomPasswordField(
                    controller: confirmPasswordController,
                    labelText: "Confirm Password",
                    hintText: "Re-enter Password",
                    textInputAction: TextInputAction.done,
                  ),

                  const Spacer(),

                  CustomButton(text: "Confirm", onPressed: _createPassword),

                  SizedBox(height: constraints.maxHeight * .03),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
