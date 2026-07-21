import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
// import 'package:iconify_flutter/iconify_flutter.dart';
// import 'package:iconify_flutter/icons/hugeicons.dart';

class VehicleSection extends StatelessWidget {
  const VehicleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/vehicle.svg',
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(
            Color(0xffB00000),
            BlendMode.srcIn,
          ),
        ),

        //         Iconify(
        //   Hugeicons.car03,
        //   size: 24,
        //   color: Colors.red,
        // )
        const SizedBox(width: 8),

        const Expanded(
          child: Text(
            "Select Your Vehicle",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),

        SizedBox(
          width: 90,
          height: 40,
          child: OutlinedButton.icon(
            onPressed: () {},

            icon: const Icon(
              Icons.add_circle_outline,
              size: 18,
              color: AppColors.primary,
            ),

            label: const Text(
              "Add",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),

            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xFF9A0003).withValues(alpha: .1),
              side: const BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ),
      ],
    );
  }
}
