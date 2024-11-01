import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/errors/movie_error.dart';
import 'package:movies/models/movie_detail_model.dart';
import 'package:movies/repositories/movie_repository.dart';
import 'package:dio/dio.dart';

class MovieDetailController {
  final _repository = MovieRepository(); // Instância do MovieRepository para acessar os métodos de busca de filme.
  final _dio = Dio();

  MovieDetailModel? movieDetail;
  MovieError? movieError;

  bool loading = true; // Indica se a busca está em andamento.

  Future<Either<MovieError, MovieDetailModel>> fetchMovieById(int id) async {
    movieError = null;
    final result = await _repository.fetchMovieById(id); // Chama o método do repositório para buscar o filme.
    result.fold( // Usa fold para processar o resultado, lidando com sucesso e erro.
        (error) => movieError = error, (detail) => movieDetail = detail // Se ocorrer um erro, armazena o erro, se for bem sucedido, armazena dados do filme.
    );
    return result;
  }

  Future<String?> translateSynopsis(String text, String targetLang) async {
    final apiKey = ''; /// Sua Chave API AQUI

    final response = await  http.post(
      Uri.parse('https://api-free.deepl.com/v2/translate'),
      headers: {
        'Authorization': 'DeepL-Auth-Key $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
      'text': [text],
      'target_lang': targetLang,
    }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['translations'][0]['text'] as String?;
    } else {
      print('Erro na tradução ${response.body}');
      if(apiKey == '') {
        print('Chave API não encontrada.');
      }
      return null;
    }
  }}