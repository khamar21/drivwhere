import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/constants/app_colors.dart';

class TimeBox extends StatefulWidget {
  const TimeBox({
    super.key,
    required this.controller,
    this.width = 70,
    this.min = 0,
    this.max = 59,
    this.onChanged,
  });

  final TextEditingController controller;
  final double width;
  final int min;
  final int max;
  final ValueChanged<int>? onChanged;

  @override
  State<TimeBox> createState() => _TimeBoxState();
}

class _TimeBoxState extends State<TimeBox> {
  int get _currentValue => int.tryParse(widget.controller.text) ?? widget.min;

  void _setValue(int newValue) {
    final clamped = newValue.clamp(widget.min, widget.max);
    widget.controller.text = clamped.toString().padLeft(2, '0');
    widget.onChanged?.call(clamped);
    setState(() {});
  }

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
          SizedBox(
            width: 30,
            child: TextField(
              controller: widget.controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 2,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
              ],
              onChanged: (v) {
                final parsed = int.tryParse(v);
                if (parsed != null) widget.onChanged?.call(parsed);
              },
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
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
                onTap: () => _setValue(_currentValue + 1),
                child: const Icon(Icons.keyboard_arrow_up, size: 16, color: Colors.grey),
              ),
              InkWell(
                onTap: () => _setValue(_currentValue - 1),
                child: const Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}