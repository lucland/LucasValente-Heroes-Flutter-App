// To parse this JSON data, do
//
//     final heroeDetail = heroeDetailFromMap(jsonString);

import 'dart:convert';

class HeroeDetail {
  HeroeDetail({
    this.response,
    this.id,
    this.name,
    this.powerstats,
    this.biography,
    this.appearance,
    this.work,
    this.connections,
    this.image,
  });

  String response;
  String id;
  String name;
  Powerstats powerstats;
  Biography biography;
  Appearance appearance;
  Work work;
  Connections connections;
  Image image;

  HeroeDetail copyWith({
    String response,
    String id,
    String name,
    Powerstats powerstats,
    Biography biography,
    Appearance appearance,
    Work work,
    Connections connections,
    Image image,
  }) =>
      HeroeDetail(
        response: response ?? this.response,
        id: id ?? this.id,
        name: name ?? this.name,
        powerstats: powerstats ?? this.powerstats,
        biography: biography ?? this.biography,
        appearance: appearance ?? this.appearance,
        work: work ?? this.work,
        connections: connections ?? this.connections,
        image: image ?? this.image,
      );

  factory HeroeDetail.fromJson(String str) => HeroeDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HeroeDetail.fromMap(Map<String, dynamic> json) => HeroeDetail(
    response: json["response"],
    id: json["id"],
    name: json["name"],
    powerstats: Powerstats.fromMap(json["powerstats"]),
    biography: Biography.fromMap(json["biography"]),
    appearance: Appearance.fromMap(json["appearance"]),
    work: Work.fromMap(json["work"]),
    connections: Connections.fromMap(json["connections"]),
    image: Image.fromMap(json["image"]),
  );

  Map<String, dynamic> toMap() => {
    "response": response,
    "id": id,
    "name": name,
    "powerstats": powerstats.toMap(),
    "biography": biography.toMap(),
    "appearance": appearance.toMap(),
    "work": work.toMap(),
    "connections": connections.toMap(),
    "image": image.toMap(),
  };
}

class Appearance {
  Appearance({
    this.gender,
    this.race,
    this.height,
    this.weight,
    this.eyeColor,
    this.hairColor,
  });

  String gender;
  String race;
  List<String> height;
  List<String> weight;
  String eyeColor;
  String hairColor;

  Appearance copyWith({
    String gender,
    String race,
    List<String> height,
    List<String> weight,
    String eyeColor,
    String hairColor,
  }) =>
      Appearance(
        gender: gender ?? this.gender,
        race: race ?? this.race,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        eyeColor: eyeColor ?? this.eyeColor,
        hairColor: hairColor ?? this.hairColor,
      );

  factory Appearance.fromJson(String str) => Appearance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Appearance.fromMap(Map<String, dynamic> json) => Appearance(
    gender: json["gender"],
    race: json["race"],
    height: List<String>.from(json["height"].map((x) => x)),
    weight: List<String>.from(json["weight"].map((x) => x)),
    eyeColor: json["eye-color"],
    hairColor: json["hair-color"],
  );

  Map<String, dynamic> toMap() => {
    "gender": gender,
    "race": race,
    "height": List<dynamic>.from(height.map((x) => x)),
    "weight": List<dynamic>.from(weight.map((x) => x)),
    "eye-color": eyeColor,
    "hair-color": hairColor,
  };
}

class Biography {
  Biography({
    this.fullName,
    this.alterEgos,
    this.aliases,
    this.placeOfBirth,
    this.firstAppearance,
    this.publisher,
    this.alignment,
  });

  String fullName;
  String alterEgos;
  List<String> aliases;
  String placeOfBirth;
  String firstAppearance;
  String publisher;
  String alignment;

  Biography copyWith({
    String fullName,
    String alterEgos,
    List<String> aliases,
    String placeOfBirth,
    String firstAppearance,
    String publisher,
    String alignment,
  }) =>
      Biography(
        fullName: fullName ?? this.fullName,
        alterEgos: alterEgos ?? this.alterEgos,
        aliases: aliases ?? this.aliases,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        firstAppearance: firstAppearance ?? this.firstAppearance,
        publisher: publisher ?? this.publisher,
        alignment: alignment ?? this.alignment,
      );

  factory Biography.fromJson(String str) => Biography.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Biography.fromMap(Map<String, dynamic> json) => Biography(
    fullName: json["full-name"],
    alterEgos: json["alter-egos"],
    aliases: List<String>.from(json["aliases"].map((x) => x)),
    placeOfBirth: json["place-of-birth"],
    firstAppearance: json["first-appearance"],
    publisher: json["publisher"],
    alignment: json["alignment"],
  );

  Map<String, dynamic> toMap() => {
    "full-name": fullName,
    "alter-egos": alterEgos,
    "aliases": List<dynamic>.from(aliases.map((x) => x)),
    "place-of-birth": placeOfBirth,
    "first-appearance": firstAppearance,
    "publisher": publisher,
    "alignment": alignment,
  };
}

class Connections {
  Connections({
    this.groupAffiliation,
    this.relatives,
  });

  String groupAffiliation;
  String relatives;

  Connections copyWith({
    String groupAffiliation,
    String relatives,
  }) =>
      Connections(
        groupAffiliation: groupAffiliation ?? this.groupAffiliation,
        relatives: relatives ?? this.relatives,
      );

  factory Connections.fromJson(String str) => Connections.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Connections.fromMap(Map<String, dynamic> json) => Connections(
    groupAffiliation: json["group-affiliation"],
    relatives: json["relatives"],
  );

  Map<String, dynamic> toMap() => {
    "group-affiliation": groupAffiliation,
    "relatives": relatives,
  };
}

class Image {
  Image({
    this.url,
  });

  String url;

  Image copyWith({
    String url,
  }) =>
      Image(
        url: url ?? this.url,
      );

  factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Image.fromMap(Map<String, dynamic> json) => Image(
    url: json["url"],
  );

  Map<String, dynamic> toMap() => {
    "url": url,
  };
}

class Powerstats {
  Powerstats({
    this.intelligence,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat,
  });

  String intelligence;
  String strength;
  String speed;
  String durability;
  String power;
  String combat;

  Powerstats copyWith({
    String intelligence,
    String strength,
    String speed,
    String durability,
    String power,
    String combat,
  }) =>
      Powerstats(
        intelligence: intelligence ?? this.intelligence,
        strength: strength ?? this.strength,
        speed: speed ?? this.speed,
        durability: durability ?? this.durability,
        power: power ?? this.power,
        combat: combat ?? this.combat,
      );

  factory Powerstats.fromJson(String str) => Powerstats.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Powerstats.fromMap(Map<String, dynamic> json) => Powerstats(
    intelligence: json["intelligence"],
    strength: json["strength"],
    speed: json["speed"],
    durability: json["durability"],
    power: json["power"],
    combat: json["combat"],
  );

  Map<String, dynamic> toMap() => {
    "intelligence": intelligence,
    "strength": strength,
    "speed": speed,
    "durability": durability,
    "power": power,
    "combat": combat,
  };
}

class Work {
  Work({
    this.occupation,
    this.base,
  });

  String occupation;
  String base;

  Work copyWith({
    String occupation,
    String base,
  }) =>
      Work(
        occupation: occupation ?? this.occupation,
        base: base ?? this.base,
      );

  factory Work.fromJson(String str) => Work.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Work.fromMap(Map<String, dynamic> json) => Work(
    occupation: json["occupation"],
    base: json["base"],
  );

  Map<String, dynamic> toMap() => {
    "occupation": occupation,
    "base": base,
  };
}
