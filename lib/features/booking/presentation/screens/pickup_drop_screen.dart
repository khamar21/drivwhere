import 'package:drivehere/features/booking/presentation/widgets/bottom_navigation_widget.dart';
import 'package:drivehere/features/booking/presentation/screens/round_trip.dart';
import 'package:drivehere/features/booking/presentation/widgets/estimate_card.dart';
import 'package:drivehere/features/booking/presentation/widgets/home_appbar.dart';
import 'package:drivehere/features/booking/presentation/widgets/location_card.dart';
import 'package:drivehere/features/booking/presentation/widgets/vehicle_section.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../widgets/date_selector.dart';
import '../widgets/time_box.dart';
import 'daily_screen.dart';

class PickupDropScreen extends StatefulWidget {
  const PickupDropScreen({super.key});

  @override
  State<PickupDropScreen> createState() => _PickupDropScreenState();
}

class _PickupDropScreenState extends State<PickupDropScreen> {
  DateTime selectedDate = DateTime.now();

  final hourController = TextEditingController(text: "05");
  final minuteController = TextEditingController(text: "00");
  String period = "PM";

  @override
  void dispose() {
    hourController.dispose();
    minuteController.dispose();
    super.dispose();
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
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: size.width * .05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * .015),
                const HomeAppBarWidget(),
                SizedBox(height: size.height * .03),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RoundTripScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "PICK UP & DROP",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: size.height * .025),
                const LocationCard(),
                SizedBox(height: size.height * .035),
                const Text(
                  "Select Date",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: size.height * .015),
                DateSelector(
                  selectedDate: selectedDate,
                  onDateSelected: (date) => setState(() => selectedDate = date),
                ),
                SizedBox(height: size.height * .04),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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