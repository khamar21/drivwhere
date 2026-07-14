import 'package:drivehere/core/routes/route_names.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key, this.isResetPasswordFlow = false});

  final bool isResetPasswordFlow;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  Widget otpBox(int index, Size size) {
    return SizedBox(
      width: size.width * .15,
      child: TextField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(
          fontSize: size.width * .07,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          counterText: "",
          hintText: "-",
          hintStyle: TextStyle(
            fontSize: size.width * .08,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: size.height * .022),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).requestFocus(focusNodes[index + 1]);
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(focusNodes[index - 1]);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffFFF4D8),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * .05,
                  vertical: size.height * .02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * .08),
                    Image.asset(
                      "assets/images/logo.png",
                      width: size.width * .16,
                    ),
                    SizedBox(height: size.height * .05),

                    Text(
                      "Verify Account",
                      style: TextStyle(
                        fontSize: size.width * .10,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff990000),
                      ),
                    ),

                    SizedBox(height: size.height * .008),

                    Text(
                      "An OTP will be sent to you.",
                      style: TextStyle(
                        fontSize: size.width * .035,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: size.height * .05),

                    /// OTP Boxes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        4,
                        (index) => otpBox(index, size),
                      ),
                    ),

                    SizedBox(height: size.height * .02),

                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: size.width * .04,
                          color: Colors.black,
                        ),
                        children: const [
                          TextSpan(text: "Your OTP will expire in "),
                          TextSpan(
                            text: "1:26 sec",
                            style: TextStyle(
                              color: Color(0xffC00000),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: size.height * .30),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffB00000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (widget.isResetPasswordFlow) {
                            Navigator.pushNamed(
                              context,
                              RouteNames.resetPassword,
                            );
                          } else {
                            Navigator.pushNamed(
                              context,
                              RouteNames.createPassword,
                            );
                          }
                        },
                        
                        child: const Text(
                          "Verify",
                          style: TextStyle(
                            color: Colors.white,
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
