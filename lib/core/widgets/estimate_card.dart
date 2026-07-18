import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class EstimateCard extends StatelessWidget {
  const EstimateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(3.5),
          1: FlexColumnWidth(1.5),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(1.8),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          const TableRow(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  "Fee Type",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  "Per Day",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  "Days",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  "Total",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),

          _row("Driver Fee", "600", "4", "2400"),
          _row("Food Allowance", "600", "4", "2400"),
          _row("Accommodation", "0", "4", "0"),
        ],
      ),
    );
  }

  static TableRow _row(String title, String perDay, String days, String total) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(title),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(perDay, textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(days, textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            total,
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
