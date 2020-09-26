import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatelessWidget {
  final String name;
  final String description;
  final int level;
//  final String type;
  final String imageUrl;

  //Constructor
  PokemonDetailScreen({this.name, this.description, this.level, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 5.0,
          ),
          Image.network(
            imageUrl,
            height: 150,
            width: 150,
//            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 5.0,
          ),
          Card(
            child: ListTile(
              title: Text('Description'),
              subtitle: Text(description),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Level'),
              subtitle: Text('Level $level'),
            ),
          ),
//          ListTile(
//            title: Text('Type'),
//            subtitle: Text(type),
//          )
        ],
      ),
    );
  }
}
