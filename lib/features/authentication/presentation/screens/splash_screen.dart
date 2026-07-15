import 'package:drivehere/core/routes/route_names.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * .05,
              ),
              child: Column(
                children: [
                  const Spacer(),

                  Image.asset(
                    "assets/images/logo.png",
                    width: constraints.maxWidth * .50,
                  ),

                  const Spacer(),

                  CustomButton(
                    text: "Log In",
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.login);
                    },
                  ),

                  SizedBox(height: constraints.maxHeight * .015),

                  SizedBox(
                    width: double.infinity,
                    height: constraints.maxHeight * .065,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.signup);
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: AppColors.primary,
                          width: 1.3,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: constraints.maxHeight * .06),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
