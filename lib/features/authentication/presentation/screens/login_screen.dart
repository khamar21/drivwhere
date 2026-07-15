import 'package:drivehere/core/constants/app_colors.dart';
import 'package:drivehere/core/routes/route_names.dart';
import 'package:drivehere/features/authentication/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: AppColors.bg,
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

                      Center(
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: size.width * .18,
                        ),
                      ),

                      SizedBox(height: size.height * .02),

                      Center(
                        child: Text(
                          "Welcome back!",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),

                      SizedBox(height: size.height * .01),

                      Center(
                        child: Text(
                          "Join us today and start enjoying\nour services.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: size.width * 0.038,
                            height: 1.3,
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

                            SizedBox(height: size.height * .010),
                            SizedBox(
                              height: 48, // Figma height
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.15,
                                      ),
                                      blurRadius: 12,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  controller: emailController,
                                  style: const TextStyle(fontSize: 16),
                                  decoration: InputDecoration(
                                    hintText: "Enter email",
                                    hintStyle: const TextStyle(
                                      color: Color(0xFF9E9E9E),
                                      fontSize: 16,
                                    ),

                                    filled: true,
                                    fillColor: Colors.white,

                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),

                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),

                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),

                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: AppColors.primary,
                                        width: 1,
                                      ),
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

                            SizedBox(height: size.height * .010),

                            SizedBox(
                              height: 48,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.15,
                                      ),
                                      blurRadius: 10,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: auth.obscurePassword,
                                  style: const TextStyle(fontSize: 16),
                                  decoration: InputDecoration(
                                    hintText: "Enter password",
                                    hintStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF9E9E9E),
                                    ),

                                    filled: true,
                                    fillColor: AppColors.white,

                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
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
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                    ),

                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),

                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),

                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: AppColors.primary,
                                        width: 1,
                                      ),
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
                                    fontSize: size.width * .035,
                                    fontWeight: FontWeight.w400,
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
                                      fontSize: 14,
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
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/google.png",
                                            width: 15,
                                            height: 15,
                                          ),
                                          const SizedBox(width: 2),
                                          Flexible(
                                            child: Text(
                                              "Continue with Google",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: const Color(0xFF666666),
                                                fontSize: size.width * .028,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 4),

                                Expanded(
                                  child: SizedBox(
                                    height: 38,
                                    width: 60,
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
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.apple,
                                            size: 18,
                                            color: Colors.black,
                                          ),
                                          const SizedBox(width: 0),
                                          Flexible(
                                            child: Text(
                                              "Continue with Apple",
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: const Color(0xFF666666),
                                                fontSize: size.width * .028,
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
                              height: size.height * .06,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      size.width * .02,
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
                                          fontSize: 16,
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
                                    fontSize: size.width * .035,
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
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * .035,
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
