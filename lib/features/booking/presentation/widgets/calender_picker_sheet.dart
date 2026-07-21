import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart'; // adjust if needed

class CalendarPickerSheet extends StatefulWidget {
  const CalendarPickerSheet({
    super.key,
    required this.selectedDate,
    required this.firstDate,
    required this.lastDate,
  });

  final DateTime selectedDate;
  final DateTime firstDate;
  final DateTime lastDate;

  static Future<DateTime?> show(
    BuildContext context, {
    required DateTime selectedDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) {
    return showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => CalendarPickerSheet(
        selectedDate: selectedDate,
        firstDate: firstDate,
        lastDate: lastDate,
      ),
    );
  }

  @override
  State<CalendarPickerSheet> createState() => _CalendarPickerSheetState();
}

class _CalendarPickerSheetState extends State<CalendarPickerSheet> {
  DateTime? _tempDate;
  late DateTime _visibleMonth;

  static const List<String> _months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December",
  ];
  static const List<String> _weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  void initState() {
    super.initState();
    _tempDate = widget.selectedDate;
    _visibleMonth = DateTime(widget.selectedDate.year, widget.selectedDate.month);
  }

  bool get _canGoPrevious {
    final prevMonth = DateTime(_visibleMonth.year, _visibleMonth.month - 1);
    final firstMonth = DateTime(widget.firstDate.year, widget.firstDate.month);
    return !prevMonth.isBefore(firstMonth);
  }

  bool get _canGoNext {
    final nextMonth = DateTime(_visibleMonth.year, _visibleMonth.month + 1);
    final lastMonth = DateTime(widget.lastDate.year, widget.lastDate.month);
    return !nextMonth.isAfter(lastMonth);
  }

  void _changeMonth(int delta) {
    setState(() {
      _visibleMonth = DateTime(_visibleMonth.year, _visibleMonth.month + delta);
    });
  }

  bool _isSelectable(DateTime day) {
    final d = DateTime(day.year, day.month, day.day);
    final first = DateTime(widget.firstDate.year, widget.firstDate.month, widget.firstDate.day);
    final last = DateTime(widget.lastDate.year, widget.lastDate.month, widget.lastDate.day);
    return !d.isBefore(first) && !d.isAfter(last);
  }

  List<DateTime?> _buildGridDays() {
    final firstOfMonth = DateTime(_visibleMonth.year, _visibleMonth.month, 1);
    final daysInMonth = DateTime(_visibleMonth.year, _visibleMonth.month + 1, 0).day;
    // weekday: Mon=1 ... Sun=7. Leading blanks so Mon is first column.
    final leadingBlanks = firstOfMonth.weekday - 1;

    final days = <DateTime?>[];
    days.addAll(List.filled(leadingBlanks, null));
    for (int d = 1; d <= daysInMonth; d++) {
      days.add(DateTime(_visibleMonth.year, _visibleMonth.month, d));
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    final gridDays = _buildGridDays();

  return SafeArea(
  child: Padding(
    padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Select Date",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              _tempDate == null
                  ? "No date selected"
                  : "${_months[_tempDate!.month - 1]} ${_tempDate!.day}, ${_tempDate!.year}",
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 16),
            // Month navigation pill
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: _canGoPrevious ? () => _changeMonth(-1) : null,
                      child: Icon(
                        Icons.chevron_left,
                        color: _canGoPrevious ? Colors.black : Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(
                      width: 130,
                      child: Text(
                        "${_months[_visibleMonth.month - 1]}, ${_visibleMonth.year}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ),
                    GestureDetector(
                      onTap: _canGoNext ? () => _changeMonth(1) : null,
                      child: Icon(
                        Icons.chevron_right,
                        color: _canGoNext ? Colors.black : Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Weekday header
            Row(
              children: _weekdays
                  .map((w) => Expanded(
                        child: Center(
                          child: Text(
                            w,
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 8),
            // Date grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: gridDays.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                final day = gridDays[index];
                if (day == null) return const SizedBox.shrink();

                final selectable = _isSelectable(day);
                final isSelected = _tempDate != null &&
                    day.year == _tempDate!.year &&
                    day.month == _tempDate!.month &&
                    day.day == _tempDate!.day;

                return GestureDetector(
                  onTap: selectable
                      ? () => setState(() => _tempDate = day)
                      : null,
                  child: Center(
                    child: Container(
                      width: 36,
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        day.day.toString().padLeft(2, '0'),
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : selectable
                                  ? Colors.black87
                                  : Colors.grey.shade300,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => setState(() => _tempDate = null),
                  child: const Text(
                    "Clear",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _tempDate == null
                      ? null
                      : () => Navigator.pop(context, _tempDate),
                  child: const Text("Done"),
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