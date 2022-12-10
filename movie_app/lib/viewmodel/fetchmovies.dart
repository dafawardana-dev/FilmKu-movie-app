import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movies_models.dart';

// Future<List<Movies>> fetchmovies() async {
//   final client = http.Client();
//   final response = await client.get(Uri.parse(
//       'https://api.themoviedb.org/3/movie/top_rated?api_key=b918f9aefc5ac373273ff145f8f87e54'));
//   return compute(parseFilm, response.body);
// }

// List<Movies> parseFilm(String responseBody) {
//   final parsed =
//       jsonDecode(responseBody)['results'].cast<Map<String, dynamic>>();
//   return parsed.map<Results>((json) => Results.fromJson(json)).toList();
// }

Movies dataFetch = Movies();

Future<Movies> ambilData() async {
  Dio dio = Dio();
  var res = await dio.get(
      "https://api.themoviedb.org/3/movie/top_rated?api_key=b918f9aefc5ac373273ff145f8f87e54");
  Movies model = Movies.fromJson(res.data);
  dataFetch = model;
  return model;
}
