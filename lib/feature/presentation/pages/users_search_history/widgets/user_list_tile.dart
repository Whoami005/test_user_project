import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:test_user_project/feature/domain/entities/user_entity.dart';
import 'package:test_user_project/feature/presentation/pages/user_details/screens/user_details_screen.dart';
import 'package:test_user_project/feature/presentation/widgets/cached_network_image_widget.dart';

class UserListTile extends StatelessWidget {
  final UserEntity user;
  final Future<void> Function() deleteHistory;

  const UserListTile({
    super.key,
    required this.user,
    required this.deleteHistory,
  });

  String get fullName => '${user.firstName} ${user.lastName}';

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (_) async => await deleteHistory(),
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Удалить',
          ),
        ],
      ),
      child: ListTile(
        textColor: primaryColor,
        visualDensity: const VisualDensity(horizontal: 4, vertical: 4),
        leading: CachedNetworkImageWidget(imageUrl: user.avatar, width: 80),
        title: Text(fullName),
        subtitle: Text(user.email),
        onTap: () async =>
            await UserDetailsScreen.showDialog(context: context, user: user),
      ),
    );
  }
}
