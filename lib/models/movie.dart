import 'package:uuid/uuid.dart';

class Movie {
  static const _idGenerator = Uuid();

  final String _id;
  final String _overview;
  final String _posterPath;
  final String _title;
  final String _originalLanguage;
  final String _releaseDate;
  final double _voteAverage;

  const Movie(this._id, this._overview, this._posterPath, this._title,
      this._originalLanguage, this._releaseDate, this._voteAverage);

  String get id => _id;

  String get overview => _overview;

  String get posterPath => _posterPath;

  String get title => _title;

  String get originalLanguage => _originalLanguage;

  String get releaseDate => _releaseDate;

  double get voteAverage => _voteAverage;

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        _idGenerator.v4(),
        json['overview'],
        json['poster_path'],
        json['title'],
        json['original_language'],
        json['release_date'],
        json['vote_average']);
  }
}
