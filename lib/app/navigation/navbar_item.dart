import 'package:ahsun_habib/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NavbarItem extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const NavbarItem({
    super.key,
    required this.title,
    this.isActive = false,
    required this.onTap,
  });

  @override
  State<NavbarItem> createState() => _NavbarItemState();
}

class _NavbarItemState extends State<NavbarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool showActive = widget.isActive || _isHovered;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: showActive ? Colors.white : const Color(0xFFCBD5E1),
                  fontSize: 16,
                  fontWeight: widget.isActive ? FontWeight.w700 : FontWeight.w500,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 6),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2.5,
                width: widget.isActive ? 28 : (_isHovered ? 18 : 0),
                decoration: BoxDecoration(
                  color: AppColors.accentTeal,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
