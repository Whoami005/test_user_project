import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_project/feature/presentation/pages/users_search_history/logic/user_search_history_bloc.dart';
import 'package:test_user_project/feature/presentation/widgets/buttons/custom_elevated_button.dart';

class UserSearchWidget extends StatelessWidget {
  const UserSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserSearchHistoryBloc>();
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Начни вводить имя...',
                hintStyle: TextStyle(color: theme.hintColor.withOpacity(0.5)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
              onChanged: (text) => bloc.add(SearchUserEvent(text)),
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
            ),
          ),
          const SizedBox(width: 8),
          CustomElevatedButton(
            onPressed: () => bloc.add(const ClearSearchHistoryEvent()),
          ),
        ],
      ),
    );
  }
}
