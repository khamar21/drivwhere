import 'package:drivehere/core/widgets/bottom_navigation_widget.dart';
import 'package:drivehere/core/widgets/daily_location_card.dart';
import 'package:drivehere/core/widgets/date_field.dart';
import 'package:drivehere/core/widgets/time_box.dart';
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

      bottomNavigationBar: BottomNavigationWidget(
        onBack: () {
          Navigator.pop(context);
        },
        onNext: () {
        
        },
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: size.width * .05),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * .02),

              /// HEADER
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

              /// PICKUP LOCATION
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

              /// SELECT PICK UP TIME
              const Text(
                "Select Pick Up Time",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),

              SizedBox(height: size.height * .02),

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

              SizedBox(height: size.height * .035),

              /// VEHICLE SECTION
              const VehicleSection(),

              SizedBox(height: size.height * .035),

              /// ESTIMATE
              const Text(
                "Estimate",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),

              SizedBox(height: size.height * .02),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Vehicle",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),

                        Text(
                          "--",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Days",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),

                        Text(
                          "--",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),

                    Divider(),

                    SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Estimated Amount",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),

                        Text(
                          "₹ 0",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * .10),
            ],
          ),
        ),
      ),
    );
  }
}
