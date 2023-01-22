import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trawenscore/routes.dart';
import 'package:trawenscore/theme.dart';
//import 'package:trawenscore/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      theme: buildAppTheme(),
      routes: buildAppRoutes()
    );
  }
}

