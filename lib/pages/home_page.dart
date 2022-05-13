import 'package:flutter/material.dart';
import 'package:pokedex/models/poke_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pokedex'),
        ),
        body: FutureBuilder<List<PokeAPI>>(
          future: ambilData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<PokeAPI> poke = snapshot.data!;
              return ListView.builder(
                  itemCount: poke.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(poke[index].name),
                    );
                  });
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
