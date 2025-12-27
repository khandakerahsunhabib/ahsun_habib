import 'package:ahsun_habib/app/widgets/animated_button.dart';
import 'package:ahsun_habib/app/widgets/centered_view.dart';
import 'package:ahsun_habib/core/utils/app_texts.dart';
import 'package:ahsun_habib/app/widgets/section_padding.dart';
import 'package:ahsun_habib/core/utils/assets_path.dart';
import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CenteredView(
      SectionPadding(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildAboutMeContent(context),
            _buildAboutMeImage(),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutMeContent(BuildContext context) {
    return SizedBox(
      width: 800,
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
                  width: 166,
                  height: 44,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "WhatsApp Me",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                      ))),
              const SizedBox(width: 15),
              SizedBox(
                width: 150,
                child: AnimatedButton(
                  buttonLabel: 'Download CV',
                  hoverColor: Colors.teal,
                ),
              )
            ],
          ),
          Row(
            children: [
              _buildSocialMediaIcon(onTap: () {}, imgPath: AssetsPath.linkedin),
              _buildSocialMediaIcon(onTap: () {}, imgPath: AssetsPath.github),
              _buildSocialMediaIcon(onTap: () {}, imgPath: AssetsPath.facebook),
              _buildSocialMediaIcon(onTap: () {}, imgPath: AssetsPath.youtube),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSocialMediaIcon(
      {required VoidCallback onTap, required String imgPath}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 30, top: 30),
        child: Image.asset(imgPath, width: 35),
      ),
    );
  }

  Widget _buildAboutMeImage() {
    return Container(
      width: 700,
      height: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(AssetsPath.ahsunHabibPassingTimeOnPhone),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
