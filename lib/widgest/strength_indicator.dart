import 'package:flutter/material.dart';

class StrengthIndicator extends StatelessWidget {
  final String strength;

  const StrengthIndicator({
    super.key,
    required this.strength,
  });

  @override
  Widget build(BuildContext context) {

    double progress = 0.0;
    Color progressColor = Colors.grey;

    // Check password strength
    if (strength == "Weak") {
      progress = 0.33;
      progressColor = Colors.red;

    } else if (strength == "Medium") {
      progress = 0.66;
      progressColor = Colors.orange;

    } else if (strength == "Strong") {
      progress = 1.0;
      progressColor = Colors.green;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        // Animated progress bar
        TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: 0,
            end: progress,
          ),

          duration: const Duration(milliseconds: 600),

          builder: (context, value, child) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),

              child: LinearProgressIndicator(
                value: value,
                minHeight: 12,
                backgroundColor: Colors.white12,
                color: progressColor,
              ),
            );
          },
        ),

        const SizedBox(height: 10),

        // Strength percentage
        Text(
          "Strength Level: ${(progress * 100).round()}%",
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),

      ],
    );
  }
}