import 'package:flutter/material.dart';

class NavbarLogo extends StatelessWidget {
  const NavbarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: Image.asset('assets/images/ahsun-habib.png'),
    );
  }
}
