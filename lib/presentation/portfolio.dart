import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:self_portfolio/presentation/mobile_view.dart';
import 'package:self_portfolio/presentation/web_view.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const MobileViewPortfolio(),
      // tablet: (context) => const MobileViewPortfolio(),
      desktop: (context) => const WebViewPortfolio(),
    );
  }
}
