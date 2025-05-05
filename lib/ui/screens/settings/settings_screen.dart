import 'package:flutter/material.dart';
import 'package:pisni/data/entity/settings.dart';
import 'package:pisni/ui/extensions/localization.dart';
import 'package:pisni/ui/screens/settings/settings_view_model.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.select((SettingsViewModel viewModel) {
      return viewModel.state.settings;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white, title: Text(context.loc.settings)),
      body: settings != null ? _SettingsContent() : CircularProgressIndicator(),
    );
  }
}

class _SettingsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SettingsViewModel>();
    final AppThemeMode theme = context.select((SettingsViewModel viewModel) {
      return viewModel.state.settings!.themeMode;
    });

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(context.loc.theme),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<AppThemeMode>(
                  value: theme,
                  dropdownColor: Colors.white,
                  items: AppThemeMode.values
                      .map(
                        (e) => DropdownMenuItem<AppThemeMode>(
                          value: e,
                          child: Text(context.loc.themeMode(e.mode)),
                        ),
                      )
                      .toList(),
                  onChanged: (mode) {
                    viewModel.changeThemeMode(mode!);
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
