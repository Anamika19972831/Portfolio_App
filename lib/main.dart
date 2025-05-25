import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_portfolio/model/color.model.dart';
import 'package:self_portfolio/presentation/portfolio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Portfolio",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // useSystemColors: true,
        fontFamily: "Roboto",
        // useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      primaryColor: AppColors.primary
      ),
      home: const PortfolioScreen(),
    );
  }
}
