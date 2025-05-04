import 'package:flutter/material.dart';
import 'package:pisni/ui/extensions/localization.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white, title: Text(context.loc.settings)),
      body: Column(
        children: [],
      ),
    );
  }
}
