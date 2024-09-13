import 'package:flutter/material.dart';
import 'package:project_todolist/app/themes/app_theme.dart';
import 'pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: AppTheme.light,
    );
  }
}
