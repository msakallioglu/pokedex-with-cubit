import 'package:flutter/material.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/navigation/route_generator.dart';
import 'core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: RouteGenerator.instance.routeGenerator,
    );
  }
}

