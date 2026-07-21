import 'package:drivehere/core/constants/app_colors.dart';
import 'package:drivehere/features/booking/presentation/widgets/home_appbar.dart';
import 'package:drivehere/features/home/presentation/widgets/home_bottom_navigation.dart';
import 'package:drivehere/features/home/presentation/widgets/trip_type_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> drivers = [
    {
      "name": "Ajith M K",
      "distance": "3km away",
      "rating": "4.8",
      "reviews": "67",
      "liked": true,
      "verified": true,
      "online": true,
    },
    {
      "name": "Paul Shaji",
      "distance": "3km away",
      "rating": "4.8",
      "reviews": "67",
      "liked": true,
      "verified": true,
      "online": false,
    },
    {
      "name": "Sam Sabu",
      "distance": "3km away",
      "rating": "4.8",
      "reviews": "67",
      "liked": false,
      "verified": true,
      "online": false,
    },
    {
      "name": "Rahul P",
      "distance": "3km away",
      "rating": "4.8",
      "reviews": "67",
      "liked": false,
      "verified": true,
      "online": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onCallTap: () {
          // handle call action here, e.g. launch dialer, open call screen, etc.
        },
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
            decoration: const BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBarWidget(),
                const SizedBox(height: 16),
                const Text(
                  "Hello, Welcome",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Icon(Icons.location_on, color: Color(0xFF7A0C1E), size: 16),
                    SizedBox(width: 4),
                    Text(
                      "Kochi India",
                      style: TextStyle(color: Colors.black87, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const TripTypeRow(),
              ],
            ),
          ),

          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/locationnear.svg",
                      height: 22,
                      width: 22,
                    ),

                    SizedBox(width: 8),
                    Text(
                      "Drivers Near Me",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.tune, color: Colors.black54),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .05),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search driver",
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: drivers.length,
              itemBuilder: (context, index) {
                final driver = drivers[index];
                return _driverTile(driver);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _driverTile(Map<String, dynamic> driver) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.bg, Colors.white],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: driver["online"]
                    ? Colors.green
                    : Colors.grey.shade300,
                child: const CircleAvatar(
                  radius: 26,
                  //   backgroundImage: NetworkImage("https://via.placeholder.com/150"),
                ),
              ),
              if (driver["online"])
                Positioned(
                  right: 2,
                  bottom: 2,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      driver["name"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    if (driver["verified"]) ...[
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.verified_rounded,
                        color: Colors.blue,
                        size: 15,
                      ),
                    ],
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 13,
                      color: Colors.grey,
                    ),
                    Text(
                      driver["distance"],
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: Colors.blue),
                    Text(
                      " ${driver["rating"]} (${driver["reviews"]})",
                      style: const TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                driver["liked"] ? Icons.favorite : Icons.favorite_border,
                color: driver["liked"] ? Colors.red : Colors.grey,
              ),
              const SizedBox(height: 12),
              const Text(
                "Book Now →",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
