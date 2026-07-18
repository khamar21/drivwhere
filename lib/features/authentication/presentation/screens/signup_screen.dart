import 'package:drivehere/core/routes/route_names.dart';
import 'package:drivehere/core/widgets/custom_button.dart';
import 'package:drivehere/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';

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
      backgroundColor: AppColors.bg,
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

                    Center(
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 72,
                        height: 72,
                      ),
                    ),

                    SizedBox(height: 2),

                    Center(
                      child: Text(
                        "Create an account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.085,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      "Join us today and start enjoying our\nservices",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        height: 1.3,
                      ),
                    ),

                    SizedBox(height: size.height * .04),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(size.width * .05),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                          SizedBox(height: size.height * .03),

                          Text(
                            "Email or Phone no.",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: size.height * .010),

                          CustomTextField(
                            controller: emailController,
                            hintText: "Enter email or phone no",
                            keyboardType: TextInputType.emailAddress,
                          ),

                          SizedBox(height: size.height * .015),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: isChecked
                                        ? const Color(0xffB00000)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: const Color(0xffD0D0D0),
                                      // width: 2,
                                    ),
                                  ),
                                  child: isChecked
                                      ? const Icon(
                                          Icons.check,
                                          size: 10,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),

                                const SizedBox(width: 6),

                                Expanded(
                                  child: RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,

                                        // fontWeight: FontWeight.w400,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Do you agree to Drivwheres ",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        TextSpan(
                                          text: "Terms & conditions",
                                          style: TextStyle(
                                            color: Color(0xffB00000),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: size.height * .050),

                          Row(
                            children: [
                              const Expanded(child: Divider(thickness: 1)),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
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

                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 38,
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Color(0xFFFAFAFA),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      side: const BorderSide(
                                        color: Color(0xFFD9D9D9),
                                        width: 1,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/google.svg",
                                          width: 14,
                                          height: 14,
                                        ), // Image.asset(
                                        //   "assets/images/google.png",
                                        //   width: 15,
                                        //   height: 15,
                                        // ),
                                        const SizedBox(width: 2),
                                        Flexible(
                                          child: Text(
                                            "Continue with Google",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: const Color(0xFF666666),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 3),

                              Expanded(
                                child: SizedBox(
                                  height: 38,

                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Color(0xFFFAFAFA),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 2,
                                      ),
                                      side: const BorderSide(
                                        color: Color(0xFFD9D9D9),
                                        width: 1,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.apple,
                                          size: 16,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(width: 1),
                                        Text(
                                          "Continue with Apple",
                                          style: TextStyle(
                                            color: Color(0xFF666666),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
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
                                  fontSize: 14,
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
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
