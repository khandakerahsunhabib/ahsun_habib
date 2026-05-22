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
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 640;
    final isTablet = width >= 640 && width < 1008;

    final titleStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: isMobile ? 32 : (isTablet ? 45 : 60),
        );
    final descStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: isMobile ? 15 : (isTablet ? 18 : 20),
        );

    final double carouselHeight = isMobile
        ? 380
        : ((isTablet || width < 1200)
            ? 420
            : 480);
    final double viewportFraction = isMobile
        ? 0.85
        : (width < 1200
            ? 0.6
            : 0.4);

    return SectionPadding(
      topPadding: isMobile ? 40.0 : 100.0,
      bottomPadding: isMobile ? 40.0 : 100.0,
      child: CenteredView(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Recent Projects',
                style: titleStyle,
              ),
              const SizedBox(height: 20),
              Text(
                AppTexts.descriptionOfTheRecentProjectSection,
                style: descStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
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
                          padding: EdgeInsets.all(isMobile ? 12.0 : 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                project.title,
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                      fontSize: isMobile ? 16 : 20,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                project.description,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontSize: isMobile ? 13 : 16),
                                maxLines: isMobile ? 3 : 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 36,
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
                                    style: TextStyle(
                                            color: Colors.white,
                                            fontSize: isMobile ? 14 : 16,
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
                  height: carouselHeight,
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 800),
                  viewportFraction: viewportFraction,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
