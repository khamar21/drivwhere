import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class VehicleSection extends StatelessWidget {
  const VehicleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.local_taxi_outlined,
          color: AppColors.primary,
          size: 22,
        ),

        const SizedBox(width: 8),

        const Expanded(
          child: Text(
            "Select Your Vehicle",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),

        SizedBox(
          width: 100,
          height: 42,
          child: OutlinedButton.icon(
            onPressed: () {},

            icon: const Icon(
              Icons.add_circle_outline,
              size: 18,
              color: AppColors.primary,
            ),

            label: const Text(
              "Add",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),

            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xFF9A0003).withValues(alpha: 0.1),

              side: const BorderSide(color: AppColors.primary),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
