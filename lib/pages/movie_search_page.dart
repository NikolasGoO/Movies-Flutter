import 'package:flutter/material.dart';
import 'package:movies/controllers/movie_controller.dart';
import 'package:movies/widgets/centered_message.dart';
import 'package:movies/widgets/centered_progress.dart';
import 'package:movies/pages/movie_detail_page.dart';

class MovieSearchPage extends StatefulWidget {
  @override
  _MovieSearchPageState createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  final _controller = MovieController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchAllMovies();

    setState(() {
      _controller.loading = false;
    });
  }

  _onSearchChanged() async {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      setState(() {
        _controller.loading = true;
      });

      await _controller.fetchMoviesByName(query);

      setState(() {
        _controller.loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "Search for movies...",
            border: InputBorder.none,
          ),
          onChanged: (text) => _onSearchChanged(),
        ),
      ),
      body: _buildMovieList(),
    );
  }

  Widget _buildMovieList() {
    if (_controller.loading) {
      return CenteredProgress();
    }

    if (_controller.movieError != null) {
      return CenteredMessage(message: _controller.movieError?.message ?? '');
    }

    if (_controller.movies.isEmpty) {
      return CenteredMessage(message: "O filme não foi encontrado ou não existe.");
    }

    return ListView.builder(
      itemCount: _controller.moviesCount,
      itemBuilder: (context, index) {
        final movie = _controller.movies[index];
        return InkWell(
          onTap: () {
            // Navega para a página de detalhes do filme com o ID do filme atual
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailPage(movie.id ?? 0),
              ),
            );
          },
          child: ListTile(
            leading: Image.network(
              'https://image.tmdb.org/t/p/w200${movie.posterPath}',
              fit: BoxFit.cover,
              width: 50,
            ),
            title: Text("${movie.title}"),
            subtitle: Text(movie.releaseDate ?? 'No release date'),
          ),
        );
      },
    );
  }
}
