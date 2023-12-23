import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_project/common/theme/app_theme_import.dart';
import 'package:test_user_project/feature/presentation/pages/home/logic/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Поиск'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'История поиска',
            icon: const Icon(AppIcons.manageSearch),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: AppColors.white),
            onPressed: () => bloc.add(const ThemeUpdateEvent()),
            onLongPress: () => bloc.add(ThemeUpdateEvent(
              isDarkTheme: !bloc.state.themeSettings.isDark,
            )),
            child: const Icon(AppIcons.lightbulb),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(AppIcons.list),
        onPressed: () {},
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                style: AppTextStyles.normalText,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search_rounded),
                  hintText: 'Число от 1 до 30',
                  contentPadding: EdgeInsets.all(16),
                  hintStyle: AppTextStyles.normalText,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Найти'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
