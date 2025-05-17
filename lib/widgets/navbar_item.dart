import 'package:flutter/material.dart';

class NavbarItem extends StatefulWidget {
  final String title;

  const NavbarItem({super.key, required this.title});

  @override
  State<NavbarItem> createState() => _NavbarItemState();
}

class _NavbarItemState extends State<NavbarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isHovered = true;
      }),
      onExit: (_) => setState(() {
        _isHovered = false;
      }),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: AnimatedDefaultTextStyle(
          curve: Curves.easeOut,
          style: TextStyle(
              color: _isHovered ? Colors.black : Colors.white, fontSize: 18),
          duration: Duration(milliseconds: 300),
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: _isHovered ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              widget.title,
            ),
          ),
        ),
      ),
    );
  }
}
