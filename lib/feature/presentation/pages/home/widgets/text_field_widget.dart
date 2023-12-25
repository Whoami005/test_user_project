import 'package:flutter/material.dart';
import 'package:test_user_project/common/theme/app_theme_import.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController _controller;
  final int userId;
  final bool isButtonEnabled;
  final bool checkRestrictions;
  final void Function(String) onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function() textFieldClear;

  const SearchTextField({
    super.key,
    required TextEditingController controller,
    required this.userId,
    required this.isButtonEnabled,
    required this.checkRestrictions,
    required this.onChanged,
    this.onFieldSubmitted,
    required this.textFieldClear,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.search,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: AppTextStyles.normalText,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: (_) {
        final isNotEmpty = _controller.text.isNotEmpty;

        if (isNotEmpty && userId == -1) return 'Неверный формат';

        if (isNotEmpty && !checkRestrictions) return 'Неверное число';

        return null;
      },
      decoration: InputDecoration(
        suffixIcon: _controller.text.isEmpty
            ? const Icon(AppIcons.searchRounded)
            : IconButton(
                onPressed: textFieldClear,
                icon: const Icon(AppIcons.clear),
              ),
        hintText: 'Число от 1 до 30',
        contentPadding: const EdgeInsets.all(16),
        hintStyle: AppTextStyles.normalText,
      ),
    );
  }
}
