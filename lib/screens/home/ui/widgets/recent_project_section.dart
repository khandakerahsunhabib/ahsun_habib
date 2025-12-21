import 'package:ahsun_habib/app/widgets/centered_view.dart';
import 'package:ahsun_habib/app/widgets/section_padding.dart';
import 'package:ahsun_habib/core/utils/app_texts.dart';
import 'package:ahsun_habib/screens/home/ui/controller/home_page_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class RecentProjectSection extends StatelessWidget {
  RecentProjectSection({super.key});

  final HomePageController homePageController = HomePageController();

  @override
  Widget build(BuildContext context) {
    return SectionPadding(
      child: CenteredView(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Recent Projects',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              AppTexts.descriptionOfTheRecentProjectSection,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                CarouselSlider.builder(
                  itemCount: homePageController.projects.length,
                  itemBuilder: (context, index, realIndex) {
                    final project = homePageController.projects[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 6,
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16)),
                              child: Image.asset(
                                project.image,
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text(
                                  project.title,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  project.description,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      backgroundColor: Colors.teal,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'View Project On Github',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 450,
                    aspectRatio: 16 / 9,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.4,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
