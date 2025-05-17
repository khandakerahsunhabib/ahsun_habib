import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String buttonLabel;
  final Color hoverColor;
  final Color? textColor;
  final Color buttonBgColor;

  const AnimatedButton({
    super.key,
    required this.buttonLabel,
    required this.hoverColor,
    this.textColor,
    this.buttonBgColor = Colors.white,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
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
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(3),
          color: _isHovered ? widget.hoverColor : widget.buttonBgColor,
        ),
        duration: Duration(
          milliseconds: 250,
        ),
        child: AnimatedDefaultTextStyle(
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: _isHovered ? Colors.white : Colors.teal,
              ),
          duration: Duration(milliseconds: 250),
          child: Text(
            widget.buttonLabel,
          ),
        ),
      ),
    );
  }
}
