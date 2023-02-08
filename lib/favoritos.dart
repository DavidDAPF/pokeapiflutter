import 'package:flutter/material.dart';

class Favoritos extends StatefulWidget {
  final pokemonDetail;
  final Color color;
  final int heroTag;

  const Favoritos(
      {super.key,
      required this.pokemonDetail,
      required this.color,
      required this.heroTag});
  @override
  State<Favoritos> createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Mis Favoritos',
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Card(
              color: widget.color,
              elevation: 6,
              margin: EdgeInsets.all(15),
              child: const ListTile(
                contentPadding: EdgeInsets.all(15),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://w7.pngwing.com/pngs/755/301/png-transparent-computer-icons-pokemon-regice-regirock-pocket-monster-kuremu-logo-desktop-wallpaper-emoticon.png'),
                ),
                title: Text(
                  'nombre',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(Icons.delete, size: 30),
              ));
        },
      ),
    );
  }
}
