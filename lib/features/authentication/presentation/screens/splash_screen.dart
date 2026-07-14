import 'package:drivehere/core/routes/route_names.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .05),
          child: Column(
            children: [
              const Spacer(),

              
              Image.asset("assets/images/logo.png", width: size.width * .50),

              const Spacer(),

              /// Login Button
              CustomButton(
                text: "Log In",
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.login);
                },
              ),

              SizedBox(height: size.height * .015),

              /// Sign Up Button
              SizedBox(
                width: double.infinity,
                height: size.height * .065,
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
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: size.height * .06),
            ],
          ),
        ),
      ),
    );
  }
}
