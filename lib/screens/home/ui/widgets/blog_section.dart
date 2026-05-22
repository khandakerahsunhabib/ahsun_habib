import 'package:flutter/material.dart';
import 'package:ahsun_habib/app/widgets/centered_view.dart';
import 'package:ahsun_habib/app/widgets/section_padding.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 640;
    final isTablet = width >= 640 && width < 1008;

    // Responsive fonts
    final titleStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: isMobile ? 32 : (isTablet ? 45 : 60),
        );
    final descStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: isMobile ? 16 : 20,
        );

    return CenteredView(
      SectionPadding(
        topPadding: isMobile ? 50.0 : 100.0,
        bottomPadding: isMobile ? 50.0 : 100.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'My Blog',
              style: titleStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Sharing my thoughts, experiences, and tutorials on Flutter, Dart, and mobile development.',
                style: descStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50),
            _buildBlogList(context, isMobile, isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildBlogList(BuildContext context, bool isMobile, bool isTablet) {
    final posts = [
      _BlogPost(
        title: 'Mastering State Management with GetX',
        snippet: 'An in-depth look at state management in Flutter using GetX. Learn how to manage state, routing, and dependency injection efficiently.',
        date: 'May 12, 2026',
        category: 'Flutter',
        gradient: const [Colors.teal, Colors.tealAccent],
      ),
      _BlogPost(
        title: 'Designing Responsive Portfolios in Flutter',
        snippet: 'A comprehensive guide on implementing responsive grid layouts, dynamic navigation elements, and screen-size specific builders.',
        date: 'April 28, 2026',
        category: 'Web Dev',
        gradient: const [Colors.purple, Colors.deepPurpleAccent],
      ),
      _BlogPost(
        title: 'API Integration with Best Coding Practices',
        snippet: 'Explore clean architecture patterns when integrating RESTful APIs in Dart. Learn handling errors, model parsing, and repository patterns.',
        date: 'March 15, 2026',
        category: 'Dart',
        gradient: const [Colors.blue, Colors.lightBlueAccent],
      ),
    ];

    if (isMobile) {
      return Column(
        children: posts.map((post) => Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: _buildBlogCard(context, post, double.infinity),
        )).toList(),
      );
    }

    if (isTablet) {
      return Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.center,
        children: posts.map((post) => _buildBlogCard(context, post, 320)).toList(),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: posts.map((post) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: _buildBlogCard(context, post, double.infinity),
        ),
      )).toList(),
    );
  }

  Widget _buildBlogCard(BuildContext context, _BlogPost post, double cardWidth) {
    return Container(
      width: cardWidth,
      height: 380,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.teal.shade50),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: post.gradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      post.category,
                      style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 15,
                  child: Text(
                    post.date,
                    style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        post.snippet,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(post.title),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                Text('Category: ${post.category} • Published on: ${post.date}\n'),
                                Text(post.snippet),
                                const SizedBox(height: 15),
                                const Text('This is a simulated blog reader view. Full post integration can connect to Markdown resources or a database.'),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text('Close'),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Read More', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward, size: 16, color: Colors.teal),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BlogPost {
  final String title;
  final String snippet;
  final String date;
  final String category;
  final List<Color> gradient;

  _BlogPost({
    required this.title,
    required this.snippet,
    required this.date,
    required this.category,
    required this.gradient,
  });
}
