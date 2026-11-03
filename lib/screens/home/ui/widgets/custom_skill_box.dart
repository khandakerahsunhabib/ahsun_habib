import 'package:ahsun_habib/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSkillBox extends StatefulWidget {
  final String? imageSource;
  final IconData? iconData;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String description;

  const CustomSkillBox({
    super.key,
    this.imageSource,
    this.iconData,
    this.iconColor = AppColors.accentTeal,
    this.iconBgColor = const Color(0xFFE6FFFA),
    required this.title,
    required this.description,
  });

  @override
  State<CustomSkillBox> createState() => _CustomSkillBoxState();
}

class _CustomSkillBoxState extends State<CustomSkillBox> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? Matrix4.translationValues(0, -4, 0)
            : Matrix4.identity(),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? const Color(0xFF20C997).withValues(alpha: 0.5)
                : const Color(0xFFE2E8F0),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? const Color(0x1A20C997)
                  : const Color(0x08000000),
              blurRadius: _isHovered ? 20 : 12,
              offset: Offset(0, _isHovered ? 6 : 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon container
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: widget.iconBgColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: widget.imageSource != null
                    ? Image.asset(
                        widget.imageSource!,
                        width: 28,
                        height: 28,
                        fit: BoxFit.contain,
                      )
                    : Icon(
                        widget.iconData,
                        color: widget.iconColor,
                        size: 26,
                      ),
              ),
            ),
            const SizedBox(width: 16),

            // Title and Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontFamily: 'Asap',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontFamily: 'Asap',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSlate,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
