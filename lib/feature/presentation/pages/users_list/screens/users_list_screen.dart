import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:test_user_project/core/enums/logic_state_status.dart';
import 'package:test_user_project/core/service_locator/injection.dart';
import 'package:test_user_project/feature/presentation/pages/users_list/logic/users_list_bloc.dart';
import 'package:test_user_project/feature/presentation/pages/users_list/widgets/shimmer_card.dart';
import 'package:test_user_project/feature/presentation/pages/users_list/widgets/user_card.dart';
import 'package:test_user_project/feature/presentation/widgets/error_status_widget.dart';

class UsersListScreen extends StatelessWidget {
  const UsersListScreen({super.key});

  static NavigationResult<T> navigation<T>(BuildContext context) =>
      Routemaster.of(context).push('/users');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UsersListBloc>()..add(const GetUsersEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Пользователи')),
        body: BlocBuilder<UsersListBloc, UsersListState>(
          builder: (context, state) {
            final bloc = context.read<UsersListBloc>();

            return SafeArea(
              bottom: false,
              child: switch (state.status) {
                LogicStateStatus.success => ListView.separated(
                    itemCount: state.users.length,
                    itemBuilder: (_, index) {
                      final user = state.users[index];

                      return UserCard(user: user);
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                  ),
                LogicStateStatus.error => ErrorStatusWidget(
                    errorInfo: state.errorInfo,
                    updateStatus: () async => bloc.add(const GetUsersEvent()),
                  ),
                _ => ListView.builder(
                    itemBuilder: (_, __) => const ShimmerCard(),
                  ),
              },
            );
          },
        ),
      ),
    );
  }
}
