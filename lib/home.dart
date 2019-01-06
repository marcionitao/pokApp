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
    // print(res.body);
    pokeHub = PokeHub.fromJson(decodedJson); // Json é inserido no nosso Model pokemon
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokApp'),
        backgroundColor: Colors.deepPurple,
      ),
      body: GridView.count(
        crossAxisCount: 2, // duas colunas
        children: pokeHub.pokemon.map((poke) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(poke.img) // 26:34
                    )
                  ),
                )
              ],
            ),
          ),
        )).toList(),
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
