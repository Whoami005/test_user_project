import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:test_user_project/common/theme/app_theme_import.dart';
import 'package:test_user_project/core/enums/logic_state_status.dart';
import 'package:test_user_project/core/service_locator/injection.dart';
import 'package:test_user_project/feature/data/models/user_model.dart';
import 'package:test_user_project/feature/presentation/pages/user_details/logic/user_details_bloc.dart';
import 'package:test_user_project/feature/presentation/widgets/cached_network_image_widget.dart';
import 'package:test_user_project/feature/presentation/widgets/error_status_widget.dart';
import 'package:test_user_project/feature/presentation/widgets/shimmer_user_details_widget.dart';

class UserDetailsScreen extends StatelessWidget {
  final int userId;
  final UserModel? user;

  const UserDetailsScreen({super.key, this.user, required this.userId});

  const UserDetailsScreen.search({super.key, required this.userId})
      : user = null;

  static NavigationResult<T> searchRoute<T>({
    required BuildContext context,
    required int userId,
  }) =>
      Routemaster.of(context).push('/$userId');

  static MaterialPageRoute<T> route<T>({required UserModel user}) {
    builder(BuildContext _) => UserDetailsScreen(userId: user.id, user: user);

    return MaterialPageRoute(builder: builder, fullscreenDialog: true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = getIt<UserDetailsBloc>(param1: user, param2: userId);

        return user == null ? (bloc..add(SearchUser(userId))) : bloc;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Идентификатор $userId')),
        body: BlocBuilder<UserDetailsBloc, UserDetailsState>(
          builder: (context, state) {
            final bloc = context.read<UserDetailsBloc>();
            final currentUser = state.user;

            return Padding(
              padding: const EdgeInsets.all(10),
              child: switch (state.status) {
                LogicStateStatus.success when currentUser != null => Column(
                    children: [
                      CachedNetworkImageWidget(
                        imageUrl: currentUser.avatar,
                        width: double.infinity,
                        borderRadius: 20,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${currentUser.firstName} ${currentUser.lastName}',
                        style: AppTextStyles.title20bold,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 10),
                      Text(currentUser.email),
                    ],
                  ),
                LogicStateStatus.error => ErrorStatusWidget(
                    errorInfo: state.errorInfo,
                    updateStatus: () async => bloc.add(SearchUser(userId)),
                  ),
                _ => const ShimmerUserDetailsWidget(),
              },
            );
          },
        ),
      ),
    );
  }
}
