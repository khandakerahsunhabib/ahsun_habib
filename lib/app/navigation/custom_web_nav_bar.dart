import 'package:ahsun_habib/app/widgets/animated_button.dart';
import 'package:ahsun_habib/app/widgets/centered_view.dart';
import 'package:ahsun_habib/app/navigation/navbar_item.dart';
import 'package:ahsun_habib/core/utils/assets_path.dart';
import 'package:flutter/material.dart';

class CustomWebNavBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onNavItemTap;

  const CustomWebNavBar({
    super.key,
    required this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= 1008;

    return AppBar(
      shadowColor: Colors.grey,
      elevation: 8.0,
      titleSpacing: 0.0,
      automaticallyImplyLeading: false, // We handle drawer opening manually
      toolbarHeight: isDesktop ? 98.0 : 70.0,
      title: Container(
        height: isDesktop ? 98.0 : 70.0,
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
            Expanded(
              child: CenteredView(
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: isDesktop
                        ? [
                            SizedBox(
                              width: 250,
                              height: 80,
                              child: Image.asset(AssetsPath.websiteLogo, fit: BoxFit.contain),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                NavbarItem(
                                  title: 'Home',
                                  onTap: () => onNavItemTap('Home'),
                                ),
                                const SizedBox(width: 25),
                                NavbarItem(
                                  title: 'Skills',
                                  onTap: () => onNavItemTap('Skills'),
                                ),
                                const SizedBox(width: 25),
                                NavbarItem(
                                  title: 'Projects',
                                  onTap: () => onNavItemTap('Projects'),
                                ),
                                const SizedBox(width: 25),
                                NavbarItem(
                                  title: 'Blog',
                                  onTap: () => onNavItemTap('Blog'),
                                ),
                                const SizedBox(width: 25),
                                NavbarItem(
                                  title: 'About Me',
                                  onTap: () => onNavItemTap('About Me'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 44,
                              child: AnimatedButton(
                                buttonLabel: 'Contact Me',
                                hoverColor: Colors.teal,
                                onTap: () => onNavItemTap('Contact Me'),
                              ),
                            ),
                          ]
                        : [
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: Image.asset(AssetsPath.websiteLogo, fit: BoxFit.contain),
                            ),
                            Builder(
                              builder: (context) => IconButton(
                                icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                              ),
                            ),
                          ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    final view = WidgetsBinding.instance.platformDispatcher.views.first;
    final width = view.physicalSize.width / view.devicePixelRatio;
    return Size.fromHeight(width >= 1008 ? 98.0 : 70.0);
  }
}
