class Project {
  final String name;
  final String role;
  final String description;

  Project({required this.name, required this.role, required this.description});
}
final List<Project> projectList = [
  Project(
    name: "Matrimony App",
    role: "Developer",
    description: "It's an Android application developed in Laravel as backend and Flutter as frontend.",
  ),
  Project(
    name: "Tradecent",
    role: "Developer",
    description: "Tradecent helps investors, beginners and experts, with thorough preparation and support.",
  ),
  Project(
    name: "Matchmate",
    role: "Developer",
    description: "Matchmate uses smart tech to make online dating more engaging.",
  ),
  Project(
    name: "Be Casual",
    role: "Developer",
    description: "A female-centered app for women aged 18 to 55 including clothing, accessories, makeup products, etc.",
  ),
  Project(
    name: "Martcart",
    role: "Developer",
    description: "Connects local farmers directly with consumers through swift delivery for freshness.",
  ),
  Project(
    name: "Go Play",
    role: "Developer",
    description: "An app for people above 16 for inclusive social and entertainment activities.",
  ),
];
