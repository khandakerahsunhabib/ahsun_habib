import 'package:flutter/material.dart';

class AboutImage extends StatelessWidget {
  const AboutImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(
              'assets/images/profile-picture-of-khandaker-ahsun-habib.jpg'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
