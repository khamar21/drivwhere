import 'package:drivehere/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TripTypeRow extends StatelessWidget {
  const TripTypeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
                ],
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.primary,
                        child: SvgPicture.asset(
                         // "assets/images/rphp.svg",
                          "assets/images/roundtrip.svg",
                          width: 10,
                          height: 10,
                         colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Round Trip",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),

     
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
                ],
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.primary,
                        child: SvgPicture.asset(
                          "assets/images/pndhp.svg",
                          width: 18,
                          height: 18,
                         // colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                         color: AppColors.background,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Pick up &\nDrop",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Daily
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
                ],
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.primary,
                        child: Icon(Icons.access_time, color: Colors.white, size: 20),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Daily",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Monthly
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
                ],
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.primary,
                         child: SvgPicture.asset(
                          "assets/images/calender.svg",
                          width: 18,
                          height: 18,
                         // colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Monthly",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}