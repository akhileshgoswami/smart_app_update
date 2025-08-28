import 'package:intl/intl.dart';

/// Utility helpers used by the package. Mirrors the behaviour you had:
/// - isHoursPassed(storedDateTimeString, minutes) -> returns false if snooze still active.
/// - addHours(minutes) -> returns an ISO-like datetime string to store.
class AppConstants {
  /// Expects a stored string previously written by [addHours].
  /// Returns true when the [storedDateTimeString] is older than [minutes] minutes.
  static bool isHoursPassed(String storedDateTimeString, int minutes) {
    try {
      final stored = DateTime.parse(storedDateTimeString).toUtc();
      final now = DateTime.now().toUtc();
      final diff = now.difference(stored);
      return diff.inMinutes >= minutes;
    } catch (_) {
      return true; // If parse error, treat as passed.
    }
  }

  /// Returns a UTC timestamp string representing now + [minutes] minutes.
  /// This mirrors the behavior of saving a snooze-until time.
  static String addHours(int minutes) {
    final dt = DateTime.now().toUtc().add(Duration(minutes: minutes));
    // Use ISO8601
    return dt.toIso8601String();
  }

  /// Optional helper to format DateTime into readable string
  static String format(DateTime dt) {
    try {
      return DateFormat.yMMMMd().add_jm().format(dt.toLocal());
    } catch (_) {
      return dt.toString();
    }
  }
}
