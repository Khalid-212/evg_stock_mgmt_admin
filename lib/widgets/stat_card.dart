import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String stat;
  final String description;
  final bool isMoney;
  final Color cardColor;
  final Color iconColor;
  final Color textColor;

  const StatCard({
    super.key,
    required this.icon,
    required this.stat,
    required this.description,
    required this.cardColor,
    required this.iconColor,
    required this.textColor,
    this.isMoney = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 160,
        height: 150,
        child: Card(
          color: cardColor,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 25,
                  color: iconColor,
                ),
                const SizedBox(height: 8),
                Text(
                  isMoney ? 'ETB $stat' : stat,
                  style: TextStyle(
                    fontSize: 21,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
