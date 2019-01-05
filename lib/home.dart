import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokApp'),
        backgroundColor: Colors.deepPurple,
      ),

      body: Center(
        child: Text('Hallo!'),
      ),

      drawer: Drawer(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.refresh),
      ),
    );
  }
}