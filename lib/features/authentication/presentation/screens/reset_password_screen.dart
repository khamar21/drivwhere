import 'package:drivehere/core/constants/app_colors.dart';
import 'package:drivehere/core/routes/route_names.dart';
import 'package:drivehere/core/widgets/custom_button.dart';
import 'package:drivehere/core/widgets/custom_password_field.dart';
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

  // bool _obscurePassword = true;
  // bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  void _createPassword() {
  Navigator.pushNamedAndRemoveUntil(
    context,
    RouteNames.login,
    (route) => false,
  );
}

  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         label,
  //         style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  //       ),

  //       const SizedBox(height: 10),

  //       Container(
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(8),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.black.withOpacity(.10),
  //               blurRadius: 10,
  //               offset: const Offset(0, 4),
  //             ),
  //           ],
  //         ),
  //         child: TextField(
  //           controller: controller,
  //           obscureText: obscureText,
  //           style: const TextStyle(fontSize: 14),
  //           decoration: InputDecoration(
  //             hintText: hint,
  //             hintStyle: TextStyle(color: Colors.grey.shade500),
  //             border: InputBorder.none,
  //             contentPadding: const EdgeInsets.symmetric(
  //               horizontal: 18,
  //               vertical: 18,
  //             ),
  //             // suffixIcon: IconButton(
  //             //   onPressed: onTap,
  //             //   icon: Icon(
  //             //     obscureText
  //             //         ? Icons.visibility_off_outlined
  //             //         : Icons.visibility_outlined,
  //             //     color: Colors.grey,
  //             //     size: 20,
  //             //   ),
  //             // ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

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
                  Image.asset("assets/images/logo.png", width: 72, height: 72),
                  SizedBox(height: constraints.maxHeight * .035),
                  Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff990000),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Enter password to secure your account.",
                    style: TextStyle(
                      color: const Color(0xFF787878),
                      fontSize: 12,
                    ),
                  ),

                  SizedBox(height: constraints.maxHeight * .03),
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
                 //  SizedBox(height: constraints.maxHeight * .03),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
