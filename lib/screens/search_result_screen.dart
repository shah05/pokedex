import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/pokemon_model.dart';
import 'package:flutter_pokedex/network/api_call.dart';

class SearchResultScreen extends StatefulWidget {
  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();

  final String pokemonIndex;

  SearchResultScreen({this.pokemonIndex});
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  Future<PokemonModel> searchedPokemon;
  RestApiCall _apiCall;

  @override
  void initState() {
    super.initState();
    _apiCall = RestApiCall();
    searchedPokemon = _apiCall.fetchMyPokemon(id: widget.pokemonIndex);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: searchedPokemon,
      builder: (context, snapshot) {
        //Success State
        if (snapshot.hasData) {
          PokemonModel pokemon = snapshot.data;
          return _buildPokemonDetail(pokemon);
        }
        // Error State
        else if (snapshot.hasError) {
          return _buildSearchFailed(widget.pokemonIndex);
        }
        //Loading State
        return Scaffold(
          body: Center(
            child: CupertinoActivityIndicator(
              radius: 30.0,
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchFailed(String pokemonId) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Error',
        ),
      ),
      body: Center(
        child: Text(
          'No result found for pokemon id : ${widget.pokemonIndex}',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }

  Widget _buildPokemonDetail(PokemonModel pokemon) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name.toUpperCase()),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 5.0,
          ),
          Image.network(
            pokemon.imageUrl,
            height: 150,
            width: 150,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 5.0,
          ),
          Card(
            child: ListTile(
              title: Text('Type'),
              subtitle: Text(pokemon.type.toUpperCase()),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('First Move'),
              subtitle: Text(pokemon.moves[0].toUpperCase()),
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
