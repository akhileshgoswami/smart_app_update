
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utility {
  /// Checks if the given datetime has exceeded the specified minutes.
  static bool isHoursPassed(String givenDateTime, {bool savedInUtc = true}) {
    try {
      final dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(givenDateTime);
      final currentTime = DateTime.now();
      return currentTime.isAfter(dateTime); // true if the given time has passed
    } catch (e) {
      return true; // fallback if parsing fails
    }
  }

  /// Returns a new datetime string after adding given minutes to current time.
  static String addHours(int minutes) {
    final newTime = DateTime.now().add(Duration(minutes: minutes));
    return DateFormat("yyyy-MM-dd HH:mm:ss").format(newTime);
  }

  /// Opens the provided URL in an external browser.
  static Future<void> launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
