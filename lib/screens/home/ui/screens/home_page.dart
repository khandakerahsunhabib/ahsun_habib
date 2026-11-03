import 'package:ahsun_habib/app/navigation/custom_drawer.dart';
import 'package:ahsun_habib/app/navigation/custom_web_nav_bar.dart';
import 'package:ahsun_habib/core/theme/app_colors.dart';
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
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _blogKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  String _activeSection = 'Home';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final homeCtx = _homeKey.currentContext;
    final skillsCtx = _skillsKey.currentContext;
    final projectsCtx = _projectsKey.currentContext;
    final blogCtx = _blogKey.currentContext;
    final contactCtx = _contactKey.currentContext;

    double getY(BuildContext? ctx) {
      if (ctx == null) return double.infinity;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) return double.infinity;
      return box.localToGlobal(Offset.zero).dy;
    }

    final double cutoff = 200.0;
    final homeY = getY(homeCtx);
    final skillsY = getY(skillsCtx);
    final projectsY = getY(projectsCtx);
    final blogY = getY(blogCtx);
    final contactY = getY(contactCtx);

    String current = 'Home';
    if (contactY <= cutoff) {
      current = 'Contact Me';
    } else if (blogY <= cutoff) {
      current = 'Blog';
    } else if (projectsY <= cutoff) {
      current = 'Projects';
    } else if (skillsY <= cutoff) {
      current = 'Skills';
    } else if (homeY <= cutoff) {
      current = 'Home';
    }

    if (current != _activeSection) {
      setState(() {
        _activeSection = current;
      });
    }
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
        alignment: 0.05,
      );
    }
  }

  void _handleNavigation(String section) {
    setState(() {
      _activeSection = section;
    });

    switch (section) {
      case 'Home':
      case 'About Me':
        _scrollToSection(_homeKey);
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
      backgroundColor: AppColors.backgroundLight,
      appBar: CustomWebNavBar(
        onNavItemTap: _handleNavigation,
        activeSection: _activeSection,
      ),
      drawer: isMobileOrTablet
          ? CustomDrawer(
              onNavItemTap: _handleNavigation,
              activeSection: _activeSection,
            )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            AboutMeSection(
              key: _homeKey,
              onViewProjectsTap: () => _handleNavigation('Projects'),
            ),
            SkillSection(key: _skillsKey),
            RecentProjectSection(key: _projectsKey),
            BlogSection(key: _blogKey),
            FooterSection(key: _contactKey),
            const CopyrightSection(),
          ],
        ),
      ),
    );
  }
}
