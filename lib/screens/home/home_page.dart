import 'package:ahsun_habib/widgets/centered_view.dart';
import 'package:ahsun_habib/widgets/home/skills_expertise.dart';
import 'package:ahsun_habib/widgets/navigation/custom_navigation_bar.dart';
import 'package:ahsun_habib/widgets/home/about_image.dart';
import 'package:ahsun_habib/widgets/home/about_me.dart';
import 'package:ahsun_habib/widgets/section_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CenteredView(
                    CustomNavigationBar(),
                  ),
                ],
              ),
            ),
            const CenteredView(
              Column(
                children: [
                  SectionPadding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AboutMe(),
                        AboutImage(),
                      ],
                    ),
                  ),
                  SectionPadding(
                    child: SkillsExpertise(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
