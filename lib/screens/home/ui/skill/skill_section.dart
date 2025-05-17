import 'package:ahsun_habib/core/utils/app_texts.dart';
import 'package:ahsun_habib/core/utils/assets_path.dart';
import 'package:ahsun_habib/app/widgets/section_padding.dart';
import 'package:ahsun_habib/screens/home/ui/skill/widgets/custom_skill_box.dart';
import 'package:flutter/material.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSkillSectionHeadingAndDescription(context),
          _buildSkillSectionBoxes(context),
        ],
      ),
    );
  }

  Widget _buildSkillSectionHeadingAndDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.skillSectionHeading,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 20),
        Text(
          AppTexts.skillSectionDescription,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildSkillSectionBoxes(BuildContext context) {
    return Wrap(
      spacing: 25,
      runSpacing: 25,
      children: [
        CustomSkillBox(
          imageSource: AssetsPath.dartIcon,
          title: AppTexts.dartTitle,
          description: AppTexts.description1,
        ),
        CustomSkillBox(
          imageSource: AssetsPath.flutterIcon,
          title: AppTexts.flutterTitle,
          description: AppTexts.description2,
        ),
        CustomSkillBox(
          imageSource: AssetsPath.stateManagementIcon,
          title: AppTexts.stateManageTitle,
          description: AppTexts.description3,
          color: Colors.lightBlue,
        ),
        CustomSkillBox(
          imageSource: AssetsPath.uiOrUxIcon,
          title: AppTexts.uiOrUxTitle,
          description: AppTexts.description4,
          color: Colors.lightBlue,
        ),
        CustomSkillBox(
          imageSource: AssetsPath.backendIcon,
          title: AppTexts.backendTitle,
          description: AppTexts.description5,
        ),
        CustomSkillBox(
          imageSource: AssetsPath.versionIcon,
          title: AppTexts.versionTitle,
          description: AppTexts.description6,
        ),
      ],
    );
  }
}
