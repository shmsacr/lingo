import 'package:flutter_riverpod/flutter_riverpod.dart';

final stopwatchProvider =
    StateNotifierProvider<StopwatchNotifier, Duration>((ref) {
  return StopwatchNotifier();
});

class StopwatchNotifier extends StateNotifier<Duration> {
  StopwatchNotifier() : super(Duration.zero);

  bool _isRunning = false;
  late final Stopwatch _stopwatch = Stopwatch();

  bool get isRunning => _isRunning;

  void start() {
    if (!_isRunning) {
      _isRunning = true;
      _stopwatch.start();
      _updateTime();
    }
  }

  void stop() {
    if (_isRunning) {
      _isRunning = false;
      _stopwatch.stop();
    }
  }

  void reset() {
    _isRunning = false;
    _stopwatch.reset();
    state = Duration.zero;
  }

  void _updateTime() {
    if (_isRunning) {
      Future.delayed(Duration(milliseconds: 100), () {
        state = _stopwatch.elapsed;
        _updateTime();
      });
    }
  }
}
