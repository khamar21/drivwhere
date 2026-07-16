import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class TimeBox extends StatelessWidget {
  const TimeBox({
    super.key,
    required this.value,
    required this.onTap,
    this.isSelected = false,
    this.width = 72,
    this.height = 48,
  });

  final String value;
  final VoidCallback onTap;
  final bool isSelected;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: width,
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? AppColors.primary
                  : const Color(0xffE5E5E5),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.08),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? Colors.white
                          : AppColors.primary,
                    ),
                  ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.keyboard_arrow_up,
                    size: 14,
                    color: isSelected
                        ? Colors.white
                        : Colors.grey,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 14,
                    color: isSelected
                        ? Colors.white
                        : Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}