import 'package:drivehere/core/constants/app_colors.dart';
import 'package:drivehere/core/routes/route_names.dart';
import 'package:drivehere/features/authentication/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: size.height * .02),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * .05),

                      /// Logo
                      Center(
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: size.height * .08,
                        ),
                      ),

                      SizedBox(height: size.height * .01),

                      Center(
                        child: Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontSize: size.width * .09,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),

                      SizedBox(height: size.height * .01),

                      Center(
                        child: Text(
                          "Join us today and start enjoying our services.",
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: size.width * .04,
                            height: 1.5,
                          ),
                        ),
                      ),

                      SizedBox(height: size.height * .04),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(size.width * .06),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(size.width * .05),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.05),
                              blurRadius: 12,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: size.width * .07,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),

                            SizedBox(height: size.height * .03),

                            Text(
                              "Email or Phone no.",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * .042,
                              ),
                            ),

                            SizedBox(height: size.height * .012),

                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(
                                  size.width * .03,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.08),
                                    blurRadius: 16,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: "Enter email",
                                  filled: true,
                                  fillColor: AppColors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: size.width * .05,
                                    vertical: size.height * .022,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      size.width * .03,
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      size.width * .03,
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      size.width * .03,
                                    ),
                                    borderSide: BorderSide(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: size.height * .01),

                            Text(
                              "Password",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * .042,
                              ),
                            ),

                            SizedBox(height: size.height * .012),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(
                                  size.width * .03,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.08),
                                    blurRadius: 16,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: passwordController,
                                obscureText: auth.obscurePassword,
                                decoration: InputDecoration(
                                  hintText: "Enter password",
                                  filled: true,
                                  fillColor: AppColors.white,

                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: size.width * .05,
                                    vertical: size.height * .022,
                                  ),

                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      context
                                          .read<AuthProvider>()
                                          .togglePassword();
                                    },
                                    icon: Icon(
                                      auth.obscurePassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      size: size.width * .055,
                                    ),
                                  ),

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      size.width * .03,
                                    ),
                                    borderSide: BorderSide.none,
                                  ),

                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      size.width * .03,
                                    ),
                                    borderSide: BorderSide.none,
                                  ),

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      size.width * .03,
                                    ),
                                    borderSide: BorderSide(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: size.height * .01),

                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteNames.forgotPassword,
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: size.width * .038,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: size.height * .008),

                            Row(
                              children: [
                                Expanded(
                                  child: Divider(color: Colors.grey.shade300),
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .03,
                                  ),
                                  child: Text(
                                    "OR",
                                    style: TextStyle(
                                      fontSize: size.width * .04,
                                      color: AppColors.textSecondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: Divider(color: Colors.grey.shade300),
                                ),
                              ],
                            ),

                            SizedBox(height: size.height * .025),

                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: size.height * .06,
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        side: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            size.width * .030,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: size.width * .03,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.google,
                                            color: Colors.red,
                                            size: size.width * .045,
                                          ),
                                          SizedBox(width: size.width * .02),
                                          Flexible(
                                            child: Text(
                                              "Continue with Google",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: size.width * .026,
                                                color: AppColors.textPrimary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: size.width * .025),
                                Expanded(
                                  child: SizedBox(
                                    height: size.height * .06,
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        side: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            size.width * .030,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: size.width * .03,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.apple,
                                            color: Colors.black,
                                            size: size.width * .055,
                                          ),
                                          SizedBox(width: size.width * .02),
                                          Flexible(
                                            child: Text(
                                              "Continue with Apple",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: size.width * .026,
                                                color: AppColors.textPrimary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * .03),

                            SizedBox(
                              width: double.infinity,
                              height: size.height * .07,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      size.width * .03,
                                    ),
                                  ),
                                ),
                                onPressed: auth.isLoading
                                    ? null
                                    : () async {
                                        await context
                                            .read<AuthProvider>()
                                            .login();
                                      },
                                child: auth.isLoading
                                    ? SizedBox(
                                        height: size.width * .055,
                                        width: size.width * .055,
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        "Log In",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * .045,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),

                            SizedBox(height: size.height * .03),

                            Center(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: size.width * .038,
                                  ),
                                  children: [
                                    const TextSpan(
                                      text: "Don't have an account? ",
                                    ),
                                    WidgetSpan(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            RouteNames.signup,
                                          );
                                        },
                                        child: Text(
                                          "Create here",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.width * .038,
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
            ),
          ],
        ),
      ),
    );
  }
}
