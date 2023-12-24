import 'package:flutter/material.dart';

class ErrorStatusWidget extends StatelessWidget {
  final String errorMessage;
  final Future<void> Function() updateStatus;

  const ErrorStatusWidget({
    super.key,
    required this.errorMessage,
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
            errorMessage,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () async => await updateStatus(),
            child: const Text('Обновить'),
          ),
        ],
      ),
    );
  }
}
