class PokemonModel {
  List<Pokemon>? pokemon;

  PokemonModel({this.pokemon});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = <Pokemon>[];
      json['pokemon'].forEach((v) {
        pokemon!.add(Pokemon.fromJson(v));
      });
    }
  }

}

class Pokemon {
  late int id;
  late String num;
  late String name;
  late String img;
  List<String>? type;
  late String height;
  late String weight;
  late String candy;
  late String candyCount;
  late String egg;
  late String spawnChance;
  late String avgSpawns;
  late String spawnTime;
  List<double>? multipliers;
  List<String>? weaknesses;
  List<NextEvolution>? nextEvolution;
  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    required this.multipliers,
    required this.weaknesses,
    required this.nextEvolution,
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    candyCount = json['candy_count'].toString();
    egg = json['egg'];
    spawnChance = json['spawn_chance'].toString();
    avgSpawns = json['avg_spawns'].toString();
    spawnTime = json['spawn_time'];
    multipliers = json['multipliers']?.cast<double>();
    weaknesses = json['weaknesses'].cast<String>();

    if (json['next_evolution'] != null) {
      nextEvolution = <NextEvolution>[];
      json['next_evolution'].forEach((i) {
        nextEvolution!.add(NextEvolution.fromJson(i));
      });
    }else{
      nextEvolution = [];
    }
  }
}

class NextEvolution {
  late String num;
  late String name;
  NextEvolution({required this.num, required this.name});
  NextEvolution.fromJson(Map<String, dynamic> map) {
    num = map['num'] ?? "null";
    name = map['name'] ?? "null";
  }
}
