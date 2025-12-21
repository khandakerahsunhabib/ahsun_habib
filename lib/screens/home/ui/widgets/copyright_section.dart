import 'package:flutter/material.dart';

class CopyrightSection extends StatelessWidget {
  const CopyrightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            "Copyright @ 2025 - Built with Flutter by Khandaker Ahsun Habib",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        )
      ],
    );
  }
}
