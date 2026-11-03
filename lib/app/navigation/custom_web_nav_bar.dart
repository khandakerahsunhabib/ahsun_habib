import 'package:ahsun_habib/app/navigation/navbar_item.dart';
import 'package:ahsun_habib/app/widgets/centered_view.dart';
import 'package:ahsun_habib/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomWebNavBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onNavItemTap;
  final String activeSection;

  const CustomWebNavBar({
    super.key,
    required this.onNavItemTap,
    this.activeSection = 'Home',
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= 1008;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryNavy,
        border: Border(
          bottom: BorderSide(
            color: Color(0x1AFFFFFF),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: CenteredView(
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 40.0 : 20.0,
              vertical: isDesktop ? 16.0 : 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo: [ A ] HSUN HABIB
                _buildLogo(context),

                // Desktop Navigation Items
                if (isDesktop) ...[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NavbarItem(
                        title: 'Home',
                        isActive: activeSection == 'Home',
                        onTap: () => onNavItemTap('Home'),
                      ),
                      const SizedBox(width: 16),
                      NavbarItem(
                        title: 'Skills',
                        isActive: activeSection == 'Skills',
                        onTap: () => onNavItemTap('Skills'),
                      ),
                      const SizedBox(width: 16),
                      NavbarItem(
                        title: 'Projects',
                        isActive: activeSection == 'Projects',
                        onTap: () => onNavItemTap('Projects'),
                      ),
                      const SizedBox(width: 16),
                      NavbarItem(
                        title: 'Blog',
                        isActive: activeSection == 'Blog',
                        onTap: () => onNavItemTap('Blog'),
                      ),
                      const SizedBox(width: 16),
                      NavbarItem(
                        title: 'About Me',
                        isActive: activeSection == 'About Me',
                        onTap: () => onNavItemTap('About Me'),
                      ),
                    ],
                  ),

                  // Contact Me Pill Button
                  _buildContactButton(onTap: () => onNavItemTap('Contact Me')),
                ] else ...[
                  // Mobile Hamburger Menu
                  Builder(
                    builder: (scaffoldContext) => IconButton(
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        Scaffold.of(scaffoldContext).openDrawer();
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onNavItemTap('Home'),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFF0A1530),
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                  color: AppColors.accentTeal,
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3320C997),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'A',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Asap',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'Asap',
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.1,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(text: 'HSUN HABIB'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactButton({required VoidCallback onTap}) {
    return _HoverContactButton(onTap: onTap);
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
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
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          decoration: BoxDecoration(
            gradient: _isHovered
                ? const LinearGradient(
                    colors: [Color(0xFF26E0A8), Color(0xFF14B8A6)],
                  )
                : AppColors.tealGradient,
            borderRadius: BorderRadius.circular(50),
            boxShadow: _isHovered
                ? const [
                    BoxShadow(
                      color: Color(0x5520C997),
                      blurRadius: 16,
                      offset: Offset(0, 4),
                    ),
                  ]
                : const [
                    BoxShadow(
                      color: Color(0x2620C997),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Contact Me',
                style: TextStyle(
                  color: Color(0xFF060B1E),
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.2,
                ),
              ),
              SizedBox(width: 6),
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
