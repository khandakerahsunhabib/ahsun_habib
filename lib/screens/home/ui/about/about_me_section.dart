import 'package:ahsun_habib/app/widgets/animated_button.dart';
import 'package:ahsun_habib/core/utils/app_texts.dart';
import 'package:ahsun_habib/app/widgets/section_padding.dart';
import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildAboutMeContent(context),
          _buildAboutMeImage(),
        ],
      ),
    );
  }

  Widget _buildAboutMeContent(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
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
          ),
          Row(
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
          )
        ],
      ),
    );
  }

  Widget _buildAboutMeImage() {
    return Container(
      width: 500,
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(
              'assets/images/profile-picture-of-khandaker-ahsun-habib.jpg'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
