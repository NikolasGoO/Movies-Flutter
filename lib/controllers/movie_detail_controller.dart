import 'package:dartz/dartz.dart';
import 'package:movies/errors/movie_error.dart';
import 'package:movies/models/movie_detail_model.dart';
import 'package:movies/repositories/movie_repository.dart';

class MovieDetailController {
  final _repository = MovieRepository(); // Instância do MovieRepository para acessar os métodos de busca de filme.

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
}