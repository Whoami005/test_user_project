import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_project/common/theme/app_text_styles.dart';
import 'package:test_user_project/common/theme/app_theme_import.dart';
import 'package:test_user_project/core/enums/logic_state_status.dart';
import 'package:test_user_project/core/service_locator/injection.dart';
import 'package:test_user_project/feature/presentation/pages/users_search_history/logic/user_search_history_bloc.dart';
import 'package:test_user_project/feature/presentation/pages/users_search_history/widgets/user_list_tile.dart';
import 'package:test_user_project/feature/presentation/pages/users_search_history/widgets/user_search_widget.dart';
import 'package:test_user_project/feature/presentation/widgets/error_status_widget.dart';

class SearchHistoryBottomSheet extends StatelessWidget {
  const SearchHistoryBottomSheet({super.key});

  static Future<void> showDialog(BuildContext context) async {
    await showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      elevation: 0,
      context: context,
      builder: (context) => const FractionallySizedBox(
        heightFactor: 0.9,
        child: SearchHistoryBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<UserSearchHistoryBloc>()..add(const GetHistoryUsersEvent()),
      child: Column(
        children: [
          const UserSearchWidget(),
          const Divider(height: 1),
          Expanded(
            child: BlocBuilder<UserSearchHistoryBloc, UserSearchHistoryState>(
              builder: (context, state) {
                final bloc = context.read<UserSearchHistoryBloc>();

                return switch (state.status) {
                  LogicStateStatus.success when state.users.isEmpty =>
                    const Center(
                      child: Text(
                        'Пусто...',
                        style: AppTextStyles.title20bold,
                      ),
                    ),
                  LogicStateStatus.success => ListView.separated(
                      itemBuilder: (_, index) {
                        final user = state.users[index];

                        return UserListTile(
                          user: user,
                          deleteHistory: () async =>
                              bloc.add(RemoveSearchUserEvent(user)),
                        );
                      },
                      separatorBuilder: (_, __) => const Divider(height: 5),
                      itemCount: state.users.length,
                    ),
                  LogicStateStatus.error => ErrorStatusWidget(
                      errorInfo: state.errorInfo,
                      updateStatus: () async =>
                          bloc.add(const GetHistoryUsersEvent()),
                    ),
                  _ => const Center(child: CircularProgressIndicator()),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
