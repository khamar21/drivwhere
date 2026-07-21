import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class DailyLocationCard extends StatelessWidget {
  const DailyLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 86,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(8),

        boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .15),
              blurRadius: 5,
              spreadRadius: 0,
              offset: const Offset(0, 5),
            ),
          ],
      ),

      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,

            decoration: BoxDecoration(
              color: const Color(0xffF8E9E9),
              borderRadius: BorderRadius.circular(8),
              
            ),

            child: const Icon(
              Icons.location_on_outlined,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(width: 15),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "Pick Up Location",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),

                SizedBox(height: 4),

                Text(
                  "Vytilla",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color:AppColors.textSecondary ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
