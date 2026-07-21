import 'package:drivehere/features/booking/presentation/widgets/calender_picker_sheet.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart'; // adjust if needed

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
  late DateTime startDate;
  late ScrollController _scrollController;

  static const List<String> _months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  @override
  void initState() {
    super.initState();
    startDate = DateTime.now();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String get _formattedDate =>
      "${widget.selectedDate.day} ${_months[widget.selectedDate.month - 1]} ${widget.selectedDate.year}";

  void _changeDate(int deltaDays) {
    final newDate = widget.selectedDate.add(Duration(days: deltaDays));
    // Don't allow going before today
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);
    if (newDate.isBefore(todayOnly)) return;

    widget.onDateSelected(newDate);

    // Keep the strip's visible range in sync if the new date
    // falls before the current strip start.
    if (newDate.isBefore(startDate)) {
      setState(() {
        startDate = newDate;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(0);
        }
      });
    }
  }

  Future<void> _openCalendar() async {
    final picked = await CalendarPickerSheet.show(
      context,
      selectedDate: widget.selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        startDate = picked;
      });
      widget.onDateSelected(picked);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(0);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: _openCalendar,
              child: Text(
                _formattedDate,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () => _changeDate(-1),
                  child: const Icon(Icons.chevron_left),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => _changeDate(1),
                  child: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 96,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            itemCount: 366, // 365 dates + 1 calendar icon
            separatorBuilder: (_, _) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              if (index == 365) {
                // Calendar icon as last item
                return Container(
                  width: 64,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .15),
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.calendar_month,
                    color: AppColors.primary,
                  ),
                );
              }

              final date = startDate.add(Duration(days: index));
              final selected =
                  date.year == widget.selectedDate.year &&
                  date.month == widget.selectedDate.month &&
                  date.day == widget.selectedDate.day;

              return Container(
                width: 64,
                decoration: BoxDecoration(
                  color: selected ? AppColors.primary : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .15),
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
              );
            },
          ),
        ),
      ],
    );
  }
}
