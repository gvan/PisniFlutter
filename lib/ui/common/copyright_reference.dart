import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pisni/ui/extensions/localization.dart';
import 'package:pisni/ui/extensions/styles.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CopyrightReference extends StatelessWidget {
  final Widget child;

  const CopyrightReference({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: child),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: '${context.loc.source}: ',
                  style: context.textStyles.bodySmall,
                ),
                TextSpan(
                    text: 'pisni.org.ua',
                    style: context.textStyles.bodySmall
                        ?.copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrlString('https://www.pisni.org.ua',
                            mode: LaunchMode.externalApplication);
                      }),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
