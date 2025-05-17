import 'package:ahsun_habib/screens/home/ui/about/about_me_section.dart';
import 'package:ahsun_habib/screens/home/ui/skill/skill_section.dart';
import 'package:flutter/material.dart';
import 'package:ahsun_habib/app/widgets/centered_view.dart';
import 'package:ahsun_habib/app/widgets/custom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWebNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CenteredView(
              Column(
                children: [
                  AboutMeSection(),
                  SkillSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomWebNavBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomWebNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.grey,
      elevation: 8.0,
      titleSpacing: 0.0,
      toolbarHeight: 98.0,
      title: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black87,
              Colors.grey.shade500,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(98.0);
}
