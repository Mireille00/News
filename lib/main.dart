import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/home/home-screen.dart';
import 'package:news/my-Theme.dart';

void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.lightTheme,
    );
  }
}


