import 'package:ahsun_habib/app/widgets/centered_view.dart';
import 'package:ahsun_habib/app/widgets/section_padding.dart';
import 'package:ahsun_habib/screens/home/ui/project/widgets/project_card.dart';
import 'package:flutter/material.dart';

class RecentProjectSection extends StatelessWidget {
  const RecentProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionPadding(
      child: CenteredView(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Projects',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 400,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProjectCard(
                      title: 'The Green Solution',
                      description:
                          'A QnA-based web application for farmers and agronomists...',
                      imagePath:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaD_LuorX5nbeDsYA6R_6k6t_jXeOW936eXg&s',
                      tools: ['React', 'ExpressJS', 'MongoDB', 'TensorFlow.js'],
                      codeUrl: 'https://github.com/your/repo1',
                      demoUrl: 'https://demo1.vercel.app',
                    ),
                    ProjectCard(
                      title: 'The Green Solution',
                      description:
                          'A QnA-based web application for farmers and agronomists...',
                      imagePath:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaD_LuorX5nbeDsYA6R_6k6t_jXeOW936eXg&s',
                      tools: ['React', 'ExpressJS', 'MongoDB', 'TensorFlow.js'],
                      codeUrl: 'https://github.com/your/repo1',
                      demoUrl: 'https://demo1.vercel.app',
                    ),
                    ProjectCard(
                      title: 'Ekhonni',
                      description:
                          'An e-commerce platform for posting ads and auction bids...',
                      imagePath:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaD_LuorX5nbeDsYA6R_6k6t_jXeOW936eXg&s',
                      tools: [
                        'SpringBoot',
                        'NextJS',
                        'Tailwind CSS',
                        'PostGreSQL'
                      ],
                      codeUrl: 'https://github.com/your/repo2',
                      demoUrl: 'https://demo2.vercel.app',
                    ),
                    ProjectCard(
                      title: 'FurniHaven',
                      description:
                          'A mobile app integrating AR tech and AI for furniture sales...',
                      imagePath:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaD_LuorX5nbeDsYA6R_6k6t_jXeOW936eXg&s',
                      tools: ['Flutter', 'Firebase'],
                      codeUrl: 'https://github.com/your/repo3',
                      demoUrl: 'https://demo3.vercel.app',
                    ),
                    ProjectCard(
                      title: 'FurniHaven',
                      description:
                          'A mobile app integrating AR tech and AI for furniture sales...',
                      imagePath:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaD_LuorX5nbeDsYA6R_6k6t_jXeOW936eXg&s',
                      tools: ['Flutter', 'Firebase'],
                      codeUrl: 'https://github.com/your/repo3',
                      demoUrl: 'https://demo3.vercel.app',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
