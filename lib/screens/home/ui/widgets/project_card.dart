import 'package:ahsun_habib/core/theme/app_colors.dart';
import 'package:ahsun_habib/screens/home/models/project.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ModernProjectCard extends StatefulWidget {
  final Project project;
  final IconData categoryIcon;
  final Color categoryColor;
  final Color categoryBg;

  const ModernProjectCard({
    super.key,
    required this.project,
    this.categoryIcon = Icons.location_on_rounded,
    this.categoryColor = const Color(0xFF0288D1),
    this.categoryBg = const Color(0xFFE1F5FE),
  });

  @override
  State<ModernProjectCard> createState() => _ModernProjectCardState();
}

class _ModernProjectCardState extends State<ModernProjectCard> {
  bool _isHovered = false;

  void _openProject() {
    final url = widget.project.link.isNotEmpty
        ? widget.project.link
        : 'https://github.com/khandakerahsunhabib';
    launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? Matrix4.translationValues(0, -6, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? const Color(0xFF20C997).withValues(alpha: 0.5)
                : const Color(0xFFE2E8F0),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? const Color(0x1F20C997)
                  : const Color(0x0A000000),
              blurRadius: _isHovered ? 24 : 14,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Project Banner Thumbnail
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(19)),
              child: SizedBox(
                height: 190,
                width: double.infinity,
                child: Image.asset(
                  widget.project.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Card Body
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon + Project Title
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: widget.categoryBg,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          widget.categoryIcon,
                          color: widget.categoryColor,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          widget.project.title,
                          style: const TextStyle(
                            fontFamily: 'Asap',
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDark,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Description
                  Text(
                    widget.project.description,
                    style: const TextStyle(
                      fontFamily: 'Asap',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSlate,
                      height: 1.55,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),

                  // Footer: "View Project ->" and circular teal button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: _openProject,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'View Project',
                                style: TextStyle(
                                  fontFamily: 'Asap',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.accentTeal,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 14,
                                color: AppColors.accentTeal,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Circle Teal Action Button
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: _openProject,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              color: _isHovered
                                  ? const Color(0xFF26E0A8)
                                  : AppColors.accentTeal,
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x3320C997),
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                size: 16,
                                color: Color(0xFF060B1E),
                              ),
                            ),
                          ),
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
    );
  }
}
