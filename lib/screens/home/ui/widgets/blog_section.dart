import 'package:ahsun_habib/app/widgets/centered_view.dart';
import 'package:ahsun_habib/core/theme/app_colors.dart';
import 'package:ahsun_habib/core/utils/assets_path.dart';
import 'package:flutter/material.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

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
            // Section Header: "— My Blog —"
            _buildSectionHeader(isMobile),
            const SizedBox(height: 14),

            // Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Sharing my thoughts, experiences, and tutorials on Flutter, Dart, and mobile development.',
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

            // Blog Cards Grid
            _buildBlogGrid(context, width, isDesktop, isTablet, isMobile),
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
          'My Blog',
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

  Widget _buildBlogGrid(BuildContext context, double screenWidth,
      bool isDesktop, bool isTablet, bool isMobile) {
    final posts = [
      _BlogData(
        title: 'Mastering State Management with GetX',
        description:
            'A complete guide to manage state in Flutter using GetX with practical examples.',
        fullSnippet:
            'An in-depth look at state management in Flutter using GetX. Learn how to manage reactive state, routing, and dependency injection efficiently for production apps.',
        date: 'May 12, 2025',
        category: 'Flutter',
        categoryColor: const Color(0xFF00BFA5),
        bannerGradient: const [Color(0xFFE0F7FA), Color(0xFFB2EBF2)],
        iconAsset: AssetsPath.flutterIcon,
      ),
      _BlogData(
        title: 'Designing Responsive Portfolios in Flutter',
        description:
            'Create stunning and responsive portfolios with Flutter across mobile, tablet, and web.',
        fullSnippet:
            'A comprehensive guide on implementing responsive grid layouts, dynamic navigation elements, screen-size specific builders, and cross-platform desktop/web optimizations.',
        date: 'April 28, 2025',
        category: 'Web Dev',
        categoryColor: const Color(0xFF7C4DFF),
        bannerGradient: const [Color(0xFFEDE7F6), Color(0xFFD1C4E9)],
        iconData: Icons.laptop_mac_rounded,
      ),
      _BlogData(
        title: 'API Integration with Best Coding Practices',
        description:
            'Learn how to integrate APIs in Flutter apps efficiently with clean architecture.',
        fullSnippet:
            'Explore clean architecture patterns when integrating RESTful APIs in Dart. Learn handling errors, model parsing, repository patterns, and background workers.',
        date: 'March 20, 2025',
        category: 'Dart',
        categoryColor: const Color(0xFF00C853),
        bannerGradient: const [Color(0xFFE1F5FE), Color(0xFFB3E5FC)],
        iconAsset: AssetsPath.dartIcon,
      ),
    ];

    final cards = posts.map((post) => _ModernBlogCard(post: post)).toList();

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

class _BlogData {
  final String title;
  final String description;
  final String fullSnippet;
  final String date;
  final String category;
  final Color categoryColor;
  final List<Color> bannerGradient;
  final String? iconAsset;
  final IconData? iconData;

  _BlogData({
    required this.title,
    required this.description,
    required this.fullSnippet,
    required this.date,
    required this.category,
    required this.categoryColor,
    required this.bannerGradient,
    this.iconAsset,
    this.iconData,
  });
}

class _ModernBlogCard extends StatefulWidget {
  final _BlogData post;

  const _ModernBlogCard({required this.post});

  @override
  State<_ModernBlogCard> createState() => _ModernBlogCardState();
}

class _ModernBlogCardState extends State<_ModernBlogCard> {
  bool _isHovered = false;

  void _showReader(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          widget.post.title,
          style: const TextStyle(
            fontFamily: 'Asap',
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: widget.post.categoryColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.post.category,
                      style: TextStyle(
                        color: widget.post.categoryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.post.date,
                    style: const TextStyle(
                      color: AppColors.textSlate,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                widget.post.fullSnippet,
                style: const TextStyle(
                  fontFamily: 'Asap',
                  fontSize: 16,
                  color: AppColors.textDark,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              'Close',
              style: TextStyle(color: AppColors.accentTeal, fontWeight: FontWeight.bold),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
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
            // Top Banner with Category Badge & Graphic
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(19)),
              child: Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: widget.post.bannerGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    // Center Icon / Illustration
                    Center(
                      child: widget.post.iconAsset != null
                          ? Image.asset(
                              widget.post.iconAsset!,
                              width: 64,
                              height: 64,
                              fit: BoxFit.contain,
                            )
                          : Icon(
                              widget.post.iconData,
                              size: 64,
                              color: const Color(0xFF5E35B1),
                            ),
                    ),

                    // Category Badge in Top Left
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: widget.post.categoryColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x33000000),
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          widget.post.category,
                          style: const TextStyle(
                            fontFamily: 'Asap',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Card Body
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.post.title,
                    style: const TextStyle(
                      fontFamily: 'Asap',
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.post.description,
                    style: const TextStyle(
                      fontFamily: 'Asap',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSlate,
                      height: 1.55,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),

                  // Footer: Date & Read More ->
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.calendar_today_rounded,
                            size: 14,
                            color: AppColors.textSlate,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            widget.post.date,
                            style: const TextStyle(
                              fontFamily: 'Asap',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSlate,
                            ),
                          ),
                        ],
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => _showReader(context),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'Read More',
                                style: TextStyle(
                                  fontFamily: 'Asap',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.accentTeal,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 14,
                                color: AppColors.accentTeal,
                              ),
                            ],
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
