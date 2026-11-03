import 'package:ahsun_habib/app/widgets/centered_view.dart';
import 'package:ahsun_habib/core/theme/app_colors.dart';
import 'package:ahsun_habib/core/utils/app_texts.dart';
import 'package:ahsun_habib/screens/home/ui/controller/home_page_controller.dart';
import 'package:ahsun_habib/screens/home/ui/widgets/project_card.dart';
import 'package:flutter/material.dart';

class RecentProjectSection extends StatelessWidget {
  RecentProjectSection({super.key});

  final HomePageController homePageController = HomePageController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= 1008;
    final isTablet = width >= 640 && width < 1008;
    final isMobile = width < 640;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF8FAFC),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 50.0 : (isTablet ? 70.0 : 90.0),
        horizontal: isMobile ? 20.0 : 40.0,
      ),
      child: CenteredView(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Section Header: "— Recent Projects —"
            _buildSectionHeader(isMobile),
            const SizedBox(height: 14),

            // Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                AppTexts.descriptionOfTheRecentProjectSection,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Asap',
                  fontSize: isMobile ? 15 : 17,
                  color: AppColors.textSlate,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 48),

            // Project Cards Grid
            _buildProjectsGrid(width, isDesktop, isTablet, isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(bool isMobile) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 32,
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.accentTeal,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 14),
        Text(
          'Recent Projects',
          style: TextStyle(
            fontFamily: 'Asap',
            fontSize: isMobile ? 28 : 36,
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(width: 14),
        Container(
          width: 32,
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.accentTeal,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectsGrid(
      double screenWidth, bool isDesktop, bool isTablet, bool isMobile) {
    final icons = [
      Icons.location_on_rounded,
      Icons.groups_rounded,
      Icons.health_and_safety_rounded,
      Icons.check_circle_outline_rounded,
      Icons.assignment_outlined,
    ];
    final colors = [
      const Color(0xFF0288D1),
      const Color(0xFF7B1FA2),
      const Color(0xFFE53935),
      const Color(0xFF2E7D32),
      const Color(0xFFEF6C00),
    ];
    final bgs = [
      const Color(0xFFE1F5FE),
      const Color(0xFFF3E5F5),
      const Color(0xFFFFEBEE),
      const Color(0xFFE8F5E9),
      const Color(0xFFFFF3E0),
    ];

    final cards = List.generate(homePageController.projects.length, (index) {
      final project = homePageController.projects[index];
      return ModernProjectCard(
        project: project,
        categoryIcon: icons[index % icons.length],
        categoryColor: colors[index % colors.length],
        categoryBg: bgs[index % bgs.length],
      );
    });

    if (isMobile) {
      return Column(
        children: cards
            .map((card) => Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: card,
                ))
            .toList(),
      );
    }

    final double cardWidth = isTablet
        ? (screenWidth - 80 - 24) / 2
        : (1400 - 80 - 48) / 3;

    return Wrap(
      spacing: 24,
      runSpacing: 28,
      alignment: WrapAlignment.center,
      children: cards
          .map((card) => SizedBox(
                width: cardWidth.clamp(300.0, 420.0),
                child: card,
              ))
          .toList(),
    );
  }
}
