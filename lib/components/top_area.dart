import 'package:flutter/material.dart';
import 'package:star_wars_wiki/screens/in_app_web_view_screen.dart';
import 'package:star_wars_wiki/widgets/website_button.dart';

class TopArea extends StatelessWidget {
  const TopArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          WebSiteButton(
            text: 'Site Oficial',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => InAppWebViewScreen(),
                ),
              );
            },
          ),
          Icon(
            Icons.account_circle,
            size: 48,
          ),
        ],
      ),
    );
  }
}
