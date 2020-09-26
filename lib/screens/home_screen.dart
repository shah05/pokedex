import 'package:flutter/material.dart';
import 'package:flutter_pokedex/screens/pokemon_list_screen.dart';
import 'package:flutter_pokedex/screens/search_pokemon_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Pokedex')),
        body: ListView(
          children: [
            ListTile(
              title: Text('My Pokemon List'),
              subtitle: Text('View your captured pokemons'),
              trailing: Icon(Icons.arrow_forward_ios),
              // Anonymous function /named function
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PokemonListScreen();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Search Pokemon'),
              subtitle: Text('View your captured pokemons'),
              trailing: Icon(Icons.arrow_forward_ios),
              // Anonymous function /named function
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPokemonScreen();
                    },
                  ),
                );
              },
            )
          ],
        ));
  }
}
