class AllPokemonReponse {
  String name;
  String imageName;

  AllPokemonReponse.fromMappedJson(Map<String, dynamic> json)
      : name = json['name'] ?? "";
}
