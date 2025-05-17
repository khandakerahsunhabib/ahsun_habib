import 'package:ahsun_habib/app/widgets/animated_button.dart';
import 'package:ahsun_habib/app/widgets/navbar_item.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 300,
          height: 100,
          child: Image.asset('assets/images/ahsun-habib.png'),
        ),
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            NavbarItem(title: 'Home'),
            SizedBox(width: 25),
            NavbarItem(title: 'Skills'),
            SizedBox(width: 25),
            NavbarItem(title: 'Projects'),
            SizedBox(width: 25),
            NavbarItem(title: 'Blog'),
            SizedBox(width: 25),
            NavbarItem(title: 'About Me'),
          ],
        ),
        AnimatedButton(
          buttonLabel: 'Contact Me',
          hoverColor: Colors.teal,
        ),
      ],
    );
  }
}
