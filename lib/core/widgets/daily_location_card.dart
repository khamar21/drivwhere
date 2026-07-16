import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class DailyLocationCard extends StatelessWidget {
  const DailyLocationCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(16),

        boxShadow: [

          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
          )

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
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  "Vytilla",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}