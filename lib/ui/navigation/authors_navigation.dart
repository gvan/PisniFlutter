import 'package:flutter/material.dart';
import 'package:pisni/ui/authors/authors_view_model.dart';
import 'package:pisni/ui/authors/authors_screen.dart';
import 'package:pisni/ui/songs/songs_screen.dart';
import 'package:provider/provider.dart';

class AuthorsNavigation extends StatefulWidget {
  final Key navigatorKey;
  const AuthorsNavigation({super.key, required this.navigatorKey});

  @override
  State<StatefulWidget> createState() => _AuthorsNavigationState();
}

class _AuthorsNavigationState extends State<AuthorsNavigation> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (settings) {
      return MaterialPageRoute(builder: (context) {
        switch (settings.name) {
          case '/':
            return AuthorsScreen(
                viewModel: AuthorsViewModel(songsRepository: context.read()));
          case '/songs':
            return SongsScreen();
        }
        return const SizedBox.shrink();
      });
    });
  }
}
