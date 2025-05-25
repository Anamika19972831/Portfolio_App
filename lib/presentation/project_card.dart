import 'package:flutter/material.dart';
import 'package:self_portfolio/model/color.model.dart';
import 'package:self_portfolio/model/fonts.model.dart';
import 'package:self_portfolio/model/project.model.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

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
              project.name,
              style: TextStyle(
                fontFamily: Fonts.bold,
                fontSize: 20,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Role: ${project.role}",
              style: TextStyle(
                fontFamily: Fonts.semiBold,
                fontSize: 16,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              project.description,
              style: TextStyle(
                fontFamily: Fonts.regular,
                fontSize: 16,
                color: AppColors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
