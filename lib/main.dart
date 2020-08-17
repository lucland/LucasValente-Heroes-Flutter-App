import 'package:flutter/material.dart';
import 'package:lucasvalente_heroes_flutter/screens/hero_detail_screen.dart';
import 'package:lucasvalente_heroes_flutter/shared/constants.dart';
import 'screens/home_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kBackground,
        accentColor: kBackground,
      ),
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/detalhe': (context) => HeroeDetailScreen(),
      },
    );
  }
}