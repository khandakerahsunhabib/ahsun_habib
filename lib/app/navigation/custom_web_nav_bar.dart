import 'package:ahsun_habib/app/widgets/animated_button.dart';
import 'package:ahsun_habib/app/widgets/centered_view.dart';
import 'package:ahsun_habib/app/navigation/navbar_item.dart';
import 'package:flutter/material.dart';

class CustomWebNavBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomWebNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.grey,
      elevation: 8.0,
      titleSpacing: 0.0,
      toolbarHeight: 98.0,
      title: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black87,
              Colors.grey.shade500,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CenteredView(Row(
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
                const AnimatedButton(
                  buttonLabel: 'Contact Me',
                  hoverColor: Colors.teal,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(98.0);
}
