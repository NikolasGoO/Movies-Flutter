import 'package:flutter/material.dart';
import 'package:movies/controllers/movie_detail_controller.dart';
import 'package:movies/widgets/centered_message.dart';
import 'package:movies/widgets/centered_progress.dart';
import 'package:movies/widgets/chip_date.dart';
import 'package:movies/widgets/rate.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;

  MovieDetailPage(this.movieId);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final _controller = MovieDetailController();
  String? _translatedSynopsis;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchMovieById(widget.movieId);

    setState(() {
      _controller.loading = false;
    });
  }

  Future<void> _translateSynopsis() async {
    if (_controller.movieDetail?.overview != null) {
      final translated = await _controller.translateSynopsis(
        _controller.movieDetail!.overview!,
        'PT', // Português como idioma de destino
      );
      setState(() {
        _translatedSynopsis = translated ?? "Translation failed.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildMovieDetail(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(_controller.movieDetail?.title ?? ''),
      actions: [
        IconButton(
          icon: Icon(Icons.translate),
          onPressed: _translateSynopsis,
          tooltip: 'Translate Synopsis',
        ),
      ],
    );
  }

  _buildMovieDetail() {
    if (_controller.loading) {
      return CenteredProgress();
    }

    if (_controller.movieError != null) {
      return CenteredMessage(message: _controller.movieError?.message ?? '');
    }

    return ListView(
      children: [
        _buildCover(),
        _buildStatus(),
        _buildOverview(),
      ],
    );
  }

  _buildOverview() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Text(
        _translatedSynopsis ?? _controller.movieDetail?.overview ?? '',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  _buildStatus() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Rate(_controller.movieDetail?.voteAverage ?? 0.0),
          ChipDate(date: _controller.movieDetail?.releaseDate),
        ],
      ),
    );
  }

  _buildCover() {
    return Image.network(
      'https://image.tmdb.org/t/p/w500${_controller.movieDetail?.backdropPath}',
    );
  }
}
