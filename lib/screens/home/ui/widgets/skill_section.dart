import 'package:ahsun_habib/app/widgets/centered_view.dart';
import 'package:ahsun_habib/core/theme/app_colors.dart';
import 'package:ahsun_habib/core/utils/app_texts.dart';
import 'package:ahsun_habib/core/utils/assets_path.dart';
import 'package:ahsun_habib/screens/home/ui/widgets/custom_skill_box.dart';
import 'package:flutter/material.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= 1008;
    final isTablet = width >= 640 && width < 1008;
    final isMobile = width < 640;

    return Container(
      width: double.infinity,
      color: AppColors.backgroundLight,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 50.0 : (isTablet ? 70.0 : 90.0),
        horizontal: isMobile ? 20.0 : 40.0,
      ),
      child: CenteredView(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Section Header: "— My Skills —"
            _buildSectionHeader(isMobile),
            const SizedBox(height: 14),

            // Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'With a strong foundation in Dart and Flutter, I specialize in crafting high-performance mobile apps.',
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

            // Skills Responsive Grid
            _buildSkillsGrid(width, isDesktop, isTablet, isMobile),
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
          'My Skills',
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

  Widget _buildSkillsGrid(
      double screenWidth, bool isDesktop, bool isTablet, bool isMobile) {
    final skillCards = [
      // 1. Flutter SDK
      const CustomSkillBox(
        imageSource: AssetsPath.flutterIcon,
        iconBgColor: Color(0xFFE0F7FA),
        title: AppTexts.flutterTitle,
        description: AppTexts.description2,
      ),
      // 2. Dart Programming
      const CustomSkillBox(
        iconData: Icons.code_rounded,
        iconColor: Color(0xFF0288D1),
        iconBgColor: Color(0xFFE1F5FE),
        title: AppTexts.dartTitle,
        description: AppTexts.description1,
      ),
      // 3. State Management
      const CustomSkillBox(
        iconData: Icons.settings_rounded,
        iconColor: Color(0xFF00ACC1),
        iconBgColor: Color(0xFFE0F2F1),
        title: AppTexts.stateManageTitle,
        description: AppTexts.description3,
      ),
      // 4. UI/UX Design
      const CustomSkillBox(
        iconData: Icons.palette_rounded,
        iconColor: Color(0xFF8E24AA),
        iconBgColor: Color(0xFFF3E5F5),
        title: AppTexts.uiOrUxTitle,
        description: AppTexts.description4,
      ),
      // 5. Backend Integration
      const CustomSkillBox(
        iconData: Icons.layers_rounded,
        iconColor: Color(0xFF00897B),
        iconBgColor: Color(0xFFE0F2F1),
        title: AppTexts.backendTitle,
        description: AppTexts.description5,
      ),
      // 6. Version Control
      const CustomSkillBox(
        iconData: Icons.verified_user_rounded,
        iconColor: Color(0xFF43A047),
        iconBgColor: Color(0xFFE8F5E9),
        title: AppTexts.versionTitle,
        description: AppTexts.description6,
      ),
    ];

    if (isMobile) {
      return Column(
        children: skillCards
            .map((card) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: card,
                ))
            .toList(),
      );
    }

    final double cardWidth = isTablet
        ? (screenWidth - 80 - 20) / 2
        : (1400 - 80 - 48) / 3;

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: skillCards
          .map((card) => SizedBox(
                width: cardWidth.clamp(280.0, 440.0),
                child: card,
              ))
          .toList(),
    );
  }
}
