import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constants/app_colors.dart';

class DateField extends StatelessWidget {
  const DateField({super.key, required this.value, required this.onTap});

  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(14),

      child: Container(
        height: 48,
        width: 390,

        padding: const EdgeInsets.symmetric(horizontal: 10),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues( alpha:.15),
              blurRadius: 5,
              spreadRadius: 0,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Row(
          children: [
            Expanded(
              child: Text(
                value,

                style: TextStyle(
                  color: value == "Select date" ? Colors.grey : Colors.black,

                  fontSize: 15,
                ),
              ),
            ),

            // const Icon(
            //   Icons.calendar_today_outlined,
            //   color: AppColors.primary,
            //   size: 20,
            // ),
            SvgPicture.asset(
              "assets/images/calendar.svg",
              width: 18,
              height: 18,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
