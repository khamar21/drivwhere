import 'package:drivehere/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final VoidCallback onCallTap;

  const BottomNavBar({super.key, required this.onCallTap});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        // Bar fill (clipped to notch)
        ClipPath(
          clipper: _NotchClipper(),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 10, bottom: 14, left: 8, right: 8),
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _navItem(Icons.home, "Home", 0),
                _navItem(Icons.calendar_today_outlined, "History", 1),
                const SizedBox(width: 56),
                _navItem(Icons.chat_bubble_outline, "Message", 2),
                _navItem(Icons.person_outline, "Profile", 3),
              ],
            ),
          ),
        ),
        // Black border tracing the notch outline
        Positioned.fill(
          child: IgnorePointer(
            child: CustomPaint(painter: _NotchBorderPainter()),
          ),
        ),
        // Floating call button
        Positioned(
          top: -22,
          child: GestureDetector(
            onTap: widget.onCallTap,
            child: Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: Color(0xFF7A0C1E),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
                ],
              ),
              child: const Icon(Icons.phone, color: Colors.white, size: 26),
            ),
          ),
        ),
      ],
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final isSelected = selectedIndex == index;
    final color = isSelected ? const Color(0xFF7A0C1E) : Colors.grey;

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: color, fontSize: 11)),
        ],
      ),
    );
  }
}

// Shared path used by both the clipper (fill) and painter (border)
Path _buildNotchPath(Size size) {
  final path = Path();
  final centerX = size.width / 2;
  const notchRadius = 50.0;

  path.moveTo(0, 0);
  path.lineTo(centerX - notchRadius - 50, 0);
  path.quadraticBezierTo(centerX - notchRadius, 0, centerX - notchRadius, 18);
  path.arcToPoint(
    Offset(centerX + notchRadius, 5),
    radius: const Radius.circular(notchRadius),
    clockwise: false,
  );
  path.quadraticBezierTo(centerX + notchRadius, 0, centerX + notchRadius + 16, 0);
  path.lineTo(size.width, 0);
  path.lineTo(size.width, size.height);
  path.lineTo(0, size.height);
  path.close();

  return path;
}

class _NotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => _buildNotchPath(size);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _NotchBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = _buildNotchPath(size);
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = .1;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}