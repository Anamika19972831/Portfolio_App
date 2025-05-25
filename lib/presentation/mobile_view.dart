import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:self_portfolio/controller/home_screen.controller.dart';
import 'package:self_portfolio/model/color.model.dart';
import 'package:self_portfolio/model/experience.model.dart';
import 'package:self_portfolio/model/fonts.model.dart';
import 'package:self_portfolio/model/project.model.dart';
import 'package:self_portfolio/presentation/experinece_card.dart';
import 'package:self_portfolio/presentation/project_card.dart';
import 'package:self_portfolio/utils/appbar.dart';
import 'package:self_portfolio/utils/spacer.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileViewPortfolio extends StatefulWidget {
  const MobileViewPortfolio({super.key});

  @override
  State<MobileViewPortfolio> createState() => _MobileViewPortfolioState();
}

class _MobileViewPortfolioState extends State<MobileViewPortfolio> {
  final _controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 50),
        child: CommonAppbar(),
      ),

      body: SingleChildScrollView(
        controller: _controller.scrolleController,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            introSection,
            Space.show(height: 30),
            aboutMe,
            Space.show(height: 30),
            experiences,
            // Adding some space
            Space.show(height: 30),

            // Projects
            projectsSection,
          ],
        ),
      ),
    );
  }

  Widget get introSection => Column(
    children: [
      CircleAvatar(
        radius: 60,
        backgroundColor: AppColors.primary,
        child: const CircleAvatar(
          radius: 57,
          backgroundImage: AssetImage("person.jpg"),
        ),
      ),
      Space.show(height: 16),
      Text(
        "Anamika Jha",
        style: TextStyle(
          fontFamily: Fonts.semiBold,
          color: AppColors.text,
          fontSize: 22,
        ),
      ),
      Space.show(height: 10),
      Text(
        "Software Engineer - Full Stack Developer\nDart | Flutter | Node js | Firebase",
        style: TextStyle(color: AppColors.mutedText, fontSize: 14, height: 1.5),
        textAlign: TextAlign.center,
      ),
      Space.show(height: 20),
      resumeDownloadButton,
      Space.show(height: 30),
      socialContactInfo,
    ],
  );

  Widget get resumeDownloadButton => OutlinedButton(
    onPressed: () async {
    final Uri resumeUrl = Uri.parse('https://drive.google.com/file/d/1aiQYqSlAUFNoOpZ28sN6qBloY2I3bbY1/view?usp=drive_link'); // Replace with your actual PDF URL

    if (await canLaunchUrl(resumeUrl)) {
      await launchUrl(resumeUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $resumeUrl';
    }
  },
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.download),
        SizedBox(width: 10),
        Text("Resume"),
      ],
    ),
  );

  Widget get socialContactInfo => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(Icons.phone),
      SizedBox(width: 16),
      Icon(Icons.mail),
      SizedBox(width: 16),
      Icon(Feather.linkedin),
    ],
  );

  Widget get aboutMe => Container(
    key: _controller.aboutKey,
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About Me",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.primary,
            fontFamily: Fonts.bold,
          ),
        ),
        Divider(color: AppColors.primary),
        Text(
          "I'm a Software Developer with over 3 years of experience in full stack development. I enjoy solving technical challenges and building user-friendly applications. I'm currently working as a Software Engineer at Pixel Consultancy. I work with technologies like Dart/Flutter, Node.js, Laravel, Firebase, MongoDB, and REST APIs. I'm always curious to learn new tools and grow my skills in software development.",

          style: TextStyle(color: AppColors.text, fontFamily: Fonts.regular),
          textAlign: TextAlign.justify,
        ),
      ],
    ),
  );

  Widget get experiences => Container(
    key: _controller.experienceKey,
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Experiences",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.primary,
            fontFamily: Fonts.bold,
          ),
        ),
        Divider(color: AppColors.primary),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: experienceList.length,
          itemBuilder: (context, index) {
            return ExperienceCard(
              company: experienceList[index].company,
              role: experienceList[index].role,
              duration: experienceList[index].duration,
            );
          },
        ),
      ],
    ),
  );

  // Project section
  Widget get projectsSection => SizedBox(
    key: _controller.projectKey,
    width: 500,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Projects",
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 22,
            fontFamily: Fonts.bold,
          ),
        ),
        Divider(color: AppColors.primary),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: projectList.length,
          itemBuilder: (context, index) {
            return ProjectCard(project: projectList[index]);
          },
        ),
      ],
    ),
  );
}
