
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lucasvalente_heroes_flutter/models/all_heroes_list.dart';
import 'package:lucasvalente_heroes_flutter/models/heroe_detail.dart';
import 'dart:convert';

import 'package:lucasvalente_heroes_flutter/models/heroes_list.dart';
import 'package:lucasvalente_heroes_flutter/shared/network/dio_connection.dart';
import 'package:lucasvalente_heroes_flutter/shared/network/url_endpoints.dart';


class ApiRepository {
  final UrlEndpoints urlEndpoints = UrlEndpoints();
  final DioConnection dioSrvc = DioConnection();

//Fetch Heroes List Method
  Future<List<Result>> getHeroes(String heroname) async {
    List<Result> list = List<Result>();
    try {
      Response response = await dioSrvc.dioConnection.get(urlEndpoints.urlApiSearchName(heroname));
      if (response.statusCode == 200) {
        list = parseHeroes(response.data);
        return list;
      } else {
        throw Exception("Error");
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
  }

   List<Result> parseHeroes(Map responseBody) {
    HeroesList _listHeroes = HeroesList.fromMap(responseBody);
    print(_listHeroes);
    return _listHeroes.results;
  }

  Future<HeroeDetail> getHeroeDetail(String id) async {
    HeroeDetail heroe = HeroeDetail();
    try {
      Response response = await dioSrvc.dioConnection.get(urlEndpoints.urlApiHeroeDetail(id));
      if (response.statusCode == 200) {
        heroe = parseHeroeDetail(response.data);
        return heroe;
      } else {
        throw Exception("Error");
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
  }

  HeroeDetail parseHeroeDetail(Map responseBody) {
    HeroeDetail _heroeDetail = HeroeDetail.fromMap(responseBody);
    print(_heroeDetail);
    return _heroeDetail;
  }

  Future<AllHeroesList> getAllHeroes() async {
    AllHeroesList allheroes = AllHeroesList();
    try {
      Response response = await dioSrvc.dioConnection.get(urlEndpoints.urlApiAllHeroes());
      if (response.statusCode == 200) {
        allheroes = parseAllHeroes(response.data);
        return allheroes;
      } else {
        throw Exception("Error");
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
  }

  AllHeroesList parseAllHeroes(Map responseBody) {
    AllHeroesList _allHeroes = AllHeroesList.fromMap(responseBody);
    print(_allHeroes);
    return _allHeroes;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}