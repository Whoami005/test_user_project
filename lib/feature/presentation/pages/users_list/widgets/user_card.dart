import 'package:flutter/material.dart';
import 'package:test_user_project/common/theme/app_theme_import.dart';
import 'package:test_user_project/feature/data/models/user_model.dart';
import 'package:test_user_project/feature/presentation/pages/user_details/screens/user_details_screen.dart';
import 'package:test_user_project/feature/presentation/widgets/cached_network_image_widget.dart';

class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImageWidget(imageUrl: user.avatar),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.firstName} ${user.lastName}',
                      style: AppTextStyles.title20bold,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10),
                    Text(user.email),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () async => await Navigator.push(
        context,
        UserDetailsScreen.route(user: user),
      ),
    );
  }
}
