class Experience {
  final String company;
  final String role;
  final String duration;
  // final List<String> responsibilities;

  Experience({
    required this.company,
    required this.role,
    required this.duration,
    // required this.responsibilities,
  });
}

final List<Experience> experienceList = [
  Experience(
    company: "Pixel Consultancy",
    role: "Flutter Developer",
    duration: "March 2023 – December 2024",
    // responsibilities: [
    //   "Built and maintained mobile apps using Flutter.",
    // ],
  ),
  Experience(
    company: "Pixel Consultancy",
    role: "Software Engineer",
    duration: "December 2024 – Present",
    // responsibilities: [
    //   "Developing and optimizing Flutter applications for better performance.",
    // ],
  ),
  Experience(
    company: "Chakradhar Commerce",
    role: "Flutter Developer",
    duration: "July 2021 – February 2023",
    // responsibilities: [
    //   "Created user-friendly mobile apps and integrated APIs using Flutter.",
    // ],
  ),
];
