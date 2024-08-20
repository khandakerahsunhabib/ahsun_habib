import 'package:flutter/material.dart';

class SkillsExpertise extends StatelessWidget {
  const SkillsExpertise({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills & Expertise',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "With a strong foundation in Dart and Flutter, I specialize in crafting high-performance mobile apps. My expertise spans state management, UI/UX design, backend integration, and version control with Git. I’m dedicated to delivering seamless, cross-platform experiences that blend functionality with elegant design.",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getCustomBox(
                context,
                "assets/images/icons/dart.png",
                "Dart programming",
                "I use Dart to build fast and scalable Flutter apps, delivering smooth user experiences."),
            getCustomBox(
                context,
                'assets/images/icons/flutter.png',
                "Flutter SDK",
                "I leverage Flutter SDK to create beautiful, cross-platform apps with seamless performance."),
            getCustomBox(
              context,
              'assets/images/icons/getx.png',
              "State Management",
              "I manage app state efficiently using tools like GetX, Provider and Riverpod.",
              Colors.lightBlue,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getCustomBox(
              context,
              'assets/images/icons/ux-interface.png',
              "UI/UX Design",
              "I craft intuitive, responsive interfaces with custom widgets and smooth animations.",
              Colors.lightBlue,
            ),
            getCustomBox(
                context,
                'assets/images/icons/api.png',
                "Backend Integration",
                "I integrate APIs and Firebase to power dynamic, data-driven Flutter apps."),
            getCustomBox(
                context,
                'assets/images/icons/version.png',
                "Version Control",
                "I use Git for seamless code collaboration, versioning, and project management."),
          ],
        ),
      ],
    );
  }
}

Widget getCustomBox(
    context, String imageSource, String title, String description,
    [Color? color]) {
  return Container(
    padding: const EdgeInsets.all(25),
    width: 380,
    height: 320,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.teal.shade100,
          offset: const Offset(1, 1),
          blurRadius: 1,
          spreadRadius: 2.0,
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: Image.asset(
            imageSource,
            fit: BoxFit.fitHeight,
            color: color,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    ),
  );
}
