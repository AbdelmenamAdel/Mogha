import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> urlLauncher(BuildContext context, String url) async {
 final Uri Url = Uri.parse(url);
  if (!await launchUrl(
      Url,
      mode: LaunchMode
          .externalNonBrowserApplication
  )) {
   log('Could not launch $url');
  }
  if (await canLaunchUrl(Url)) {
    await launchUrl(Url);
  } else {

  }
}
