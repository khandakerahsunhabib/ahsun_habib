import 'package:ahsun_habib/app/widgets/centered_view.dart';
import 'package:ahsun_habib/core/theme/app_colors.dart';
import 'package:ahsun_habib/core/utils/app_texts.dart';
import 'package:ahsun_habib/core/utils/assets_path.dart';
import 'package:ahsun_habib/core/widgets/dot_grid_painter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMeSection extends StatelessWidget {
  final VoidCallback? onViewProjectsTap;

  const AboutMeSection({
    super.key,
    this.onViewProjectsTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= 1008;
    final isTablet = width >= 640 && width < 1008;
    final isMobile = width < 640;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.primaryNavy,
        gradient: AppColors.heroNavyGradient,
      ),
      child: Stack(
        children: [
          // Decorative dot grids
          Positioned(
            top: 40,
            left: 20,
            child: SizedBox(
              width: 100,
              height: 100,
              child: CustomPaint(
                painter: const DotGridPainter(
                  dotColor: Color(0x1F20C997),
                  spacing: 14,
                  dotRadius: 1.5,
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 30,
            child: SizedBox(
              width: 120,
              height: 120,
              child: CustomPaint(
                painter: const DotGridPainter(
                  dotColor: Color(0x2620C997),
                  spacing: 16,
                  dotRadius: 1.5,
                ),
              ),
            ),
          ),

          // Main Hero Content
          Column(
            children: [
              CenteredView(
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24.0 : (isTablet ? 36.0 : 48.0),
                    vertical: isMobile ? 40.0 : (isTablet ? 60.0 : 90.0),
                  ),
                  child: isDesktop
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 11,
                              child: _buildHeroLeft(context, isMobile, isTablet),
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              flex: 9,
                              child: _buildHeroRight(context, width),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildHeroRight(context, width),
                            const SizedBox(height: 48),
                            _buildHeroLeft(context, isMobile, isTablet),
                          ],
                        ),
                ),
              ),

              // Bottom Curved Wave Transition to white content
              _buildBottomWave(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeroLeft(BuildContext context, bool isMobile, bool isTablet) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Flutter Developer Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: const Color(0x1F20C997),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color(0x4020C997),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.accentTeal,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x8020C997),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Flutter Developer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                  fontFamily: 'Asap',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Main Headline: "Hi, I'm Ahsun Habib"
        RichText(
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'Asap',
              fontSize: isMobile ? 36 : (isTablet ? 48 : 58),
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.15,
              letterSpacing: -0.5,
            ),
            children: const [
              TextSpan(text: "Hi, I'm "),
              TextSpan(
                text: "Ahsun Habib",
                style: TextStyle(
                  color: AppColors.accentTeal,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Subtitle: "I'm a Mobile App Developer"
        Text(
          AppTexts.heroSectionSubHeading,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontFamily: 'Asap',
            fontSize: isMobile ? 20 : (isTablet ? 24 : 28),
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),

        // Description paragraph
        Text(
          AppTexts.aboutMeDescription,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontFamily: 'Asap',
            fontSize: isMobile ? 15 : 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF94A3B8),
            height: 1.65,
          ),
        ),
        const SizedBox(height: 32),

        // Action Buttons: View My Projects & Download CV
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 16,
          runSpacing: 14,
          children: [
            // View My Projects Button
            _HoverPillButton(
              label: 'View My Projects',
              icon: Icons.arrow_forward_rounded,
              isPrimary: true,
              onTap: onViewProjectsTap ?? () {},
            ),

            // Download CV Button
            _HoverPillButton(
              label: 'Download CV',
              icon: Icons.download_rounded,
              isPrimary: false,
              onTap: () => launchUrl(
                Uri.parse(
                  'https://drive.google.com/file/d/1-GaoLUDarQ8xM98wBGAs5nLwpkwg61pb/view?usp=drive_link',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 36),

        // Social Icons Row
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 14,
          runSpacing: 10,
          children: [
            _buildSocialIcon(
              url: 'https://www.linkedin.com/in/ahsunhabib/',
              iconPath: AssetsPath.linkedin,
              iconFallback: Icons.link,
            ),
            _buildSocialIcon(
              url: 'https://github.com/khandakerahsunhabib',
              iconPath: AssetsPath.github,
              iconFallback: Icons.code,
            ),
            _buildSocialIcon(
              url: 'https://www.facebook.com/ahsun.habib.980',
              iconPath: AssetsPath.facebook,
              iconFallback: Icons.facebook,
            ),
            _buildSocialIcon(
              url: 'https://www.youtube.com/@HungerEntertainment',
              iconPath: AssetsPath.youtube,
              iconFallback: Icons.play_arrow_rounded,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroRight(BuildContext context, double screenWidth) {
    final isMobile = screenWidth < 640;
    final isTablet = screenWidth >= 640 && screenWidth < 1008;

    double imageSize = 480;
    if (isMobile) {
      imageSize = (screenWidth - 48).clamp(260.0, 360.0);
    } else if (isTablet) {
      imageSize = 400;
    }

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Subtle Cyan Ambient Glow behind image
          Container(
            width: imageSize * 0.95,
            height: imageSize * 0.95,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(80),
                topRight: Radius.circular(160),
                bottomLeft: Radius.circular(120),
                bottomRight: Radius.circular(80),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3320C997),
                  blurRadius: 50,
                  spreadRadius: 10,
                ),
              ],
            ),
          ),

          // Profile Image with Smooth Asymmetric Blob Border
          Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0x6620C997),
                width: 3,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(70),
                topRight: Radius.circular(150),
                bottomLeft: Radius.circular(110),
                bottomRight: Radius.circular(70),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x66000000),
                  blurRadius: 24,
                  offset: Offset(0, 12),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage(AssetsPath.ahsunHabibPassingTimeOnPhone),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon({
    required String url,
    required String iconPath,
    required IconData iconFallback,
  }) {
    return _HoverSocialButton(
      url: url,
      iconPath: iconPath,
    );
  }

  Widget _buildBottomWave() {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeroBottomWavePainter(),
      ),
    );
  }
}

class _HeroBottomWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.backgroundLight
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.6);

    // Smooth organic wave curve
    path.cubicTo(
      size.width * 0.3,
      0,
      size.width * 0.65,
      size.height,
      size.width,
      size.height * 0.3,
    );

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _HoverPillButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onTap;

  const _HoverPillButton({
    required this.label,
    required this.icon,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  State<_HoverPillButton> createState() => _HoverPillButtonState();
}

class _HoverPillButtonState extends State<_HoverPillButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_isHovered ? const Color(0xFF26E0A8) : AppColors.accentTeal)
                : (_isHovered
                    ? const Color(0x1F20C997)
                    : const Color(0xFF0A1530)),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: widget.isPrimary
                  ? Colors.transparent
                  : (_isHovered
                      ? AppColors.accentTeal
                      : const Color(0x4DFFFFFF)),
              width: 1.5,
            ),
            boxShadow: widget.isPrimary
                ? [
                    BoxShadow(
                      color: _isHovered
                          ? const Color(0x6620C997)
                          : const Color(0x3320C997),
                      blurRadius: _isHovered ? 16 : 8,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!widget.isPrimary) ...[
                Icon(
                  widget.icon,
                  size: 18,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: TextStyle(
                  fontFamily: 'Asap',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: widget.isPrimary
                      ? const Color(0xFF060B1E)
                      : Colors.white,
                ),
              ),
              if (widget.isPrimary) ...[
                const SizedBox(width: 8),
                Icon(
                  widget.icon,
                  size: 16,
                  color: const Color(0xFF060B1E),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _HoverSocialButton extends StatefulWidget {
  final String url;
  final String iconPath;

  const _HoverSocialButton({
    required this.url,
    required this.iconPath,
  });

  @override
  State<_HoverSocialButton> createState() => _HoverSocialButtonState();
}

class _HoverSocialButtonState extends State<_HoverSocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: _isHovered
                ? const Color(0x2620C997)
                : const Color(0xFF0D1B3E),
            shape: BoxShape.circle,
            border: Border.all(
              color: _isHovered
                  ? AppColors.accentTeal
                  : const Color(0x2EFFFFFF),
              width: 1.5,
            ),
            boxShadow: _isHovered
                ? const [
                    BoxShadow(
                      color: Color(0x3320C997),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Image.asset(
              widget.iconPath,
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}
