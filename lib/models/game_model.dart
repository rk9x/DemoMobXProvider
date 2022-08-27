class GameModel {
  int? count;
  String? next;
  String? previous;
  List<GameData>? results;

  GameModel({this.count, this.next, this.previous, this.results});

  GameModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <GameData>[];
      json['results'].forEach((v) {
        results!.add(GameData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GameData {
  int? id;
  String? slug;
  String? name;
  String? released;
  bool? tba;
  String? backgroundImage;
  double? rating;
  num? ratingTop;
  num? ratingsCount;
  String? reviewsTextCount;
  int? added;
  int? playtime;
  int? suggestionsCount;
  String? updated;

  GameData(
      {this.id,
      this.slug,
      this.name,
      this.released,
      this.tba,
      this.backgroundImage,
      this.rating,
      this.ratingTop,
      this.ratingsCount,
      this.reviewsTextCount,
      this.added,
      this.playtime,
      this.suggestionsCount,
      this.updated});

  GameData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    released = json['released'];
    tba = json['tba'];
    backgroundImage = json['background_image'];
    rating = json['rating'] ?? 0.0;
    ratingTop = json['rating_top'];
    ratingsCount = json['ratings_count'];
    reviewsTextCount = (json['reviews_text_count'] ?? 0).toString();
    added = json['added'];
    playtime = json['playtime'];
    suggestionsCount = json['suggestions_count'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['name'] = name;
    data['released'] = released;
    data['tba'] = tba;
    data['background_image'] = backgroundImage;
    data['rating'] = rating;
    data['rating_top'] = ratingTop;
    data['ratings_count'] = ratingsCount;
    data['reviews_text_count'] = reviewsTextCount;
    data['added'] = added;
    data['playtime'] = playtime;
    data['suggestions_count'] = suggestionsCount;
    data['updated'] = updated;
    return data;
  }
}
