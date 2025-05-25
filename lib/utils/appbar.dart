import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:self_portfolio/controller/home_screen.controller.dart';
import 'package:self_portfolio/model/color.model.dart';
import 'package:self_portfolio/model/fonts.model.dart';
import 'package:self_portfolio/utils/spacer.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  CommonAppbar({super.key});

  final _controller = Get.put(HomeScreenController());

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _mobileAppbar(context),
      tablet: (context) => _mobileAppbar(context),
      desktop: (context) => _desktopAppbar(),
    );
  }

  // Desktop AppBar with inline buttons
  AppBar _desktopAppbar() {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.ternary,
      leadingWidth: 300,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          "My Portfolio",
          style: TextStyle(fontFamily: Fonts.bold, fontSize: 24),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              _navButton('About', _controller.aboutKey),
              Space.show(width: 20),
              _navButton('Experiences', _controller.experienceKey),
              Space.show(width: 20),
              _navButton('Projects', _controller.projectKey),
            ],
          ),
        ),
      ],
    );
  }

  // Mobile/Tablet AppBar with hamburger menu to open drawer
  AppBar _mobileAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.ternary,
      title: Text(
        "My Portfolio",
        style: TextStyle(fontFamily: Fonts.bold, fontSize: 22),
      ),
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
    );
  }

  // Drawer to be added in Scaffold drawer parameter
  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.primary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                'My Portfolio',
                style: TextStyle(
                    color: AppColors.ternary,
                    fontFamily: Fonts.bold,
                    fontSize: 28),
              ),
            ),
            _drawerItem(context, 'About', _controller.aboutKey),
            _drawerItem(context, 'Experiences', _controller.experienceKey),
            _drawerItem(context, 'Projects', _controller.projectKey),
          ],
        ),
      ),
    );
  }

  Widget _navButton(String title, GlobalKey key) {
    return TextButton(
      onPressed: () {
        scrollToSection(key);
      },
      child: Text(
        title,
        style: TextStyle(
          fontFamily: Fonts.semiBold,
          color: AppColors.ternary,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String title, GlobalKey key) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.ternary,
          fontFamily: Fonts.semiBold,
          fontSize: 18,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop(); // close drawer
        scrollToSection(key);
      },
    );
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    }
  }
}
