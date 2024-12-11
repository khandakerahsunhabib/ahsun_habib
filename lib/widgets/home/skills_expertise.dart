import 'package:ahsun_habib/utilities/app_texts.dart';
import 'package:flutter/material.dart';

class SkillsExpertise extends StatelessWidget {
  const SkillsExpertise({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          skillSectionHeading,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          skillSectionDescription,
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
              dartIcon,
              dartTitle,
              description1,
            ),
            getCustomBox(
              context,
              flutterIcon,
              flutterTitle,
              description2,
            ),
            getCustomBox(
              context,
              stateManagementIcon,
              stateManageTitle,
              description3,
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
              uiOrUxIcon,
              uiOrUxTitle,
              description4,
              Colors.lightBlue,
            ),
            getCustomBox(
              context,
              backendIcon,
              backendTitle,
              description5,
            ),
            getCustomBox(
              context,
              versionIcon,
              versionTitle,
              description6,
            ),
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
      border: Border.all(
        color: Colors.teal.shade100,
      ),
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
