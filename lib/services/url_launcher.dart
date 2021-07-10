import 'package:url_launcher/url_launcher.dart';

Future<void> launchYouTube(String url) async {
  await canLaunch(url)
      ? await launch(
          url,
          forceSafariVC: false,
          headers: <String, String>{'my_header_key': 'my_header_value'},
        )
      : throw 'Could not launch $url';
}
