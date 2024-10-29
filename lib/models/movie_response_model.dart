import 'package:movies/models/movie_model.dart';
import 'dart:convert';

class MovieResponseModel {
  int? page;
  List<MovieModel>? movies;
  int? totalPages;
  int? totalResults;

  MovieResponseModel({this.page, this.movies, this.totalPages, this.totalResults});

  MovieResponseModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if(json['results'] != null) {
      movies = <MovieModel>[];
      json['results'].forEach((v) {  // Itera por cada item em 'results'.
        movies!.add(new MovieModel.fromJson(v)); // Adiciona um objeto MovieModel à lista de filmes, convertendo cada item do JSON.
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if(this.movies != null) {
      data['results'] = this.movies!.map((v) => v.toJson()).toList(); // Converte cada filme em JSON e adiciona ao mapa com a chave 'results'.
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}