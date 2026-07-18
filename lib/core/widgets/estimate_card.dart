import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class EstimateCard extends StatefulWidget {
  const EstimateCard({super.key});

  @override
  State<EstimateCard> createState() => _EstimateCardState();
}

class _EstimateCardState extends State<EstimateCard> {
  bool foodProvided = false;
  bool accommodationProvided = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  "Fee types",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              Expanded(
               flex: 3,
                child: Text(
                  "Per day",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              Expanded(
                child: Text(
                  "Days",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "2400",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          _feeRow(
            title: "Driver fee",
            perDay: "600",
            days: "4",
            total: "Total",
            totalColor: AppColors.primary,
          ),

          const SizedBox(height: 10),

          _feeRow(
            title: "Food Allowance",
            perDay: "600",
            days: "4",
            total: "2400",
            totalColor: AppColors.primary,
            checkbox: Checkbox(
              value: foodProvided,
              activeColor: AppColors.primary,
              onChanged: (v) {
                setState(() {
                  foodProvided = v!;
                });
              },
            ),
          ),

          const SizedBox(height: 10),

          _feeRow(
            title: "Accommodation",
            perDay: "0",
            days: "4",
            total: "0",
            totalColor: AppColors.primary,
            checkbox: Checkbox(
              value: accommodationProvided,
              activeColor: AppColors.primary,
              onChanged: (v) {
                setState(() {
                  accommodationProvided = v!;
                });
              },
            ),
          ),

          const SizedBox(height: 14),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: const [
          //     Text(
          //       "Total",
          //       style: TextStyle(
          //         color: AppColors.primary,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 18,
          //       ),
          //     ),
          //     Text(
          //       "4800 ₹",
          //       style: TextStyle(
          //         color: AppColors.primary,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 18,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _feeRow({
    required String title,
    required String perDay,
    required String days,
    required String total,
    required Color totalColor,
    Widget? checkbox,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 13)),
              if (checkbox != null)
                Row(
                  children: [
                   // SizedBox(width: 18, height: 18, child: checkbox),
                    const SizedBox(width: 6),
                    // const Expanded(
                    //   child: Text(
                    //     "If provided by client",
                    //     maxLines: 2,
                    //     overflow: TextOverflow.ellipsis,
                    //     style: TextStyle(color: Colors.grey, fontSize: 12),
                    //   ),
                    // ),
                  ],
                ),
            ],
          ),
        ),
        Expanded(flex: 2, child: Text(perDay, textAlign: TextAlign.center)),
        Expanded(child: Text(days, textAlign: TextAlign.center)),
        Expanded(
          flex: 2,
          child: Text(
            total,
            textAlign: TextAlign.end,
            style: TextStyle(
              color: totalColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
