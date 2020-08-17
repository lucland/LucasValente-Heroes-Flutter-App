// To parse this JSON data, do
//
//     final heroesList = heroesListFromMap(jsonString);

import 'dart:convert';

class HeroesList {
  HeroesList({
    this.response,
    this.resultsFor,
    this.results,
  });

  String response;
  String resultsFor;
  List<Result> results;

  HeroesList copyWith({
    String response,
    String resultsFor,
    List<Result> results,
  }) =>
      HeroesList(
        response: response ?? this.response,
        resultsFor: resultsFor ?? this.resultsFor,
        results: results ?? this.results,
      );

  factory HeroesList.fromJson(String str) => HeroesList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HeroesList.fromMap(Map<String, dynamic> json) => HeroesList(
    response: json["response"],
    resultsFor: json["results-for"],
    results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "response": response,
    "results-for": resultsFor,
    "results": List<dynamic>.from(results.map((x) => x.toMap())),
  };
}

class Result {
  Result({
    this.id,
    this.name,
    this.biography,
    this.appearance,
    this.image,
  });

  String id;
  String name;
  Biography biography;
  Appearance appearance;
  Image image;

  Result copyWith({
    String id,
    String name,
    Biography biography,
    Appearance appearance,
    Image image,
  }) =>
      Result(
        id: id ?? this.id,
        name: name ?? this.name,
        biography: biography ?? this.biography,
        appearance: appearance ?? this.appearance,
        image: image ?? this.image,
      );

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    biography: Biography.fromMap(json["biography"]),
    appearance: Appearance.fromMap(json["appearance"]),
    image: Image.fromMap(json["image"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "biography": biography.toMap(),
    "appearance": appearance.toMap(),
    "image": image.toMap(),
  };
}

class Appearance {
  Appearance({
    this.gender,
  });

  String gender;

  Appearance copyWith({
    String gender,
  }) =>
      Appearance(
        gender: gender ?? this.gender,
      );

  factory Appearance.fromJson(String str) => Appearance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Appearance.fromMap(Map<String, dynamic> json) => Appearance(
    gender: json["gender"],
  );

  Map<String, dynamic> toMap() => {
    "gender": gender,
  };
}

class Biography {
  Biography({
    this.fullName,
    this.publisher,
  });

  String fullName;
  String publisher;

  Biography copyWith({
    String fullName,
    String publisher,
  }) =>
      Biography(
        fullName: fullName ?? this.fullName,
        publisher: publisher ?? this.publisher,
      );

  factory Biography.fromJson(String str) => Biography.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Biography.fromMap(Map<String, dynamic> json) => Biography(
    fullName: json["full-name"],
    publisher: json["publisher"],
  );

  Map<String, dynamic> toMap() => {
    "full-name": fullName,
    "publisher": publisher,
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
