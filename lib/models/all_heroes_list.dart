// To parse this JSON data, do
//
//     final allHeroesList = allHeroesListFromMap(jsonString);

import 'dart:convert';

class AllHeroesList {
  AllHeroesList({
    this.id,
    this.name,
    this.slug,
    this.powerstats,
    this.appearance,
    this.biography,
    this.work,
    this.connections,
    this.images,
  });

  int id;
  String name;
  String slug;
  Powerstats powerstats;
  Appearance appearance;
  Biography biography;
  Work work;
  Connections connections;
  Images images;

  AllHeroesList copyWith({
    int id,
    String name,
    String slug,
    Powerstats powerstats,
    Appearance appearance,
    Biography biography,
    Work work,
    Connections connections,
    Images images,
  }) =>
      AllHeroesList(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        powerstats: powerstats ?? this.powerstats,
        appearance: appearance ?? this.appearance,
        biography: biography ?? this.biography,
        work: work ?? this.work,
        connections: connections ?? this.connections,
        images: images ?? this.images,
      );

  factory AllHeroesList.fromJson(String str) => AllHeroesList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllHeroesList.fromMap(Map<String, dynamic> json) => AllHeroesList(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    powerstats: Powerstats.fromMap(json["powerstats"]),
    appearance: Appearance.fromMap(json["appearance"]),
    biography: Biography.fromMap(json["biography"]),
    work: Work.fromMap(json["work"]),
    connections: json["connections"] == null ? null : Connections.fromMap(json["connections"]),
    images: json["images"] == null ? null : Images.fromMap(json["images"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "slug": slug,
    "powerstats": powerstats.toMap(),
    "appearance": appearance.toMap(),
    "biography": biography.toMap(),
    "work": work.toMap(),
    "connections": connections == null ? null : connections.toMap(),
    "images": images == null ? null : images.toMap(),
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
    eyeColor: json["eyeColor"],
    hairColor: json["hairColor"],
  );

  Map<String, dynamic> toMap() => {
    "gender": gender,
    "race": race,
    "height": List<dynamic>.from(height.map((x) => x)),
    "weight": List<dynamic>.from(weight.map((x) => x)),
    "eyeColor": eyeColor,
    "hairColor": hairColor,
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
    fullName: json["fullName"],
    alterEgos: json["alterEgos"],
    aliases: List<String>.from(json["aliases"].map((x) => x)),
    placeOfBirth: json["placeOfBirth"],
    firstAppearance: json["firstAppearance"],
    publisher: json["publisher"],
    alignment: json["alignment"],
  );

  Map<String, dynamic> toMap() => {
    "fullName": fullName,
    "alterEgos": alterEgos,
    "aliases": List<dynamic>.from(aliases.map((x) => x)),
    "placeOfBirth": placeOfBirth,
    "firstAppearance": firstAppearance,
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
    groupAffiliation: json["groupAffiliation"],
    relatives: json["relatives"],
  );

  Map<String, dynamic> toMap() => {
    "groupAffiliation": groupAffiliation,
    "relatives": relatives,
  };
}

class Images {
  Images({
    this.xs,
    this.sm,
    this.md,
    this.lg,
  });

  String xs;
  String sm;
  String md;
  String lg;

  Images copyWith({
    String xs,
    String sm,
    String md,
    String lg,
  }) =>
      Images(
        xs: xs ?? this.xs,
        sm: sm ?? this.sm,
        md: md ?? this.md,
        lg: lg ?? this.lg,
      );

  factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Images.fromMap(Map<String, dynamic> json) => Images(
    xs: json["xs"],
    sm: json["sm"],
    md: json["md"],
    lg: json["lg"],
  );

  Map<String, dynamic> toMap() => {
    "xs": xs,
    "sm": sm,
    "md": md,
    "lg": lg,
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

  int intelligence;
  int strength;
  int speed;
  int durability;
  int power;
  int combat;

  Powerstats copyWith({
    int intelligence,
    int strength,
    int speed,
    int durability,
    int power,
    int combat,
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
