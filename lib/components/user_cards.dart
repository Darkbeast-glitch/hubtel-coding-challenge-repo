import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart'; // Ensure this package is used or remove it if not
import 'package:hubtel_coding_challenge/components/status_contianer.dart'; // Verify the correct file name

class TransactionCard extends StatelessWidget {
  final String firstPersonName;
  final String? secondPersonName; // Made optional
  final String phoneNumber;
  final String amount;
  final String status;
  final String iconPath;
  final Color backgroundColor;
  final String backgroundImage;
  final Color textColor;

  const TransactionCard({
    super.key,
    required this.firstPersonName,
    this.secondPersonName, // Now optional
    required this.phoneNumber,
    required this.amount,
    required this.status,
    required this.iconPath,
    required this.backgroundColor,
    required this.backgroundImage,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95, // Responsive width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Adjust height based on content
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(backgroundImage),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            firstPersonName,
                            style: const TextStyle(fontSize: 14),
                          ),
                          StatusBadge(
                            text: status,
                            textColor: textColor,
                            backgroundColor: backgroundColor,
                            iconPath: iconPath,
                          ),
                        ],
                      ),
                      if (secondPersonName != null) // Conditional rendering
                        Text(
                          secondPersonName!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            phoneNumber,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            amount,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(height: 6, indent: 20, endIndent: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/person.svg"),
                    const SizedBox(width: 10),
                    const Text("Personal", style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 7),
                    Container(
                      width: 6.0,
                      height: 6.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 7),
                    const Text("Cool your heart wai",
                        style: TextStyle(fontSize: 14)),
                  ],
                ),
                SvgPicture.asset("assets/icons/Favorite.svg"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
