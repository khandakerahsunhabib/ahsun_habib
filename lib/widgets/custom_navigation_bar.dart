import 'package:ahsun_habib/widgets/navbar_item.dart';
import 'package:ahsun_habib/widgets/navbar_logo.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const NavbarLogo(),
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            NavbarItem(title: 'Home'),
            SizedBox(
              width: 30,
            ),
            NavbarItem(title: 'Skills'),
            SizedBox(
              width: 30,
            ),
            NavbarItem(title: 'Projects'),
            SizedBox(
              width: 30,
            ),
            NavbarItem(title: 'Blog'),
            SizedBox(
              width: 30,
            ),
            NavbarItem(title: 'About'),
          ],
        ),
        SizedBox(
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            onPressed: () {
              print('You clicked on the button');
            },
            child: Text(
              'Contact Me',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 18,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
