import 'package:ahsun_habib/app/navigation/custom_web_nav_bar.dart';
import 'package:ahsun_habib/screens/home/ui/widgets/about_me_section.dart';
import 'package:ahsun_habib/screens/home/ui/widgets/copyright_section.dart';
import 'package:ahsun_habib/screens/home/ui/widgets/footer_section.dart';
import 'package:ahsun_habib/screens/home/ui/widgets/recent_project_section.dart';
import 'package:ahsun_habib/screens/home/ui/widgets/skill_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWebNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AboutMeSection(),
            SkillSection(),
            RecentProjectSection(),
            FooterSection(),
            CopyrightSection()
          ],
        ),
      ),
    );
  }
}
