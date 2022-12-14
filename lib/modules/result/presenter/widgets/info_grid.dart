import 'package:flutter/material.dart';
import 'package:petize_teste/modules/result/domain/entities/user.dart';
import 'package:petize_teste/utils/functions/custom_launch_url.dart';
import 'package:url_launcher/url_launcher.dart';

import 'info_tile.dart';

class InfoGrid extends StatelessWidget {
  final Size size;
  final User user;
  const InfoGrid({super.key, required this.size, required this.user});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      runSpacing: size.height * .0224,
      spacing: size.width * .01,
      children: [
        Visibility(
          visible: user.company.isNotEmpty,
          child: InfoTile(
              size: size,
              iconPath: 'assets/icons/company.png',
              title: user.company),
        ),
        Visibility(
          visible: user.location.isNotEmpty,
          child: InfoTile(
              size: size,
              iconPath: 'assets/icons/location.png',
              title: user.location),
        ),
        Visibility(
          visible: user.email.isNotEmpty,
          child: InfoTile(
              size: size,
              iconPath: 'assets/icons/email.png',
              onTap: () async {
                await customLaunchUrl("mailto:${user.email}");
              },
              title: user.email),
        ),
        Visibility(
          visible: user.blog.isNotEmpty,
          child: InfoTile(
              size: size,
              iconPath: 'assets/icons/blog.png',
              onTap: () async {
                await customLaunchUrl(user.blog);
              },
              title: user.blog),
        ),
        Visibility(
          visible: user.twitterUsername.isNotEmpty,
          child: InfoTile(
              size: size,
              iconPath: 'assets/icons/twitter.png',
              onTap: () async {
                await customLaunchUrl(
                    "https://twitter.com/${user.twitterUsername}");
              },
              title: '@${user.twitterUsername}'),
        ),
      ],
    );
  }
}
