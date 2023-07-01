import 'package:flutter/foundation.dart';
import 'dart:async';

class DebouncerDuration {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  DebouncerDuration({required this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
