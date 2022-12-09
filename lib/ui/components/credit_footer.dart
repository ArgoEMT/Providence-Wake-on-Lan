import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditFooter extends StatelessWidget {
  const CreditFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Theme.of(context).platform == TargetPlatform.android ||
        Theme.of(context).platform == TargetPlatform.iOS;
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.primary,
      child: Padding(
        padding: isMobile
            ? const EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 16)
            : const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Made with ', style: TextStyle(color: colorScheme.onPrimary)),
            Icon(Icons.favorite, color: colorScheme.secondary),
            Text(' by ', style: TextStyle(color: colorScheme.onPrimary)),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: isMobile
                    ? null
                    : () => launchUrl(Uri.parse('https://github.com/ArgoEMT')),
                child: Text(
                  'ArgoEMT',
                  style: TextStyle(color: colorScheme.onPrimary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
