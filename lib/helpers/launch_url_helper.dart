import 'package:url_launcher/url_launcher.dart';

class LaunchUrlHelper {
  static void launchURL(Uri url) async {
    await canLaunchUrl(url)
        ? await launchUrl(url)
        : throw Exception("Can't launch $url");
  }
}
