import 'package:ahsun_habib/core/theme/custom_theme.dart';
import 'package:ahsun_habib/core/utils/app_texts.dart';
import 'package:ahsun_habib/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class KAHWebApp extends StatelessWidget {
  const KAHWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppTexts.appTitle,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
