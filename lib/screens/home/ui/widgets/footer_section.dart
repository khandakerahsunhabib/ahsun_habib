import 'package:ahsun_habib/app/widgets/centered_view.dart';
import 'package:ahsun_habib/core/theme/app_colors.dart';
import 'package:ahsun_habib/core/widgets/dot_grid_painter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

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
        horizontal: isMobile ? 16.0 : (isTablet ? 30.0 : 40.0),
        vertical: isMobile ? 30.0 : 60.0,
      ),
      child: CenteredView(
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryNavy,
            gradient: const LinearGradient(
              colors: [Color(0xFF070E22), Color(0xFF0B1736), Color(0xFF09132E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 30,
                offset: Offset(0, 15),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Decorative Dot Grid on the right side
              Positioned(
                top: 20,
                right: 20,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CustomPaint(
                    painter: const DotGridPainter(
                      dotColor: Color(0x1F20C997),
                      spacing: 12,
                      dotRadius: 1.5,
                    ),
                  ),
                ),
              ),

              // Card Content
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24.0 : (isTablet ? 36.0 : 48.0),
                  vertical: isMobile ? 32.0 : 44.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Row: Paper plane icon + Heading & Subtitle + Contact Button
                    isDesktop
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _buildPaperPlaneIcon(),
                              const SizedBox(width: 20),
                              Expanded(
                                child: _buildHeaderText(isMobile),
                              ),
                              _buildContactMeButton(),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  _buildPaperPlaneIcon(),
                                  const SizedBox(width: 16),
                                  Expanded(child: _buildHeaderText(isMobile)),
                                ],
                              ),
                              const SizedBox(height: 24),
                              _buildContactMeButton(),
                            ],
                          ),
                    const SizedBox(height: 36),
                    const Divider(color: Color(0x1AFFFFFF), height: 1),
                    const SizedBox(height: 36),

                    // Bottom Row: 3 Contact Columns (Phone, Email, Follow)
                    isMobile
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildContactColumn(
                                icon: Icons.phone_android_rounded,
                                title: 'Phone Me',
                                value: '+8801308-166502',
                                onTap: () => launchUrl(
                                    Uri.parse('tel:+8801308166502')),
                              ),
                              const SizedBox(height: 24),
                              _buildContactColumn(
                                icon: Icons.mail_outline_rounded,
                                title: 'Mail Me',
                                value: 'ahsunhabib96bd@gmail.com',
                                onTap: () => launchUrl(
                                    Uri.parse('mailto:ahsunhabib96bd@gmail.com')),
                              ),
                              const SizedBox(height: 24),
                              _buildContactColumn(
                                icon: Icons.link_rounded,
                                title: 'Follow Me',
                                value: '/in/ahsunhabib/',
                                onTap: () => launchUrl(Uri.parse(
                                    'https://www.linkedin.com/in/ahsunhabib/')),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: _buildContactColumn(
                                  icon: Icons.phone_android_rounded,
                                  title: 'Phone Me',
                                  value: '+8801308-166502',
                                  onTap: () => launchUrl(
                                      Uri.parse('tel:+8801308166502')),
                                ),
                              ),
                              Expanded(
                                child: _buildContactColumn(
                                  icon: Icons.mail_outline_rounded,
                                  title: 'Mail Me',
                                  value: 'ahsunhabib96bd@gmail.com',
                                  onTap: () => launchUrl(
                                      Uri.parse('mailto:ahsunhabib96bd@gmail.com')),
                                ),
                              ),
                              Expanded(
                                child: _buildContactColumn(
                                  icon: Icons.link_rounded,
                                  title: 'Follow Me',
                                  value: '/in/ahsunhabib/',
                                  onTap: () => launchUrl(Uri.parse(
                                      'https://www.linkedin.com/in/ahsunhabib/')),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaperPlaneIcon() {
    return Transform.rotate(
      angle: -0.2,
      child: Container(
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          color: const Color(0x1F20C997),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0x4020C997),
            width: 1.5,
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.send_rounded,
            color: AppColors.accentTeal,
            size: 28,
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's Talk!",
          style: TextStyle(
            fontFamily: 'Asap',
            fontSize: isMobile ? 26 : 32,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          "Have a project in mind or just want to say hello? I'd love to hear from you.",
          style: TextStyle(
            fontFamily: 'Asap',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }

  Widget _buildContactMeButton() {
    return _HoverContactButton(
      onTap: () => launchUrl(Uri.parse('mailto:ahsunhabib96bd@gmail.com')),
    );
  }

  Widget _buildContactColumn({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0x1F20C997),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0x4020C997),
                  width: 1.5,
                ),
              ),
              child: Icon(
                icon,
                color: AppColors.accentTeal,
                size: 20,
              ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Asap',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF94A3B8),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontFamily: 'Asap',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HoverContactButton extends StatefulWidget {
  final VoidCallback onTap;

  const _HoverContactButton({required this.onTap});

  @override
  State<_HoverContactButton> createState() => _HoverContactButtonState();
}

class _HoverContactButtonState extends State<_HoverContactButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
          decoration: BoxDecoration(
            color: _isHovered ? const Color(0xFF26E0A8) : AppColors.accentTeal,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? const Color(0x6620C997)
                    : const Color(0x3320C997),
                blurRadius: _isHovered ? 16 : 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Contact Me',
                style: TextStyle(
                  fontFamily: 'Asap',
                  color: Color(0xFF060B1E),
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.2,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_rounded,
                size: 16,
                color: Color(0xFF060B1E),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
