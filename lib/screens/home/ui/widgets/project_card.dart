import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final List<String> tools;
  final String codeUrl;
  final String demoUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.tools,
    required this.codeUrl,
    required this.demoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),

                // Description
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),

                // Chips
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: tools
                      .map((tool) => Chip(
                            label: Text(tool),
                            backgroundColor: Colors.green.shade50,
                            labelStyle: const TextStyle(color: Colors.green),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 16),

                // Buttons
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {
                        launchUrl(Uri.parse(codeUrl));
                      },
                      icon: const Icon(Icons.code),
                      label: const Text('Code'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade900,
                      ),
                      onPressed: () {
                        launchUrl(Uri.parse(demoUrl));
                      },
                      icon: const Icon(Icons.open_in_new),
                      label: const Text('Demo'),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
