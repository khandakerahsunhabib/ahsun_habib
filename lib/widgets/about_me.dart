import 'package:ahsun_habib/core/utils/app_texts.dart';
import 'package:ahsun_habib/screens/home/widgets/animated_button.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildFirstSectionContentBox(context),
          _buildAboutMeButton()
        ],
      ),
    );
  }

  Widget _buildFirstSectionContentBox(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.heroSectionHeading,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 15),
        Text(
          AppTexts.heroSectionSubHeading,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 20),
        Text(
          AppTexts.aboutMeDescription,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildAboutMeButton() {
    return Row(
      children: [
        SizedBox(
          width: 160,
          child: AnimatedButton(
            buttonLabel: 'View My Works',
            hoverColor: Colors.teal,
          ),
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: 150,
          child: AnimatedButton(
            buttonLabel: 'Download CV',
            hoverColor: Colors.teal,
          ),
        )
      ],
    );
  }
}
