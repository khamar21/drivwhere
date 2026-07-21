import 'package:drivehere/features/booking/presentation/screens/monthly_screen.dart';
import 'package:drivehere/features/booking/presentation/widgets/bottom_navigation_widget.dart';
import 'package:drivehere/features/booking/presentation/widgets/daily_location_card.dart';
import 'package:drivehere/features/booking/presentation/widgets/date_field.dart';
import 'package:drivehere/features/booking/presentation/widgets/estimate_card.dart';
import 'package:drivehere/features/booking/presentation/widgets/home_appbar.dart';
import 'package:drivehere/features/booking/presentation/widgets/time_box.dart';
import 'package:drivehere/features/booking/presentation/widgets/vehicle_section.dart';
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

  final hourController = TextEditingController(text: "08");
  final minuteController = TextEditingController(text: "00");
  String period = "PM";

  @override
  void dispose() {
    hourController.dispose();
    minuteController.dispose();
    super.dispose();
  }

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF2C4),
              Color(0xFFFFF8E5),
              Colors.white,
              Colors.white,
            ],
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
                const HomeAppBarWidget(),
                SizedBox(height: size.height * .03),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MonthlyScreen()),
                    );
                  },
                  child: const Text(
                    "DAILY",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      letterSpacing: .5,
                    ),
                  ),
                ),
                SizedBox(height: size.height * .03),
                const DailyLocationCard(),
                SizedBox(height: size.height * .04),
                const Text(
                  "Select Number Of Days",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: size.height * .02),
                const Text(
                  "From",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                DateField(
                  value: formatDate(fromDate),
                  onTap: () {
                    pickDate(true);
                  },
                ),
                const SizedBox(height: 15),
                const Text(
                  "To",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                DateField(
                  value: formatDate(toDate),
                  onTap: () {
                    pickDate(false);
                  },
                ),
                const SizedBox(height: 18),
                const Text(
                  "Hiring driver for x days",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
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
                      TimeBox(controller: hourController, min: 1, max: 12),
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
                      TimeBox(controller: minuteController, min: 0, max: 59),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            period = period == "AM" ? "PM" : "AM";
                          });
                        },
                        child: Container(
                          width: 60,
                          height: 47,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .08),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Text(
                            period,
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * .035),
                const VehicleSection(),
                SizedBox(height: size.height * .035),
                const Text(
                  "Estimate",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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