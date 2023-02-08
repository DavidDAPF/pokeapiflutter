import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokeapi/favoritos.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  late List pokedex;
  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            var type = pokedex[index]['type'][0];
            return Center(
              child: SizedBox(
                child: Center(
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    fit: StackFit.expand,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    // overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                          width: 300,
                          height: 300,
                          color: type == 'Fire'
                              ? Colors.redAccent
                              : type == 'Grass'
                                  ? Colors.greenAccent
                                  : type == 'Water'
                                      ? Colors.blueAccent
                                      : type == 'Electric'
                                          ? Color.fromARGB(255, 187, 187, 0)
                                          : type == 'Rock'
                                              ? Colors.grey
                                              : type == 'Ground'
                                                  ? Colors.brown
                                                  : type == 'Fighting'
                                                      ? Colors.orange
                                                      : type == 'Psychic'
                                                          ? Colors.indigo
                                                          : type == 'Bug'
                                                              ? Color.fromARGB(
                                                                  255,
                                                                  150,
                                                                  255,
                                                                  89)
                                                              : type == 'Ghost'
                                                                  ? Colors
                                                                      .deepPurple
                                                                  : type ==
                                                                          'Normal'
                                                                      ? Colors
                                                                          .black26
                                                                      : Colors
                                                                          .pinkAccent), //Container
                      Positioned(
                        top: 500,
                        left: 20,
                        right: 20,
                        child: Container(
                          width: 300,
                          height: 300,
                          // color: Colors.black,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25)),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                const Text('Height:',
                                    style: TextStyle(fontSize: 20)),
                                Text(pokedex[index]['height']),
                                const Text('Weight: ',
                                    style: TextStyle(fontSize: 20)),
                                Text(pokedex[index]['weight']),
                                const Text('Type: ',
                                    style: TextStyle(fontSize: 20)),
                                Text(type.toString()),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Favoritos(
                                                    pokemonDetail:
                                                        pokedex[index]['img'],
                                                    color: type == 'Fire'
                                                        ? Colors.redAccent
                                                        : type == 'Grass'
                                                            ? Colors.greenAccent
                                                            : type == 'Water'
                                                                ? Colors
                                                                    .blueAccent
                                                                : type ==
                                                                        'Electric'
                                                                    ? Color
                                                                        .fromARGB(
                                                                            255,
                                                                            187,
                                                                            187,
                                                                            0)
                                                                    : type ==
                                                                            'Rock'
                                                                        ? Colors
                                                                            .grey
                                                                        : type ==
                                                                                'Ground'
                                                                            ? Colors.brown
                                                                            : type == 'Fighting'
                                                                                ? Colors.orange
                                                                                : type == 'Psychic'
                                                                                    ? Colors.indigo
                                                                                    : type == 'Bug'
                                                                                        ? Color.fromARGB(255, 150, 255, 89)
                                                                                        : type == 'Ghost'
                                                                                            ? Colors.deepPurple
                                                                                            : type == 'Normal'
                                                                                                ? Colors.black26
                                                                                                : Colors.pinkAccent,
                                                    heroTag: index,
                                                  )));
                                    },
                                    child: const Text('Yo te elejo a ti')),
                              ],
                            ),
                          ),
                        ),
                      ), //Container
                      Positioned(
                        left: 20,
                        right: 20,
                        top: 270,
                        child: Container(
                          height: 260,
                          width: 260,
                          // color: Colors.purple,
                          child: Image(
                            image:
                                NetworkImage(pokedex[index]['img'], scale: 0.1),
                          ),
                          // child: CircleAvatar(
                          //     radius: 30,
                          //     backgroundImage:
                          //         NetworkImage(pokedex[index]['img'])),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        right: 20,
                        top: 150,
                        child: Container(
                          height: 80,
                          width: 200,
                          // color: Colors.limeAccent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  const Text(
                                    'Pokemon nro: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(pokedex[index]['num'],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              ),
                              Text(
                                pokedex[index]['name'],
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        right: 20,
                        top: 100,
                        child: Container(
                          height: 50,
                          width: 200,
                          // color: Colors.lightBlue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 22),
                                ),
                                onPressed: null,
                                child: const Text(
                                  'Favoritos',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ), //Container
                    ], //<Widget>[]
                  ), //Stack
                ), //Center
              ), //SizedBox
            ); //Center
          },
          itemCount: pokedex.length),
    );
  }

  void fetchPokemonData() {
    var url = Uri.https("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        // print(decodedJsonData);
        pokedex = decodedJsonData['pokemon'];
        print(pokedex[0]['name']);
        setState(() {});
      }
    });
  }
}
