import 'package:flutter/material.dart';
import 'package:quotes_app/screens/author.dart';
import 'package:quotes_app/screens/favorite.dart';
import 'package:quotes_app/screens/home_screen.dart';
import 'package:quotes_app/screens/search.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
Future<void> main() async{
  await Hive.initFlutter();
  await Hive.openBox('mibox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes:
      {
        'author':(context)=>author(),
        'search':(context)=>search(),
        'Fav':(context)=>favorite(),
      },
      home: HomeScreen(),
    );
  }
}