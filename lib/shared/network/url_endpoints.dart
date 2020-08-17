import 'dart:core';

class UrlEndpoints {
  // Url Base
  final String _urlApiBase = 'https://www.superheroapi.com/api/';
  final String _urlApiKey = '3391421994223297/';
  final String _urlApiSearch = 'search/';
  // EndPoints
  String urlApiSearchName(String name) =>
      '$_urlApiBase$_urlApiKey$_urlApiSearch$name';

  String urlApiHeroeDetail(String id) =>
      '$_urlApiBase$_urlApiKey$id';
  //Url All Heroes

  String urlApiAllHeroes() =>
      'https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/all.json';

  //dispose will be called automatically
  @override
  void dispose() {}
}