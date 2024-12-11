import 'package:ahsun_habib/core/utils/app_texts.dart';
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
          _buildFirstSectionImage(context),
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
        const SizedBox(height: 20),
        Text(
          AppTexts.heroSectionSubHeading,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 25),
        Text(
          AppTexts.aboutMeDescription,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildFirstSectionImage(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          print('Clicked');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal.shade500,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        child: Text(
          'Explore My Work',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white,
                fontSize: 18,
              ),
        ),
      ),
    );
  }
}
