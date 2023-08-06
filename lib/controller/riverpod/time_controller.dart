import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

final timerProvider =
    StateNotifierProvider<TimerNotifier, int>((ref) => TimerNotifier());

class TimerNotifier extends StateNotifier<int> {
  TimerNotifier() : super(Duration(seconds: 60).inSeconds);

  Timer? _timer;
  final int initialDuration = Duration(minutes: 1).inSeconds;
  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }

    const oneMinute = Duration(seconds: 1);

    _timer = Timer.periodic(oneMinute, (timer) {
      state = state - 1;

      if (state <= 0) {
        timer.cancel();
      }
    });
  }

  void timerReset() {
    _timer?.cancel();
    state = initialDuration;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
