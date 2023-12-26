import 'package:flutter/material.dart';
import 'package:test_user_project/common/theme/app_icons.dart';

class CustomElevatedButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Size minimumSize;

  const CustomElevatedButton({
    super.key,
    this.icon = AppIcons.clear,
    this.onPressed,
    this.borderRadius = 12,
    this.minimumSize = const Size(48, 48),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: minimumSize,
        backgroundColor: theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white),
    );
  }
}
