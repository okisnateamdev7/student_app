import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/routes/route_names.dart';
import 'core/routes/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student App',

      // 🌍 Global Theme
      theme: AppTheme.lightTheme,

      // 🏁 Initial Screen
      initialRoute: RouteNames.splash,

      // 🔁 Centralized Routing
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
