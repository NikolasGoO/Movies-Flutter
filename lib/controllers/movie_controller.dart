import 'package:dartz/dartz.dart';
import 'package:movies/errors/movie_error.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/models/movie_response_model.dart';
import 'package:movies/repositories/movie_repository.dart';

class MovieController {
  final _repository = MovieRepository();

  MovieResponseModel? movieResponseModel;
  MovieError? movieError;
  bool loading = true;

// Retorna a lista de filmes. Se não houver resposta, retorna uma lista vazia.
  List<MovieModel> get movies => movieResponseModel?.movies ?? <MovieModel>[];

  int get moviesCount => movies.length; // Retorna a contagem de filmes na resposta.
  bool get hasMovies => moviesCount != 0; // Verifica se há filmes na lista.
  int get totalPages => movieResponseModel?.totalPages ?? 1; // Retorna o número total de páginas de filmes.
  int get currentPage => movieResponseModel?.page ?? 1; // Retorna a página atual de filmes.

  Future<Either<MovieError, MovieResponseModel>> fetchAllMovies(
  {int page = 1}) async {
    movieError = null; // Reseta o erro antes de uma nova chamada.
    final result = await _repository.fetchAllMovies(page); // Chama o repositório para buscar filmes.
    result.fold(
        (error) => movieError = error,
        (movie) {
          if(movieResponseModel == null) {
            movieResponseModel = movie; // Se não houver resposta anterior, armazena a nova.
          } else {
            // Se já houver resposta anterior, atualiza a página e adiciona novos filmes.
            movieResponseModel!.page = movie.page;
            movieResponseModel!.movies!.addAll(movie.movies as List<MovieModel>);
          }
        },
    );
    return result;
  }
}