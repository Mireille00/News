import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
 static const String routeName='home-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: Icon(Icons.drag_handle_outlined),
      ),
    );
  }
}
