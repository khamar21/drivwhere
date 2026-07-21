import 'package:drivehere/features/booking/presentation/widgets/bottom_navigation_widget.dart';
import 'package:drivehere/features/booking/presentation/widgets/daily_location_card.dart';
import 'package:drivehere/features/booking/presentation/widgets/date_field.dart';
import 'package:drivehere/features/booking/presentation/widgets/estimate_card.dart';
import 'package:drivehere/features/booking/presentation/widgets/home_appbar.dart';
import 'package:drivehere/features/booking/presentation/widgets/vehicle_section.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class MonthlyScreen extends StatefulWidget {
  const MonthlyScreen({super.key});

  @override
  State<MonthlyScreen> createState() => _MonthlyScreenState();
}

class _MonthlyScreenState extends State<MonthlyScreen> {
  DateTime? fromDate;
  DateTime? toDate;

  // final List<FeeRow> feeRows = [
  //   FeeRow(label: "Driver fee", perDay: 600),
  //   FeeRow(label: "Food Allowance", perDay: 600, hasClientOption: true),
  //   FeeRow(label: "Accommodation", perDay: 0, hasClientOption: true),
  // ];

  int get selectedDays {
    if (fromDate == null || toDate == null) return 4;
    return toDate!.difference(fromDate!).inDays + 1;
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF2C4), // Light yellow
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
                SizedBox(height: size.height * .02),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Image.asset("assets/images/logo.png", width: 42),
                //     Image.asset("assets/images/dvrlogo.png", width: 120),
                //     const Icon(
                //       Icons.notifications_none_rounded,
                //       color: AppColors.primary,
                //       size: 25,
                //     ),
                //   ],
                // ),
                const HomeAppBarWidget(),
                 SizedBox(height: size.height *.02),
                const Text(
                  "MONTHLY",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    letterSpacing: .5,
                  ),
                ),
                SizedBox(height: size.height * .03),
                const DailyLocationCard(),
                SizedBox(height: size.height * .04),
                const Text(
                  "Select Month",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: size.height * .03),
                const Text(
                  "From",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
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
                const SizedBox(height: 5),
                DateField(
                  value: formatDate(toDate),
                  onTap: () {
                    pickDate(false);
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  "Minimum 14 days hiring",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
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
                //  MonthlyEstimateCard(rows: feeRows, days: selectedDays),
                const EstimateCard(),
                // SizedBox(height: size.height * .10),
                SizedBox(height: size.height * .10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
