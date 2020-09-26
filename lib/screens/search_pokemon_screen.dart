import 'package:flutter/material.dart';
import 'package:flutter_pokedex/screens/search_result_screen.dart';

class SearchPokemonScreen extends StatefulWidget {
  @override
  _SearchPokemonScreenState createState() => _SearchPokemonScreenState();
}

class _SearchPokemonScreenState extends State<SearchPokemonScreen> {
  TextEditingController _pokemonNumCtrl;

  @override
  void initState() {
    super.initState();
    _pokemonNumCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a pokemon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Key in a number'),
              controller: _pokemonNumCtrl,
            ),
            SizedBox(
              height: 5.0,
            ),
            RaisedButton(

              color: Colors.blueAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchResultScreen(
                      pokemonIndex: _pokemonNumCtrl.text,
                    ),
                  ),
                );
              },
              child: Text(
                'Search',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
