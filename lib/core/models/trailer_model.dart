import 'package:movie_app/core/entities/trailer.dart';

class TrailerModel extends Trailer {
  TrailerModel({
    required super.iso6391,
    required super.iso31661,
    required super.name,
    required super.key,
    required super.site,
    required super.size,
    required super.type,
    required super.official,
    required super.publishedAt,
    required super.id,
  });

  factory TrailerModel.fromJson(Map<String, dynamic> json) => TrailerModel(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: DateTime.parse(json["published_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "published_at": publishedAt.toIso8601String(),
        "id": id,
      };
}
