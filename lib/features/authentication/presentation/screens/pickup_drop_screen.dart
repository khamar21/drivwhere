import 'package:drivehere/core/widgets/bottom_navigation_widget.dart';
import 'package:drivehere/core/widgets/estimate_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/date_selector.dart';
import '../../../../core/widgets/location_card.dart';
import '../../../../core/widgets/time_box.dart';
import '../../../../core/widgets/time_picker_sheet.dart';
import '../../../../core/widgets/vehicle_section.dart';
import 'daily_screen.dart';

class PickupDropScreen extends StatefulWidget {
  const PickupDropScreen({super.key});

  @override
  State<PickupDropScreen> createState() => _PickupDropScreenState();
}

class _PickupDropScreenState extends State<PickupDropScreen> {
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

  DateTime selectedDate = DateTime.now();

  String hour = "05";
  String minute = "00";
  String period = "PM";

  String get formattedDate =>
      "${selectedDate.day} ${_months[selectedDate.month - 1]} ${selectedDate.year}";

  void changeDate(int value) {
    setState(() => selectedDate = selectedDate.add(Duration(days: value)));
  }

  Future<void> openTimePicker() async {
    final result = await TimePickerSheet.show(
      context: context,
      hour: hour,
      minute: minute,
      period: period,
    );

    if (result != null) {
      setState(() {
        hour = result["hour"]!;
        minute = result["minute"]!;
        period = result["period"]!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavigationWidget(
        onBack: () {
          Navigator.pop(context);
        },
        onNext: () {},
      ),
      //backgroundColor: AppColors.bg,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ Color(0xFFFFF2C4), // Light yellow
          Color(0xFFFFF8E5),
          Colors.white,
          Colors.white,],
          stops: [0.0, 0.25, 0.75, 1.0],
          ),
        ),
       
        child: SafeArea(
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
                    const Icon(
                      Icons.notifications_none_rounded,
                      color: AppColors.primary,
                      size: 25,
                    ),
                  ],
                ),
                SizedBox(height: size.height * .035),

                const Text(
                  "PICK UP & DROP",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: size.height * .025),

                const LocationCard(),
                SizedBox(height: size.height * .035),

                const Text(
                  "Select Date",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: size.height * .015),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => changeDate(-1),
                          child: const Icon(Icons.chevron_left),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => changeDate(1),
                          child: const Icon(Icons.chevron_right),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: size.height * .02),

                DateSelector(
                  selectedDate: selectedDate,
                  onDateSelected: (date) => setState(() => selectedDate = date),
                ),
                SizedBox(height: size.height * .04),

                const Text(
                  "Select Pick Up Time",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: size.height * .025),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeBox(value: hour, onTap: openTimePicker),
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
                      TimeBox(value: minute, onTap: openTimePicker),
                      const SizedBox(width: 12),
                      TimeBox(value: period, width: 80, onTap: openTimePicker),
                    ],
                  ),
                ),
                SizedBox(height: size.height * .04),

                const VehicleSection(),
                SizedBox(height: size.height * .04),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const DailyScreen()),
                    );
                  },
                  child: const Text(
                    "Estimate",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: size.height * .02),

               const EstimateCard(),

                SizedBox(height: size.height * .10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
