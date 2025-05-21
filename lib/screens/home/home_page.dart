import 'package:ahsun_habib/app/navigation/custom_web_nav_bar.dart';
import 'package:ahsun_habib/screens/home/ui/about/about_me_section.dart';
import 'package:ahsun_habib/screens/home/ui/project/recent_project_section.dart';
import 'package:ahsun_habib/screens/home/ui/skill/skill_section.dart';
import 'package:flutter/material.dart';
import 'package:ahsun_habib/app/widgets/centered_view.dart';

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
          ],
        ),
      ),
    );
  }
}
