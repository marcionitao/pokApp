import 'package:flutter/material.dart';
import 'package:pokapp/pokemon.dart';

class PokeDetails extends StatelessWidget {
  
  // definimos a nossa cor - (0xFF)#b800b8
  final magenta = const Color(0xFFB800B8);
  final Pokemon pokemon;

  // constructor
  PokeDetails({this.pokemon});

  bodyWidget(BuildContext context) => Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width - 20,
        left: 10,
        top: MediaQuery.of(context).size.height * 0.1,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              SizedBox(
                height: 70,
              ),

              Text(pokemon.name, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              Text("Height: ${pokemon.height}"),
              Text("Weight: ${pokemon.weight}"),
              Text("Types", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.type.map((t) => FilterChip(
                  backgroundColor: Colors.amber,
                  label: Text(t), onSelected: (b) {}
                )).toList(),
              ),
              Text("Weakness", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.weaknesses.map((t) => FilterChip(
                  backgroundColor: Colors.red,
                  label: Text(t, style: TextStyle(color: Colors.white),), onSelected: (b) {}
                )).toList(),
              ),
              Text("Next Evolution", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.nextEvolution.map((n) => FilterChip(
                  backgroundColor: Colors.green,
                  label: Text(n.name, style: TextStyle(color: Colors.white),), onSelected: (b) {}
                )).toList(),
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: pokemon.img, 
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(pokemon.img)
              )
            ),
          ),
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: magenta,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: magenta,
        title: Text(pokemon.name),
      ),
      body: bodyWidget(context),
    );
  }
}