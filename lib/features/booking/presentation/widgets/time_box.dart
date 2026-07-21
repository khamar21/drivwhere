import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';

class PeriodBox extends StatelessWidget {
  const PeriodBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.width = 70,
  });

  final String value; // "AM" or "PM"
  final ValueChanged<String> onChanged;
  final double width;

  void _toggle() => onChanged(value == "AM" ? "PM" : "AM");

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 73,
      height: 47,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .08),
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
              fontSize: 18,
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
          const SizedBox(width: 3),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: _toggle,
                child: const Icon(Icons.keyboard_arrow_up, size: 16, color: Colors.grey),
              ),
              InkWell(
                onTap: _toggle,
                child: const Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}