import 'package:flutter_pokedex/data/pokemon_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RestApiCall {
  Future<PokemonModel> fetchMyPokemon({String id}) async {
    String apiUrl = 'http://pokeapi.co/api/v2/pokemon/' + id;
    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      // print(response.body);
      return PokemonModel.fromJson(responseJson);
    } else
      throw 'Pokemon for ID:${id} is not found.';
  }
}
