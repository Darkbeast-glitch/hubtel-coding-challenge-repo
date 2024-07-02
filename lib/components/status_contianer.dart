import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatusBadge extends StatelessWidget {
  final String text; // Allow custom text
  final Color backgroundColor; // Allow custom background color
  final String iconPath; // Allow custom icon path
  final Color textColor;

  const StatusBadge({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.iconPath,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 5), // Adjusted padding
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
            20), // Adjusted borderRadius for a more subtle curve
      ),
      child: IntrinsicWidth(
        // Use IntrinsicWidth to wrap content width
        child: Row(
          mainAxisSize: MainAxisSize.min, // Make Row as wide as its children
          children: [
            SvgPicture.asset(iconPath,
                width: 16, height: 16), // Specify size for the icon
            const SizedBox(width: 4), // Add spacing between icon and text
            Text(
              text,
              style: TextStyle(
                color: textColor, // Adjust text color for better contrast
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
