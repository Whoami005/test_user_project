import 'package:flutter/material.dart';
import 'package:test_user_project/common/theme/app_theme_import.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Пусто...',
        style: AppTextStyles.title20bold,
      ),
    );
  }
}
