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
    return Container(
      padding: const EdgeInsets.all(25),
      width: 380,
      height: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          color: Colors.teal.shade100,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            height: 70,
            child: Image.asset(
              imageSource,
              fit: BoxFit.fitHeight,
              color: color,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
