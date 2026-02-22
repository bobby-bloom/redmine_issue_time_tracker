class DurationUtils {
  static Duration roundUpToMinuteInterval(
    Duration duration,
    int intervalMinutes,
  ) {
    if (intervalMinutes <= 0) {
      return duration;
    }

    final interval = Duration(minutes: intervalMinutes);
    final remainder = duration.inMilliseconds % interval.inMilliseconds;

    if (remainder == 0) {
      return duration;
    }

    final difference = interval.inMilliseconds - remainder;
    return Duration(milliseconds: duration.inMilliseconds + difference);
  }

  static Duration roundToNearestMinuteInterval(
    Duration duration,
    int intervalMinutes,
  ) {
    if (intervalMinutes <= 0) {
      throw ArgumentError('intervalMinutes must be greater than 0');
    }

    final intervalMs = Duration(minutes: intervalMinutes).inMilliseconds;
    final durationMs = duration.inMilliseconds;

    final roundedMs =
        ((durationMs + intervalMs / 2) ~/ intervalMs) * intervalMs;

    return Duration(milliseconds: roundedMs);
  }
}
