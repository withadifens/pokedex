import 'dart:convert';
import 'package:http/http.dart' as http;

class PokeAPI {
  late String name;
  late String url;

  PokeAPI({required this.name, required this.url});

  factory PokeAPI.fromJson(Map<String, dynamic> json) {
    return PokeAPI(
      name: json['name'],
      url: json['url'],
    );
  }
}

Future<List<PokeAPI>> ambilData() async {
  final hasil = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));

  List jsonRes = json.decode(hasil.body)['results'];
  return jsonRes.map((json) => PokeAPI.fromJson(json)).toList();
}
