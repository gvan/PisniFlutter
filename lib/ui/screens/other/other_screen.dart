import 'package:flutter/material.dart';
import 'package:pisni/ui/extensions/localization.dart';
import 'package:pisni/ui/extensions/styles.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key});

  void openFavorite(BuildContext context) {
    Navigator.of(context).pushNamed('/favorite');
  }

  void openSettings(BuildContext context) {
    Navigator.of(context).pushNamed('/settings');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.other),
      ),
      body: Column(
        children: [
          _MenuItem(
              icon: Icons.star,
              title: context.loc.favorite,
              onPress: () {
                openFavorite(context);
              }),
          _MenuItem(
              icon: Icons.settings,
              title: context.loc.settings,
              onPress: () {
                openSettings(context);
              })
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPress;

  const _MenuItem(
      {required this.icon, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: context.textStyles.bodyLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
