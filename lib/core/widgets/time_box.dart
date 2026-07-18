import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class TimeBox extends StatelessWidget {
  const TimeBox({super.key, required this.value, this.onTap, this.width = 70});

  final String value;
  final VoidCallback? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 73,
        height: 47,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 6),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 1, height: 25, color: Colors.grey.shade300),
              ],
            ),
            const SizedBox(width: 3,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.keyboard_arrow_up, size: 16, color: Colors.grey),
                Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
