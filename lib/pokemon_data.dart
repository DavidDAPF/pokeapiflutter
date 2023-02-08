import 'package:http/http.dart' as http;

class PokemonData {
  PokemonData() {
    this.getPokemon();
  }

  getPokemon() async {
    var url = Uri.https(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    var res = await http.get(url);
    print(res.body);
  }
}
