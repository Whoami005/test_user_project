import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:test_user_project/feature/presentation/pages/home/screens/home_screen.dart';

import 'common/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: getTheme(),
      routerDelegate: RoutemasterDelegate(routesBuilder: (_) => routes),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}

final routes = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: HomeScreen()),
    // '/users': (_) => const MaterialPage(child: HomeScreen()),
    // '/user/:id': (_) => const MaterialPage(child: HomeScreen()),
  },
);
