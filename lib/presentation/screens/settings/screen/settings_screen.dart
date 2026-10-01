import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pisni/data/models/settings/settings_model.dart';
import 'package:pisni/presentation/core/theme_cubit.dart';
import 'package:pisni/presentation/extensions/localization.dart';
import 'package:pisni/presentation/extensions/styles.dart';
import 'package:pisni/presentation/screens/settings/cubit/settings_cubit.dart';
import 'package:pisni/presentation/screens/settings/cubit/settings_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.settings)),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return state.settings != null
              ? _SettingsContent()
              : CircularProgressIndicator();
        },
      ),
    );
  }
}

class _SettingsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsCubit = context.read<SettingsCubit>();
    final themeViewModel = context.read<ThemeCubit>();
    final AppThemeMode theme = context.select((SettingsCubit viewModel) {
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
                child: Text(
                  context.loc.theme,
                  style: context.textStyles.bodyLarge,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<AppThemeMode>(
                  value: theme,
                  items: AppThemeMode.values
                      .map(
                        (e) => DropdownMenuItem<AppThemeMode>(
                          value: e,
                          child: Text(context.loc.themeMode(e.mode)),
                        ),
                      )
                      .toList(),
                  onChanged: (mode) {
                    settingsCubit.changeThemeMode(mode!);
                    themeViewModel.loadTheme();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
