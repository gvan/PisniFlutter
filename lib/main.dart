import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pisni/firebase_options.dart';
import 'package:pisni/presentation/core/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}
