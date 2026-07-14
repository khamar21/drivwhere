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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  left: size.width * .05,
                  right: size.width * .05,
                  bottom: size.height * .03,
                  top: size.height * .02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * .08),

                    /// Logo
                    Image.asset(
                      "assets/images/logo.png",
                      width: size.width * .16,
                    ),

                    SizedBox(height: size.height * .05),

                    /// Title
                    Text(
                      "Create Password",
                      style: TextStyle(
                        fontSize: size.width * .10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),

                    SizedBox(height: size.height * .008),

                    Text(
                      "Enter password to secure your account.",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: size.width * .036,
                      ),
                    ),

                    SizedBox(height: size.height * .05),

                    CustomPasswordField(
                      controller: passwordController,
                      labelText: "Password",
                      hintText: "Enter Password",
                    ),

                    SizedBox(height: size.height * .03),

                    CustomPasswordField(
                      controller: confirmPasswordController,
                      labelText: "Confirm Password",
                      hintText: "Re-enter Password",
                      textInputAction: TextInputAction.done,
                    ),

                    SizedBox(height: size.height * .25),

                    CustomButton(text: "Confirm", onPressed: _createPassword),

                    SizedBox(height: size.height * .03),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
