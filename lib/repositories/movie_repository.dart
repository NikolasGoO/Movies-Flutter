import 'package:dartz/dartz.dart'; // Biblioteca para programação funcional, facilitando o uso de Either.
import 'package:dio/dio.dart'; // Biblioteca para fazer requisições HTTP.
import 'package:movies/core/api.dart';
import 'package:movies/errors/movie_error.dart';
import 'package:movies/models/movie_detail_model.dart';
import 'package:movies/models/movie_response_model.dart';

class MovieRepository {
  final Dio _dio = Dio(kDioOptions);
  // Método para buscar todos os filmes populares, recebendo um número de página.
  Future<Either<MovieError, MovieResponseModel>> fetchAllMovies(
      int page) async {
    try {
      final response = await _dio.get('/movie/popular?page=$page'); // Realiza a requisição GET para buscar filmes populares da API.
      final model = MovieResponseModel.fromJson(response.data); // Cria um modelo de resposta a partir dos dados da resposta
      return Right(model);
    } on DioException catch (error) { // Tratamento de exceção específica para erros do Dio.
      if (error.response != null) {
        return Left(
            MovieRepositoryError(error.response!.data['status_message']!));
      } else {
        return Left(MovieRepositoryError(KServerError));
      }
    } on Exception catch (error) {
      return Left(MovieRepositoryError(error.toString()));
    }
  }
// Método para buscar um filme específico pelo seu ID.
  Future<Either<MovieError, MovieDetailModel>> fetchMovieById(int id) async {
    try {
      final response = await _dio.get('/movie/$id'); // Realiza a requisição GET para buscar detalhes de um filme pelo ID.
      final model = MovieDetailModel.fromJson(response.data);
      return Right(model);
    } on DioException catch (error) {
      if (error.response != null) {
        return Left(
            MovieRepositoryError(error.response!.data['status_massage']));
      } else {
        return Left(MovieRepositoryError(KServerError));
      }
    } on Exception catch (error) { // Captura quaisquer outras exceções e retorna uma mensagem de erro.
      return Left(MovieRepositoryError(error.toString()));
    }
  }
}