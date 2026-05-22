import 'package:flutter/material.dart';

class CustomSkillBox extends StatelessWidget {
  final String imageSource;
  final String title;
  final String description;
  final Color? color;

  const CustomSkillBox({
    super.key,
    required this.imageSource,
    required this.title,
    required this.description,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 640;
    final isTablet = width >= 640 && width < 1008;

    final boxWidth = isMobile
        ? (width - 40)
        : (isTablet
            ? (width - 65) / 2
            : 380.0);
    final titleStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
          fontSize: isMobile ? 20 : 25,
        );
    final bodyStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: isMobile ? 15 : 20,
        );

    return Container(
      padding: const EdgeInsets.all(25),
      width: boxWidth,
      constraints: BoxConstraints(
        minHeight: isMobile ? 220.0 : 320.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          color: Colors.teal.shade100,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: isMobile ? 50 : 70,
            height: isMobile ? 50 : 70,
            child: Image.asset(
              imageSource,
              fit: BoxFit.fitHeight,
              color: color,
            ),
          ),
          SizedBox(
            height: isMobile ? 15 : 30,
          ),
          Text(
            title,
            style: titleStyle,
          ),
          SizedBox(
            height: isMobile ? 15 : 25,
          ),
          Text(
            description,
            style: bodyStyle,
          ),
        ],
      ),
    );
  }
}
