import 'package:ahsun_habib/app/navigation/custom_drawer.dart';
import 'package:ahsun_habib/app/navigation/custom_web_nav_bar.dart';
import 'package:ahsun_habib/screens/home/ui/widgets/about_me_section.dart';
import 'package:ahsun_habib/screens/home/ui/widgets/blog_section.dart';
import 'package:ahsun_habib/screens/home/ui/widgets/copyright_section.dart';
import 'package:ahsun_habib/screens/home/ui/widgets/footer_section.dart';
import 'package:ahsun_habib/screens/home/ui/widgets/recent_project_section.dart';
import 'package:ahsun_habib/screens/home/ui/widgets/skill_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _aboutMeKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _blogKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleNavigation(String section) {
    switch (section) {
      case 'Home':
        _scrollToSection(_aboutMeKey);
        break;
      case 'About Me':
        _scrollToSection(_aboutMeKey);
        break;
      case 'Skills':
        _scrollToSection(_skillsKey);
        break;
      case 'Projects':
        _scrollToSection(_projectsKey);
        break;
      case 'Blog':
        _scrollToSection(_blogKey);
        break;
      case 'Contact Me':
        _scrollToSection(_contactKey);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobileOrTablet = width < 1008;

    return Scaffold(
      appBar: CustomWebNavBar(
        onNavItemTap: _handleNavigation,
      ),
      drawer: isMobileOrTablet
          ? CustomDrawer(onNavItemTap: _handleNavigation)
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AboutMeSection(key: _aboutMeKey),
            SkillSection(key: _skillsKey),
            RecentProjectSection(key: _projectsKey),
            BlogSection(key: _blogKey),
            FooterSection(key: _contactKey),
            const CopyrightSection()
          ],
        ),
      ),
    );
  }
}
