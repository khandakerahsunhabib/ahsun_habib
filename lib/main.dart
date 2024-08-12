import 'package:ahsun_habib/theme/custom_theme.dart';
import 'package:ahsun_habib/utilities/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:ahsun_habib/screens/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
