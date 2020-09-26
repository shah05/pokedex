class PokemonModel {
  String name;
  List<String> moves = [];
  String imageUrl;
  String type;

//  set imageurl(String imageUrl) => imageUrl = imageUrl;

  PokemonModel.fromJson(Map<String, dynamic> json) {
//    print('=======================');
//    print(json['types']);
//    print(json['types'][0]['type']['name']);
//    print(json['types'][1]);
//    print('=======================');
    this.name = json['species']['name'];
    json['moves']
        .forEach((moveJson) => this.moves.add(moveJson['move']['name']));
    this.type = json['types'][0]['type']['name'];
    this.imageUrl = json['sprites']['front_default'];
  }

}
