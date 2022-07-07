import 'dart:convert';

import 'package:flutter/foundation.dart';

class MovieDetail {
  final bool adult;

  final int budget;
  final List<Genre> genres;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String title;
  final double voteAverage;
  final int voteCount;

  MovieDetail({
    required this.adult,
    required this.budget,
    required this.genres,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.spokenLanguages,
    required this.status,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieDetail copyWith({
    bool? adult,
    int? budget,
    List<Genre>? genres,
    int? id,
    String? imdbId,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    String? posterPath,
    List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? title,
    double? voteAverage,
    int? voteCount,
  }) {
    return MovieDetail(
      adult: adult ?? this.adult,
      budget: budget ?? this.budget,
      genres: genres ?? this.genres,
      id: id ?? this.id,
      imdbId: imdbId ?? this.imdbId,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      status: status ?? this.status,
      title: title ?? this.title,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'budget': budget,
      'genres': genres.map((x) => x.toMap()).toList(),
      'id': id,
      'imdb_id': imdbId,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'spoken_languages': spokenLanguages.map((x) => x.toMap()).toList(),
      'status': status,
      'title': title,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory MovieDetail.fromMap(Map<String, dynamic> map) {
    return MovieDetail(
      adult: map['adult'] ?? false,
      budget: map['budget']?.toInt() ?? 0,
      genres: List<Genre>.from(map['genres']?.map((x) => Genre.fromMap(x))),
      id: map['id']?.toInt() ?? 0,
      imdbId: map['imdb_id'] ?? '',
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      posterPath: map['poster_path'] ?? '',
      spokenLanguages: List<SpokenLanguage>.from(
          map['spoken_languages']?.map((x) => SpokenLanguage.fromMap(x))),
      status: map['status'] ?? '',
      title: map['title'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetail.fromJson(String source) =>
      MovieDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieDetail(adult: $adult, budget: $budget, genres: $genres, id: $id, imdbId: $imdbId, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, posterPath: $posterPath, spokenLanguages: $spokenLanguages, status: $status, title: $title, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieDetail &&
        other.adult == adult &&
        other.budget == budget &&
        listEquals(other.genres, genres) &&
        other.id == id &&
        other.imdbId == imdbId &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.overview == overview &&
        other.posterPath == posterPath &&
        listEquals(other.spokenLanguages, spokenLanguages) &&
        other.status == status &&
        other.title == title &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        budget.hashCode ^
        genres.hashCode ^
        id.hashCode ^
        imdbId.hashCode ^
        originalLanguage.hashCode ^
        originalTitle.hashCode ^
        overview.hashCode ^
        posterPath.hashCode ^
        spokenLanguages.hashCode ^
        status.hashCode ^
        title.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode;
  }
}

class BelongsToCollection {
  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;

  BelongsToCollection copyWith({
    int? id,
    String? name,
    String? posterPath,
    String? backdropPath,
  }) {
    return BelongsToCollection(
      id: id ?? this.id,
      name: name ?? this.name,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'posterPath': posterPath,
      'backdropPath': backdropPath,
    };
  }

  factory BelongsToCollection.fromMap(Map<String, dynamic> map) {
    return BelongsToCollection(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      posterPath: map['posterPath'] ?? '',
      backdropPath: map['backdropPath'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BelongsToCollection.fromJson(String source) =>
      BelongsToCollection.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BelongsToCollection(id: $id, name: $name, posterPath: $posterPath, backdropPath: $backdropPath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BelongsToCollection &&
        other.id == id &&
        other.name == name &&
        other.posterPath == posterPath &&
        other.backdropPath == backdropPath;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        posterPath.hashCode ^
        backdropPath.hashCode;
  }
}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  Genre copyWith({
    int? id,
    String? name,
  }) {
    return Genre(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Genre.fromMap(Map<String, dynamic> map) {
    return Genre(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Genre.fromJson(String source) => Genre.fromMap(json.decode(source));

  @override
  String toString() => 'Genre(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Genre && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

class ProductionCompany {
  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  ProductionCompany copyWith({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) {
    return ProductionCompany(
      id: id ?? this.id,
      logoPath: logoPath ?? this.logoPath,
      name: name ?? this.name,
      originCountry: originCountry ?? this.originCountry,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'logoPath': logoPath,
      'name': name,
      'originCountry': originCountry,
    };
  }

  factory ProductionCompany.fromMap(Map<String, dynamic> map) {
    return ProductionCompany(
      id: map['id']?.toInt() ?? 0,
      logoPath: map['logoPath'] ?? '',
      name: map['name'] ?? '',
      originCountry: map['originCountry'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCompany.fromJson(String source) =>
      ProductionCompany.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductionCompany(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductionCompany &&
        other.id == id &&
        other.logoPath == logoPath &&
        other.name == name &&
        other.originCountry == originCountry;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        logoPath.hashCode ^
        name.hashCode ^
        originCountry.hashCode;
  }
}

class ProductionCountry {
  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  final String iso31661;
  final String name;

  ProductionCountry copyWith({
    String? iso31661,
    String? name,
  }) {
    return ProductionCountry(
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'iso31661': iso31661,
      'name': name,
    };
  }

  factory ProductionCountry.fromMap(Map<String, dynamic> map) {
    return ProductionCountry(
      iso31661: map['iso31661'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCountry.fromJson(String source) =>
      ProductionCountry.fromMap(json.decode(source));

  @override
  String toString() => 'ProductionCountry(iso31661: $iso31661, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductionCountry &&
        other.iso31661 == iso31661 &&
        other.name == name;
  }

  @override
  int get hashCode => iso31661.hashCode ^ name.hashCode;
}

class SpokenLanguage {
  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguage copyWith({
    String? englishName,
    String? iso6391,
    String? name,
  }) {
    return SpokenLanguage(
      englishName: englishName ?? this.englishName,
      iso6391: iso6391 ?? this.iso6391,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'englishName': englishName,
      'iso6391': iso6391,
      'name': name,
    };
  }

  factory SpokenLanguage.fromMap(Map<String, dynamic> map) {
    return SpokenLanguage(
      englishName: map['englishName'] ?? '',
      iso6391: map['iso6391'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SpokenLanguage.fromJson(String source) =>
      SpokenLanguage.fromMap(json.decode(source));

  @override
  String toString() =>
      'SpokenLanguage(englishName: $englishName, iso6391: $iso6391, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpokenLanguage &&
        other.englishName == englishName &&
        other.iso6391 == iso6391 &&
        other.name == name;
  }

  @override
  int get hashCode => englishName.hashCode ^ iso6391.hashCode ^ name.hashCode;
}
