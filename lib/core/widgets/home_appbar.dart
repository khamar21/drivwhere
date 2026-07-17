import 'package:flutter/material.dart';
import '../constants/app_colors.dart'; // adjust path as needed

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
    this.onNotificationTap,
  });

  final VoidCallback? onNotificationTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: size.width * .10,
        ),
        Image.asset(
          "assets/images/dvrlogo.png",
          width: size.width * .30,
        ),
        GestureDetector(
          onTap: onNotificationTap,
          child: const Icon(
            Icons.notifications_none_rounded,
            color: AppColors.primary,
            size: 25,
          ),
        ),
      ],
    );
  }
}