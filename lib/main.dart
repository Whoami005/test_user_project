import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:test_user_project/core/service_locator/injection.dart';
import 'package:test_user_project/feature/data/models/user_model.dart';
import 'package:test_user_project/feature/presentation/pages/home/logic/home_bloc.dart';
import 'package:test_user_project/feature/presentation/pages/home/screens/home_screen.dart';
import 'package:test_user_project/feature/presentation/pages/user_details/screens/user_details_screen.dart';
import 'package:test_user_project/feature/presentation/pages/users_list/screens/users_list_screen.dart';

import 'common/theme/app_theme.dart';
import 'core/bloc/bloc_observer.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await configureDependencies();
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
      lazy: false,
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
  onUnknownRoute: (_) => const Redirect('/'),
  routes: {
    '/': (_) => const MaterialPage(child: HomeScreen()),
    '/:id': (route) {
      final id = int.parse(route.pathParameters['id']!);

      return MaterialPage(
        fullscreenDialog: true,
        child: UserDetailsScreen(user: UserModel(id: id)),
      );
    },
    '/users': (_) => const MaterialPage(child: UsersListScreen()),
  },
);
