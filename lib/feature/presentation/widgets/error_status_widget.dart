import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:test_user_project/core/error/exception.dart';

class ErrorStatusWidget extends StatelessWidget {
  final AppException errorInfo;
  final Future<void> Function() updateStatus;

  const ErrorStatusWidget({
    super.key,
    required this.errorInfo,
    required this.updateStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            errorInfo.message,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async => switch (errorInfo) {
              NotFoundException() => Routemaster.of(context).pop(),
              _ => await updateStatus(),
            },
            child: switch (errorInfo) {
              NotFoundException() => const Text('Перейти к поиску'),
              _ => const Text('Обновить'),
            },
          ),
        ],
      ),
    );
  }
}
