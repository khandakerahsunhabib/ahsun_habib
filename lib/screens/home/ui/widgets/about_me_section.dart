import 'package:ahsun_habib/app/widgets/animated_button.dart';
import 'package:ahsun_habib/app/widgets/centered_view.dart';
import 'package:ahsun_habib/core/utils/app_texts.dart';
import 'package:ahsun_habib/app/widgets/section_padding.dart';
import 'package:ahsun_habib/core/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= 1008;
    final isMobile = width < 640;

    return CenteredView(
      SectionPadding(
        topPadding: isMobile ? 40.0 : 100.0,
        bottomPadding: isMobile ? 40.0 : 100.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: isDesktop
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildAboutMeContent(context, width)),
                    const SizedBox(width: 40),
                    _buildAboutMeImage(width),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: _buildAboutMeImage(width)),
                    const SizedBox(height: 40),
                    _buildAboutMeContent(context, width),
                  ],
                ),

        ),
      ),
    );
  }

  Widget _buildAboutMeContent(BuildContext context, double screenWidth) {
    final isMobile = screenWidth < 640;
    final isTablet = screenWidth >= 640 && screenWidth < 1008;

    final titleLargeStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: isMobile ? 32 : (isTablet ? 45 : 60),
        );
    final titleSmallStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
          fontSize: isMobile ? 18 : (isTablet ? 22 : 25),
        );
    final bodySmallStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: isMobile ? 15 : (isTablet ? 18 : 20),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppTexts.heroSectionHeading,
              style: titleLargeStyle,
            ),
            const SizedBox(height: 15),
            Text(
              AppTexts.heroSectionSubHeading,
              style: titleSmallStyle,
            ),
            const SizedBox(height: 20),
            Text(
              AppTexts.aboutMeDescription,
              style: bodySmallStyle,
            ),
            const SizedBox(height: 20),
          ],
        ),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            SizedBox(
                width: isMobile ? double.infinity : 166,
                height: 44,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    onPressed: () => launchUrl(Uri.parse('https://wa.me/8801308166502')),
                    child: Text(
                      "WhatsApp Me",
                      style: TextStyle(
                            fontSize: isMobile ? 16 : 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                    ))),
            SizedBox(
              width: isMobile ? double.infinity : 150,
              height: 44,
              child: AnimatedButton(
                buttonLabel: 'Download CV',
                hoverColor: Colors.teal,
                onTap: () => launchUrl(Uri.parse('https://drive.google.com/file/d/1-GaoLUDarQ8xM98wBGAs5nLwpkwg61pb/view?usp=drive_link')),
              ),
            )
          ],
        ),
        Wrap(
          spacing: 20,
          runSpacing: 10,
          children: [
            _buildSocialMediaIcon(
              onTap: () => launchUrl(Uri.parse('https://www.linkedin.com/in/ahsunhabib/')),
              imgPath: AssetsPath.linkedin,
            ),
            _buildSocialMediaIcon(
              onTap: () => launchUrl(Uri.parse('https://github.com/khandakerahsunhabib')),
              imgPath: AssetsPath.github,
            ),
            _buildSocialMediaIcon(
              onTap: () => launchUrl(Uri.parse('https://www.facebook.com/ahsun.habib.980')),
              imgPath: AssetsPath.facebook,
            ),
            _buildSocialMediaIcon(
              onTap: () => launchUrl(Uri.parse('https://www.youtube.com/@HungerEntertainment')),
              imgPath: AssetsPath.youtube,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildSocialMediaIcon(
      {required VoidCallback onTap, required String imgPath}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Image.asset(imgPath, width: 35),
      ),
    );
  }

  Widget _buildAboutMeImage(double screenWidth) {
    final isMobile = screenWidth < 640;
    final isTablet = screenWidth >= 640 && screenWidth < 1008;

    double width = 700;
    double height = 600;

    if (isMobile) {
      width = screenWidth - 40;
      height = width * 0.85;
    } else if (isTablet) {
      width = screenWidth - 40;
      height = 450;
    } else {
      width = (screenWidth * 0.45).clamp(350.0, 700.0);
      height = width * 0.85;
    }

    return Container(
      width: width,
      height: height,
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
