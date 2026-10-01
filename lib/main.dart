import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pisni/core/di/service_locator.dart';
import 'package:pisni/firebase_options.dart';
import 'package:pisni/core/presentation/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}
