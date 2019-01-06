import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokapp/pokemon.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {

  // definimos a nossa cor - (0xFF)#b800b8
  final magenta = const Color(0xFFB800B8);

  var url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  PokeHub pokeHub;
  
  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body); // recebe formato JSON
    pokeHub = PokeHub.fromJson(decodedJson); // Json é inserido no nosso Model pokemon

    setState(() {}); // 30:05
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokApp'),
        backgroundColor: magenta,
      ),
      body: pokeHub == null ? Center(
        child: CircularProgressIndicator(),
      ) 
      : GridView.count(
        crossAxisCount: 2, // duas colunas
        children: pokeHub.pokemon.map((poke) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            elevation: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(poke.img)
                    )
                  ),
                ),
                Text(
                  poke.name, 
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        )).toList(),
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: magenta,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
