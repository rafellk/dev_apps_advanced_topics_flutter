class PokemonReponse {
  String name;
  int baseExperience;
  int height;
  int weight;
  int id;
  List<String> spriteImages;

  PokemonReponse.fromMappedJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    baseExperience = json['base_experience'] ?? 0;
    height = json['height'] ?? 0;
    weight = json['weight'] ?? 0;
    id = json['id'] ?? 0;

    spriteImages = [];

    var sprites = json['sprites'];
    if (json['sprites'] != null) {
      spriteImages.add(sprites['front_default']);
      spriteImages.add(sprites['back_default']);
      spriteImages.add(sprites['front_shiny']);
      spriteImages.add(sprites['back_shiny']);
    }

    print("");
  }
}
