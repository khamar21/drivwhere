import 'package:drivehere/core/routes/route_names.dart';
import 'package:drivehere/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();

  bool isChecked = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
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
                  children: [
                    SizedBox(height: size.height * .05),

                    Image.asset(
                      "assets/images/logo.png",
                      width: size.width * .16,
                    ),

                    SizedBox(height: size.height * .03),

                    /// Title
                    Text(
                      "Create an account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * .095,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Join us today and start enjoying our\nservices",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * .045,
                        color: Colors.black54,
                      ),
                    ),

                    SizedBox(height: size.height * .04),

                    /// White Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(size.width * .05),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Sign Up
                          Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: size.width * .085,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: size.height * .04),

                          /// Email Label
                          Text(
                            "Email or Phone no.",
                            style: TextStyle(
                              fontSize: size.width * .045,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: size.height * .015),

                          /// TextField
                          CustomTextField(
                            controller: emailController,
                            hintText: "Enter email or phone no",
                            keyboardType: TextInputType.emailAddress,
                          ),

                          SizedBox(height: size.height * .015),

                          /// Checkbox Row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: isChecked,
                                activeColor: AppColors.primary,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),

                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 14),
                                  child: RichText(
                                   // softWrap: false,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: size.width * .030,
                                      ),
                                      children: const [
                                        TextSpan(
                                          text: "Do you agree to Drivewheres ",
                                        ),

                                        TextSpan(
                                          text: "Terms & conditions",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: size.height * .025),

                          /// OR Divider
                          Row(
                            children: [
                              const Expanded(child: Divider(thickness: 1)),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: Text(
                                  "OR",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),

                              const Expanded(child: Divider(thickness: 1)),
                            ],
                          ),

                          SizedBox(height: size.height * .03),

                          // =======================
                          // Social Login Buttons
                          // =======================
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 48,
                                  child: OutlinedButton.icon(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      minimumSize: const Size(
                                        double.infinity,
                                        48,
                                      ),
                                      side: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    icon: const FaIcon(
                                      FontAwesomeIcons.google,
                                      color: Colors.red,
                                      size: 18,
                                    ),
                                    label: Flexible(
                                      child: Text(
                                        "Continue with Google",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * .03),
                              Expanded(
                                child: SizedBox(
                                  height: 48,
                                  child: OutlinedButton.icon(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      minimumSize: const Size(
                                        double.infinity,
                                        48,
                                      ),
                                      side: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    icon: const Icon(
                                      Icons.apple,
                                      color: Colors.black,
                                      size: 22,
                                    ),
                                    label: Flexible(
                                      child: Text(
                                        "Continue with Apple",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: size.height * .05),

                          CustomButton(
                            text: "Sign Up",
                            onPressed: () {
                              final input = emailController.text.trim();

                              if (input.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Please enter email or phone number",
                                    ),
                                  ),
                                );
                                return;
                              }

                              Navigator.pushNamed(
                                context,
                                RouteNames.verification,
                              );
                            },
                          ),

                          SizedBox(height: size.height * .03),

                          Center(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: size.width * .042,
                                ),
                                children: [
                                  const TextSpan(
                                    text: "Already have an account? ",
                                  ),
                                  WidgetSpan(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Log In",
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * .03),
                        ],
                      ),
                    ),
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
