import 'package:ahsun_habib/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CopyrightSection extends StatelessWidget {
  const CopyrightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.backgroundLight,
      padding: const EdgeInsets.only(bottom: 30, top: 10, left: 16, right: 16),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            style: TextStyle(
              fontFamily: 'Asap',
              fontSize: 14,
              color: AppColors.textSlate,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(text: 'Copyright © 2025  Built with '),
              TextSpan(
                text: '❤️',
                style: TextStyle(fontSize: 13),
              ),
              TextSpan(
                text: ' by Ahsun Habib',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
