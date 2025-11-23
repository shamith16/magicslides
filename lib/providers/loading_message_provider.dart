import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_message_provider.g.dart';

@riverpod
class LoadingMessageNotifier extends _$LoadingMessageNotifier {
  Timer? _timer;
  DateTime? _startTime;
  int? _slideCount;
  String? _topic;

  @override
  String? build() => null;

  void start({int? slideCount, String? topic}) {
    _timer?.cancel();
    _slideCount = slideCount;
    _topic = (topic?.trim().isEmpty ?? true) ? null : topic!.trim();
    _startTime = DateTime.now();
    state = _messageForElapsed(Duration.zero);

    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (_startTime == null) return;
      final elapsed = DateTime.now().difference(_startTime!);
      state = _messageForElapsed(elapsed);
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    _startTime = null;
    _slideCount = null;
    _topic = null;
    state = null;
  }

  String _messageForElapsed(Duration elapsed) {
    final seconds = elapsed.inSeconds;
    if (seconds < 5) {
      return 'Gathering sparks of inspiration...';
    } else if (seconds < 12) {
      if (_slideCount != null && _slideCount! > 0) {
        return 'Structuring $_slideCount slides into a flowing story...';
      }
      return 'Structuring your storyline...';
    } else if (seconds < 20) {
      final topicHint = _topic != null && _topic!.isNotEmpty
          ? '"${_topic!.length > 24 ? '${_topic!.substring(0, 24)}…' : _topic!}"'
          : 'your topic';
      return 'Coaching our design AI on $topicHint visuals...';
    } else if (seconds < 30) {
      return 'Applying final polish & speaker notes...';
    } else {
      return 'Finalizing your deck for download...';
    }
  }
}
