import 'package:url_launcher/url_launcher.dart';

class Utils {
  static phoneCall({required String number}) async {
    final Uri lanuchUri = Uri(
      scheme: 'tel',
      path: number,
    );
    if (await canLaunchUrl(lanuchUri)) {
      await launchUrl(lanuchUri);
    } else {
      launchUrl(lanuchUri);
    }
  }

  static launchLink({required String link}) async {
    final Uri launchUri = Uri.parse(link);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      launchUrl(launchUri);
    }
  }
}
