import 'package:ahsun_habib/core/utils/app_texts.dart';
import 'package:ahsun_habib/core/utils/assets_path.dart';
import 'package:flutter/material.dart';

class SkillsExpertise extends StatelessWidget {
  const SkillsExpertise({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.skillSectionHeading,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          AppTexts.skillSectionDescription,
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
              AssetsPath.dartIcon,
              AppTexts.dartTitle,
              AppTexts.description1,
            ),
            getCustomBox(
              context,
              AssetsPath.flutterIcon,
              AppTexts.flutterTitle,
              AppTexts.description2,
            ),
            getCustomBox(
              context,
              AssetsPath.stateManagementIcon,
              AppTexts.stateManageTitle,
              AppTexts.description3,
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
              AssetsPath.uiOrUxIcon,
              AppTexts.uiOrUxTitle,
              AppTexts.description4,
              Colors.lightBlue,
            ),
            getCustomBox(
              context,
              AssetsPath.backendIcon,
              AppTexts.backendTitle,
              AppTexts.description5,
            ),
            getCustomBox(
              context,
              AssetsPath.versionIcon,
              AppTexts.versionTitle,
              AppTexts.description6,
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
