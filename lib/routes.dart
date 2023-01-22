import 'package:flutter/material.dart';
import 'package:trawenscore/pages/config.dart';
import 'package:trawenscore/pages/home.dart';

Map<String, WidgetBuilder> buildAppRoutes(){
  return {
    '/home':(BuildContext context) => const Home(),
    '/config':(BuildContext context) => const Config(),
  };
}