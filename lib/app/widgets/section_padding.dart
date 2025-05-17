import 'package:flutter/material.dart';

class SectionPadding extends StatelessWidget {
  final Widget child;
  final double topPadding;
  final double bottomPadding;

  const SectionPadding({
    super.key,
    required this.child,
    this.topPadding = 100.0,
    this.bottomPadding = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        bottom: bottomPadding,
      ),
      child: child,
    );
  }
}
