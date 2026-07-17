import 'package:flutter/material.dart';

//im///port 'package:flutter/lib/core/constants/app_colors.dart';



class EstimateCard extends StatelessWidget {
  const EstimateCard({
    super.key,
    this.vehicle = "--",
    this.days = "--",
    this.amount = "₹ 0",
  });

  final String vehicle;
  final String days;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          _row("Vehicle", vehicle),
          const SizedBox(height: 15),
          _row("Days", days),
          const SizedBox(height: 15),
          const Divider(),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Estimated Amount",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              Text(
                amount,
                style: const TextStyle(
                 // color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 15)),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ],
    );
  }
}