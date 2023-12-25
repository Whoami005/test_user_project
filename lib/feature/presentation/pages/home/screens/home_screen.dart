import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_project/common/theme/app_theme_import.dart';
import 'package:test_user_project/feature/presentation/pages/home/logic/home_bloc.dart';
import 'package:test_user_project/feature/presentation/pages/user_details/screens/user_details_screen.dart';
import 'package:test_user_project/feature/presentation/pages/users_list/screens/users_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get checkRestrictions => userId >= 1 && userId <= 30;

  bool get isButtonEnabled => _controller.text.isNotEmpty && checkRestrictions;

  int get userId => int.tryParse(_controller.text) ?? -1;

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
        onPressed: () => UsersListScreen.route(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _controller,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.search,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: AppTextStyles.normalText,
                onChanged: (text) => setState(() {}),
                validator: (_) {
                  final isNotEmpty = _controller.text.isNotEmpty;

                  if (isNotEmpty && userId == -1) return 'Неверный формат';

                  if (isNotEmpty && !checkRestrictions) return 'Неверное число';

                  return null;
                },
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search_rounded),
                  hintText: 'Число от 1 до 30',
                  contentPadding: EdgeInsets.all(16),
                  hintStyle: AppTextStyles.normalText,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: isButtonEnabled
                    ? () => UserDetailsScreen.searchRoute(
                          context: context,
                          userId: userId,
                        )
                    : null,
                child: const Text('Найти'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
