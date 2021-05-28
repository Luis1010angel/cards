import 'package:flutter/material.dart';
import 'package:flluter_aplication_widgets/pages/home_page.dart';
import 'package:flluter_aplication_widgets/pages/alert_page.dart';
import 'package:flluter_aplication_widgets/pages/card_page.dart';
import 'package:flluter_aplication_widgets/pages/avatar_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'alert': (BuildContext context) => AlertPage(),
        'avatar': (BuildContext context) => AvatarPage(),
        'card': (BuildContext context) => CardPage(),
        
        
        
      },
      debugShowCheckedModeBanner: false,
    );
  }
}