import 'package:flutter/material.dart';
import 'package:self_portfolio/model/color.model.dart';
import 'package:self_portfolio/model/fonts.model.dart';

class ExperienceCard extends StatelessWidget {
  final String company;
  final String role;
  final String duration;
  final List<String>? responsibilities;

  const ExperienceCard({
    required this.company,
    required this.role,
    required this.duration,
    this.responsibilities,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.secondary,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              company,
              style: TextStyle(
                fontFamily: Fonts.bold,
                fontSize: 20,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Role: $role",
              style: TextStyle(
                fontFamily: Fonts.semiBold,
                fontSize: 16,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Duration: $duration",
              style: TextStyle(
                fontFamily: Fonts.regular,
                fontSize: 14,
                color: AppColors.text,
              ),
            ),
            if (responsibilities != null && responsibilities!.isNotEmpty)
              const SizedBox(height: 12),
            if (responsibilities != null && responsibilities!.isNotEmpty)
              ...responsibilities!.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("• ", style: TextStyle(fontSize: 16)),
                      Expanded(
                        child: Text(
                          item,
                          style: TextStyle(
                            fontFamily: Fonts.regular,
                            fontSize: 16,
                            color: AppColors.text,
                          ),
                        ),
                      ),
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
