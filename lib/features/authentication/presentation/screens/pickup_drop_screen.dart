import 'package:drivehere/core/widgets/date_selector.dart';
import 'package:drivehere/core/widgets/location_card.dart';
import 'package:drivehere/core/widgets/vehicle_section.dart';
import 'package:drivehere/features/authentication/presentation/screens/daily_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:drivehere/core/widgets/time_box.dart';

import '../../../../core/constants/app_colors.dart';

class PickupDropScreen extends StatefulWidget {
  const PickupDropScreen({super.key});

  @override
  State<PickupDropScreen> createState() => _PickupDropScreenState();
}

class _PickupDropScreenState extends State<PickupDropScreen> {
  static const List<String> _months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December",
  ];

  DateTime selectedDate = DateTime.now();

  String hour = "03";
  String minute = "00";
  String period = "PM";

  void _changeDate(int days) {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: days));
    });
  }

  String get formattedDate =>
      "${selectedDate.day} ${_months[selectedDate.month - 1]} ${selectedDate.year}";

  Future<void> _openTimePicker() async {
    final hours = List.generate(12, (i) => (i + 1).toString().padLeft(2, '0'));
    final minutes = List.generate(60, (i) => i.toString().padLeft(2, '0'));
    const periods = ["AM", "PM"];

    String tempHour = hour;
    String tempMinute = minute;
    String tempPeriod = period;

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Select Pick Up Time",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 180,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 44,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(.08),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CupertinoPicker(
                                  itemExtent: 44,
                                  scrollController: FixedExtentScrollController(
                                    initialItem: hours.indexOf(tempHour),
                                  ),
                                  selectionOverlay: const SizedBox.shrink(),
                                  onSelectedItemChanged: (index) {
                                    setSheetState(
                                      () => tempHour = hours[index],
                                    );
                                  },
                                  children: hours
                                      .map(
                                        (h) => Center(
                                          child: Text(
                                            h,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                              const Text(
                                ":",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: CupertinoPicker(
                                  itemExtent: 44,
                                  scrollController: FixedExtentScrollController(
                                    initialItem: minutes.indexOf(tempMinute),
                                  ),
                                  selectionOverlay: const SizedBox.shrink(),
                                  onSelectedItemChanged: (index) {
                                    setSheetState(
                                      () => tempMinute = minutes[index],
                                    );
                                  },
                                  children: minutes
                                      .map(
                                        (m) => Center(
                                          child: Text(
                                            m,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: CupertinoPicker(
                                  itemExtent: 44,
                                  scrollController: FixedExtentScrollController(
                                    initialItem: periods.indexOf(tempPeriod),
                                  ),
                                  selectionOverlay: const SizedBox.shrink(),
                                  onSelectedItemChanged: (index) {
                                    setSheetState(
                                      () => tempPeriod = periods[index],
                                    );
                                  },
                                  children: periods
                                      .map(
                                        (p) => Center(
                                          child: Text(
                                            p,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
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
                            setState(() {
                              hour = tempHour;
                              minute = tempMinute;
                              period = tempPeriod;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Confirm",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * .015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          width: size.width * .10,
                        ),
                        Image.asset(
                          "assets/images/dvrlogo.png",
                          width: size.width * .30,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          child: const Icon(
                            Icons.notifications_none_rounded,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * .035),
                    const Text(
                      "PICK UP & DROP",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: size.height * .02),
                    const LocationCard(),
                    SizedBox(height: size.height * .03),
                    const Text(
                      "Select Date",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: size.height * .01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formattedDate,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => _changeDate(-1),
                              child: const Icon(Icons.chevron_left),
                            ),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () => _changeDate(1),
                              child: const Icon(Icons.chevron_right),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * .02),
                    DateSelector(
                      selectedDate: selectedDate,
                      onDateSelected: (date) {
                        setState(() => selectedDate = date);
                      },
                    ),
                    SizedBox(height: size.height * .03),
                    const Text(
                      "Select Pick Up Time",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: size.height * .025),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TimeBox(value: hour, onTap: _openTimePicker),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              ":",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TimeBox(value: minute, onTap: _openTimePicker),
                          const SizedBox(width: 12),
                          TimeBox(value: period, onTap: _openTimePicker),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * .05),
                    const VehicleSection(),
                    SizedBox(height: size.height * .05),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DailyScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Estimate",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .02),
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.05),
                            blurRadius: 12,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Vehicle estimate will appear here",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}