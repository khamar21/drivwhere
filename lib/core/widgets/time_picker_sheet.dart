import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class TimePickerSheet {
  static Future<Map<String, String>?> show({
    required BuildContext context,
    required String hour,
    required String minute,
    required String period,
  }) async {
    final hours = List.generate(12, (i) => (i + 1).toString().padLeft(2, '0'));
    final minutes = List.generate(60, (i) => i.toString().padLeft(2, '0'));
    const periods = ["AM", "PM"];

    String tempHour = hour;
    String tempMinute = minute;
    String tempPeriod = period;

    return showModalBottomSheet<Map<String, String>>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 20,
                  right: 20,
                  bottom: 24,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      "Select Pick Up Time",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 180,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 44,
                              margin: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: .08),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CupertinoPicker(
                                  itemExtent: 44,
                                  selectionOverlay: const SizedBox.shrink(),
                                  scrollController: FixedExtentScrollController(
                                    initialItem: hours.indexOf(tempHour),
                                  ),
                                  onSelectedItemChanged: (index) {
                                    setSheetState(() => tempHour = hours[index]);
                                  },
                                  children: hours
                                      .map((e) => Center(
                                            child: Text(
                                              e,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                              const Text(
                                ":",
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: CupertinoPicker(
                                  itemExtent: 44,
                                  selectionOverlay: const SizedBox.shrink(),
                                  scrollController: FixedExtentScrollController(
                                    initialItem: minutes.indexOf(tempMinute),
                                  ),
                                  onSelectedItemChanged: (index) {
                                    setSheetState(() => tempMinute = minutes[index]);
                                  },
                                  children: minutes
                                      .map((e) => Center(
                                            child: Text(
                                              e,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                              Expanded(
                                child: CupertinoPicker(
                                  itemExtent: 44,
                                  selectionOverlay: const SizedBox.shrink(),
                                  scrollController: FixedExtentScrollController(
                                    initialItem: periods.indexOf(tempPeriod),
                                  ),
                                  onSelectedItemChanged: (index) {
                                    setSheetState(() => tempPeriod = periods[index]);
                                  },
                                  children: periods
                                      .map((e) => Center(
                                            child: Text(
                                              e,
                                              style: const TextStyle(
                                                color: AppColors.primary,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context, {
                            "hour": tempHour,
                            "minute": tempMinute,
                            "period": tempPeriod,
                          });
                        },
                        child: const Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}