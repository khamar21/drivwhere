import 'package:drivehere/core/widgets/bottom_navigation_widget.dart';
import 'package:drivehere/core/widgets/daily_location_card.dart';
import 'package:drivehere/core/widgets/date_field.dart';
import 'package:drivehere/core/widgets/estimate_card.dart';
import 'package:drivehere/core/widgets/time_box.dart';
import 'package:drivehere/core/widgets/time_picker_sheet.dart';
import 'package:drivehere/core/widgets/vehicle_section.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class DailyScreen extends StatefulWidget {
  const DailyScreen({super.key});

  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  DateTime? fromDate;
  DateTime? toDate;

  String hour = "8";
  String minute = "00";
  String period = "PM";

  Future<void> pickDate(bool isFrom) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
    );

    if (pickedDate == null) return;

    setState(() {
      if (isFrom) {
        fromDate = pickedDate;
      } else {
        toDate = pickedDate;
      }
    });
  }

  String formatDate(DateTime? date) {
    if (date == null) return "Select date";

    return "${date.day}/${date.month}/${date.year}";
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
     // backgroundColor: AppColors.bg,
      bottomNavigationBar: BottomNavigationWidget(
        onBack: () {
          Navigator.pop(context);
        },
        onNext: () {},
      ),
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
                SizedBox(height: size.height * .02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/logo.png", width: 38),
                    Image.asset("assets/images/dvrlogo.png", width: 120),
                    const Icon(
                      Icons.notifications_none_rounded,
                      color: AppColors.primary,
                      size: 28,
                    ),
                  ],
                ),
                SizedBox(height: size.height * .04),
                const Text(
                  "DAILY",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: .5,
                  ),
                ),
                SizedBox(height: size.height * .03),
                const DailyLocationCard(),
                SizedBox(height: size.height * .04),
                const Text(
                  "Select Number Of Days",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: size.height * .03),
                const Text(
                  "From",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                DateField(
                  value: formatDate(fromDate),
                  onTap: () {
                    pickDate(true);
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "To",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                DateField(
                  value: formatDate(toDate),
                  onTap: () {
                    pickDate(false);
                  },
                ),
                const SizedBox(height: 18),
                const Center(
                  child: Text(
                    "Hiring driver for x days",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const Center(
                  child: Text(
                    "Normal working hours (14hr) with break",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
                SizedBox(height: size.height * .03),
                const Text(
                  "Select Pick Up Time",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: size.height * .02),
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
                SizedBox(height: size.height * .035),
                const VehicleSection(),
                SizedBox(height: size.height * .035),
                const Text(
                  "Estimate",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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