import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/pokemon_data.dart';
import 'package:flutter_pokedex/screens/pokemon_detail_screen.dart';

class PokemonListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Pokemon'),
      ),
      body: ListView.builder(
          itemCount: pokemonData.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4.0,
              child: ListTile(
                leading: Image.network(pokemonData[index].imageUrl),
                title: Text(pokemonData[index].name),
                subtitle: Text(pokemonData[index].description),
                trailing: Text('${pokemonData[index].currentLevel}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PokemonDetailScreen(
                          name: pokemonData[index].name,
                          level: pokemonData[index].currentLevel,
                          imageUrl: pokemonData[index].imageUrl,
                          description: pokemonData[index].description,
                        );
                      },
                    ),
                  );
                },
              ),
            );
          }),
//        body: ListView.builder(
//            itemCount: pokemonData.length,
//            itemBuilder: (BuildContext context, int index) {
//              return GestureDetector(
//                onTap: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => PokemonDetailScreen(
//                        name: pokemonData[index].name,
//                        description: pokemonData[index].description,
//                        imageUrl: pokemonData[index].imageUrl,
//                        level: pokemonData[index].currentLevel,
//                      ),
//                    ),
//                  );
//                },
//                child: Card(
//                  child: ListTile(
//                      leading: Image.network(pokemonData[index].imageUrl,
//                          height: 50.0, width: 50.0),
//                      title: Text(pokemonData[index].name),
//                      subtitle: Text(pokemonData[index].description),
//                      trailing: Text('${pokemonData[index].currentLevel}')),
//                ),
    );
//            }));
  }
}
