import 'package:flutter/material.dart';
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

class WebViewPortfolio extends StatefulWidget {
  const WebViewPortfolio({super.key});

  @override
  State<WebViewPortfolio> createState() => _WebViewPortfolioState();
}

class _WebViewPortfolioState extends State<WebViewPortfolio> {
  // importing controller
  final _controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 50),
        child: CommonAppbar(),
      ),
      drawer: CommonAppbar().buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            introSection,
            Expanded(
              child: SingleChildScrollView(
                controller: _controller.scrolleController,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // About me section
                      aboutMe,

                      // Adding some space
                      Space.show(height: 30),

                      // Experience
                      experiences,


                      // Adding some space
                      Space.show(height: 30),

                      // Projects
                      projectsSection
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =======================Left section ========================================================>
  // Appbar

  // Introduction section
  Widget get introSection => SizedBox(
    width: Get.width / 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image
        CircleAvatar(
          radius: 80,
          backgroundColor: AppColors.primary,
          child: CircleAvatar(
            radius: 77,
            backgroundImage: AssetImage("person.jpg"),
          ),
        ),
        Space.show(height: 20),

        // Name
        Text(
          "Anamika Jha",
          style: TextStyle(
            fontFamily: Fonts.semiBold,
            color: AppColors.text,
            fontSize: 24,
          ),
        ),
        //  Adding some space
        Space.show(height: 30),

        // DEsignation and skill
        Text(
          "Software Engineer at pixel consultancy - Full Stack Developer |\nDart | Flutter | Node js | Rest API | MongoDB | Laravel | Firebase",
          style: TextStyle(
            color: AppColors.mutedText,
            height: 1.5,
            fontSize: 18,
          ),
        ),

        // Adding some space
        Space.show(height: 50),
        //  Resume download button
        resumeDownloadButton,

        // Adding some space
        Space.show(height: 50),

        //  Social contact info
        // socialConatctInfo,
      ],
    ),
  );

  // Resume donwload button
Widget get resumeDownloadButton => OutlinedButton(
  onPressed: () async {
    final Uri resumeUrl = Uri.parse('https://drive.google.com/file/d/1aiQYqSlAUFNoOpZ28sN6qBloY2I3bbY1/view?usp=drive_link'); // Replace with your actual PDF URL

    if (await canLaunchUrl(resumeUrl)) {
      await launchUrl(resumeUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $resumeUrl';
    }
  },
  style: OutlinedButton.styleFrom(
    side: BorderSide(color: AppColors.primary),
    fixedSize: const Size(150, 40),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.download, color: AppColors.text),
      const SizedBox(width: 20),
      Text("Resume", style: TextStyle(color: AppColors.text)),
    ],
  ),
);



  // Social media contact information
  // Widget get socialConatctInfo => Row(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //     Tooltip(
  //       message: "+91-8787879999",
  //       child: InkWell(child: Icon(Icons.phone, size: 30)),
  //     ),
  //     Space.show(width: 20),
  //     Tooltip(
  //       message: "jha31anamika1997@gmail.com",
  //       child: Icon(Icons.mail, size: 30),
  //     ),
  //     Space.show(width: 20),
  //     Tooltip(
  //       message: "www.linkedin.com/in/anamika-jha-00896b153",
  //       child: Icon(Feather.linkedin, size: 30),
  //     ),
  //   ],
  // );

  // ====================================== Right part =========================
  //  About section
  Widget get aboutMe => Container(
    key: _controller.aboutKey,
    width: 500,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About Me",
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 22,
            fontFamily: Fonts.bold,
          ),
        ),
        Divider(color: AppColors.primary),
        Text(
          "I'm a Software Developer with over 3 years of experience in full stack development. I enjoy solving technical challenges and building user-friendly applications. I'm currently working as a Software Engineer at Pixel Consultancy. I work with technologies like Dart/Flutter, Node.js, Laravel, Firebase, MongoDB, and REST APIs. I'm always curious to learn new tools and grow my skills in software development.",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: AppColors.text,
            wordSpacing: 1,
            fontFamily: Fonts.regular,
          ),
        ),
      ],
    ),
  );

  // Experience
  Widget get experiences => SizedBox(
    width: 500,
    child: Column(
      key: _controller.experienceKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Experiences",
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 22,
            fontFamily: Fonts.bold,
          ),
        ),
        Divider(color: AppColors.primary),
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
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
