import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class BlocsObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    log(
      '${bloc.runtimeType} -'
      '\n   CURRENTSTATE: ${change.currentState}'
      '\n'
      '\n   NEXTSTATE: ${change.nextState}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    log('${bloc.runtimeType}\n  ERROR: $error');
  }
}
