import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

enum EstimateCardType { table, extraHours }

class EstimateCard extends StatelessWidget {
  final EstimateCardType type;

  final String? leftTitle;
  final String? leftSubtitle;
  final String? amount;
  final String? rate;

  final List<EstimateRow>? rows;

  const EstimateCard({
    super.key,
    this.type = EstimateCardType.table,
    this.leftTitle,
    this.leftSubtitle,
    this.amount,
    this.rate,
    this.rows,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case EstimateCardType.extraHours:
        return _extraHourCard();

      case EstimateCardType.table:
        //default:
        return _tableCard();
    }
  }

  Widget _extraHourCard() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.only(left: 30, top: 10, bottom: 5, right: 30),
      decoration: BoxDecoration(
        color: const Color(0xffFDF6F6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffB40E0E), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  leftTitle ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  leftSubtitle ?? "",
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount ?? "",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                rate ?? "",
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _tableCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .06),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Table(
        // columnWidths: const {
        //   0: FlexColumnWidth(3.5),
        //   1: FlexColumnWidth(1.5),
        //   2: FlexColumnWidth(1),
        //   3: FlexColumnWidth(1.8),
        // },
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          ...(rows ?? []).map(
            (e) => TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(e.title),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(e.perDay, textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(e.days, textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    e.total,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EstimateRow {
  final String title;
  final String perDay;
  final String days;
  final String total;

  EstimateRow({
    required this.title,
    required this.perDay,
    required this.days,
    required this.total,
  });
}
