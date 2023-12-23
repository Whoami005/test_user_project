import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:test_user_project/core/service_locator/injection.dart';
import 'package:test_user_project/feature/presentation/pages/home/logic/home_bloc.dart';
import 'package:test_user_project/feature/presentation/pages/home/screens/home_screen.dart';

import 'common/theme/app_theme.dart';
import 'core/bloc/bloc_observer.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      configureDependencies();
      Bloc.observer = BlocsObserver();

      return runApp(const MyApp());
    },
    (error, stack) {
      debugPrint('$error, $stack');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(const ThemeUpdateEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (_, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: getTheme(state.themeSettings),
            routerDelegate: RoutemasterDelegate(routesBuilder: (_) => routes),
            routeInformationParser: const RoutemasterParser(),
          );
        },
      ),
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
