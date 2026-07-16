import 'package:drivehere/core/widgets/date_selector.dart';
import 'package:drivehere/core/widgets/location_card.dart';
import 'package:drivehere/core/widgets/vehicle_section.dart';
import 'package:drivehere/features/authentication/presentation/screens/daily_screen.dart';
import 'package:flutter/material.dart';
import 'package:drivehere/core/widgets/time_box.dart';

import '../../../../core/constants/app_colors.dart';

class PickupDropScreen extends StatefulWidget {
  const PickupDropScreen({super.key});

  @override
  State<PickupDropScreen> createState() => _PickupDropScreenState();
}

class _PickupDropScreenState extends State<PickupDropScreen> {

  DateTime? fromDate;
  DateTime? toDate;


  String hour = "03";
  String minute = "00";
  String period = "PM";

  int selectedTimeBox = -1;

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

                    /// HEADER
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
                        const Text(
                          "20 April 2026",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),

                        Row(
                          children: const [
                            Icon(Icons.chevron_left),
                            SizedBox(width: 6),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * .02),

                    /// DATE LIST
                    const DateSelector(),

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
                    /// Hour
                    TimeBox(
                      value: hour,
                     // isSelected: selectedTimeBox == 0,
                      onTap: () async {
                        setState(() {
                          selectedTimeBox = 0;
                        });

                        final selectedHour = await showModalBottomSheet<String>(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                final value = (index + 1).toString().padLeft(
                                  2,
                                  '0',
                                );

                                return ListTile(
                                  title: Center(child: Text(value)),
                                  onTap: () {
                                    Navigator.pop(context, value);
                                  },
                                );
                              },
                            );
                          },
                        );

                        if (selectedHour != null) {
                          setState(() {
                            hour = selectedHour;
                          });
                        }
                      },
                    ),

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

                    /// Minute
                    TimeBox(
                      value: minute,
                     // isSelected: selectedTimeBox == 1,
                      onTap: () async {
                        setState(() {
                          selectedTimeBox = 1;
                        });

                        final selectedMinute =
                            await showModalBottomSheet<String>(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 60,
                                  itemBuilder: (context, index) {
                                    final value = index.toString().padLeft(
                                      2,
                                      '0',
                                    );

                                    return ListTile(
                                      title: Center(child: Text(value)),
                                      onTap: () {
                                        Navigator.pop(context, value);
                                      },
                                    );
                                  },
                                );
                              },
                            );

                        if (selectedMinute != null) {
                          setState(() {
                            minute = selectedMinute;
                          });
                        }
                      },
                    ),

                    const SizedBox(width: 12),

                    /// AM / PM
                    TimeBox(
                     // width: 82,
                      value: period,
                    //  isSelected: selectedTimeBox == 2,
                      onTap: () async {
                        setState(() {
                          selectedTimeBox = 2;
                        });

                        final selectedPeriod =
                            await showModalBottomSheet<String>(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      title: const Center(child: Text("AM")),
                                      onTap: () {
                                        Navigator.pop(context, "AM");
                                      },
                                    ),

                                    ListTile(
                                      title: const Center(child: Text("PM")),
                                      onTap: () {
                                        Navigator.pop(context, "PM");
                                      },
                                    ),
                                  ],
                                );
                              },
                            );

                        if (selectedPeriod != null) {
                          setState(() {
                            period = selectedPeriod;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),

                    SizedBox(height: size.height * .05),

                    const VehicleSection(),

                    SizedBox(height: size.height * .05),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                                              builder: (_) =>
                                                  const DailyScreen(),
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
