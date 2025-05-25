import 'package:flutter/material.dart';

class ExperienceCard extends StatelessWidget {
  final String company;
  final String role;
  final String duration;
  // final List<String> responsibilities;

  const ExperienceCard({
    required this.company,
    required this.role,
    required this.duration,
    // required this.responsibilities,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(company,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(role,
                style: const TextStyle(
                    fontSize: 16, fontStyle: FontStyle.italic)),
            const SizedBox(height: 4),
            Text(duration, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            // ...responsibilities.map(
            //   (item) => Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const Text("• "),
            //       Expanded(child: Text(item)),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
