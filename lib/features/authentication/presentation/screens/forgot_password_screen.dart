import 'package:drivehere/core/routes/route_names.dart';
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

  void _onConfirm() {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email or phone number")),
      );
      return;
    }

    Navigator.pushNamed(context, RouteNames.verification, arguments: true);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffFFF4D8),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * .06,
                  vertical: size.height * .02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * .08),

                    /// Logo
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: size.width * .16,
                      ),
                    ),

                    SizedBox(height: size.height * .04),

                    /// Heading
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontSize: size.width * .10,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff990000),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * .005),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enter registered email id or phone no.",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: size.width * .035,
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * .045),

                    /// Label
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email or Phone no.",
                        style: TextStyle(
                          fontSize: size.width * .043,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * .012),

                    /// TextField
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                            color: Colors.black.withOpacity(.15),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: emailController,
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

                    SizedBox(height: size.height * .05),

                    /// Login Text
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Already have an account? ",
                            style: TextStyle(fontSize: size.width * .041),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              color: const Color(0xffB30000),
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * .041,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * .30),

                    /// Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffB30000),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _onConfirm,
                        child: const Text(
                          "Confirm",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),

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
