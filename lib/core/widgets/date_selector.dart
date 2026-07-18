import 'package:flutter/material.dart';
import '../constants/app_colors.dart'; // adjust if needed

class DateSelector extends StatefulWidget {
  const DateSelector({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  final DateTime startDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96, // Give the ListView a fixed height
      child: ListView.separated(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        scrollDirection: Axis.horizontal,
        itemCount: 365,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final date = startDate.add(Duration(days: index));

          final selected =
              date.year == widget.selectedDate.year &&
              date.month == widget.selectedDate.month &&
              date.day == widget.selectedDate.day;

          return GestureDetector(
            onTap: () => widget.onDateSelected(date),
            child: Container(
              width: 64,
              decoration: BoxDecoration(
                color: selected ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 5,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    [
                      "MON",
                      "TUE",
                      "WED",
                      "THU",
                      "FRI",
                      "SAT",
                      "SUN",
                    ][date.weekday - 1],
                    style: TextStyle(
                      fontSize: 12,
                      color: selected ? Colors.white : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "${date.day}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: selected ? Colors.white : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
