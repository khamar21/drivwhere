import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/app_colors.dart'; // adjust path as needed

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key, this.onNotificationTap});

  final VoidCallback? onNotificationTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: size.width * 0.14,
          height: size.width * 0.14,
        ),
        Image.asset(
          "assets/images/dvrlogo.png",
          width: size.width * 0.38,
          height: size.height * 0.04,
        ),
        GestureDetector(
          onTap: onNotificationTap,
          child: SvgPicture.asset(
            'assets/images/bell_icon.svg',
            width: 25,
            height: 25,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
