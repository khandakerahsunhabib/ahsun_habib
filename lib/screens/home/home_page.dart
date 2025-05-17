import 'package:flutter/material.dart';
import 'package:ahsun_habib/widgets/centered_view.dart';
import 'package:ahsun_habib/widgets/skills_expertise.dart';
import 'package:ahsun_habib/widgets/custom_navigation_bar.dart';
import 'package:ahsun_habib/widgets/about_image.dart';
import 'package:ahsun_habib/widgets/about_me.dart';
import 'package:ahsun_habib/widgets/section_padding.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey,
        elevation: 8,
        titleSpacing: 0,
        toolbarHeight: 98,
        title: _buildAppNavBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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

  Widget _buildAppNavBar() {
    return Container(
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
    );
  }
}
