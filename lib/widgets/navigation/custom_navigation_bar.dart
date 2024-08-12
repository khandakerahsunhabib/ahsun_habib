import 'package:flutter/material.dart';
import 'navbar_item.dart';
import 'navbar_logo.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavbarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavbarItem(title: 'Home'),
              SizedBox(
                width: 30,
              ),
              NavbarItem(title: 'About'),
              SizedBox(
                width: 30,
              ),
              NavbarItem(title: 'Services'),
              SizedBox(
                width: 30,
              ),
              NavbarItem(title: 'Education'),
              SizedBox(
                width: 30,
              ),
              NavbarItem(title: 'Portfolio'),
              SizedBox(
                width: 30,
              ),
              NavbarItem(title: 'Blog'),
              SizedBox(
                width: 30,
              ),
              NavbarItem(title: 'Contact'),
            ],
          )
        ],
      ),
    );
  }
}
