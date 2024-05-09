// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

// Dart Data Class Generator 확장프로그램 기능 사용법 :
// 안쪽class부터 아래 예를들면 GalleryItemHints 먼저실행
// 1. cmd + .
// 2. 'Generato data class' 클릭

class GalleryItem {
  final int total;
  final int totalHits;
  final List<GalleryItemHints> hits;

  GalleryItem({
    required this.total,
    required this.totalHits,
    required this.hits,
  });

  GalleryItem copyWith({
    int? total,
    int? totalHits,
    List<GalleryItemHints>? hits,
  }) {
    return GalleryItem(
      total: total ?? this.total,
      totalHits: totalHits ?? this.totalHits,
      hits: hits ?? this.hits,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total': total,
      'totalHits': totalHits,
      'hits': hits.map((x) => x.toMap()).toList(),
    };
  }

  factory GalleryItem.fromMap(Map<String, dynamic> map) {
    return GalleryItem(
      total: map['total'] as int,
      totalHits: map['totalHits'] as int,
      hits: List<GalleryItemHints>.from(
        (map['hits'] as List<dynamic>).map<GalleryItemHints>(
          (x) => GalleryItemHints.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GalleryItem.fromJson(String source) =>
      GalleryItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GalleryItem(total: $total, totalHits: $totalHits, hits: $hits)';

  @override
  bool operator ==(covariant GalleryItem other) {
    if (identical(this, other)) return true;

    return other.total == total && other.totalHits == totalHits && listEquals(other.hits, hits);
  }

  @override
  int get hashCode => total.hashCode ^ totalHits.hashCode ^ hits.hashCode;
}

//--------------------------
class GalleryItemHints {
  final String tags;
  final String webformatURL;
  final String largeImageURL;
  final int imageWidth;
  final int imageHeight;
  final int imageSize;
  final int views;
  final int collection;
  final int downloads;
  final int likes;
  final int comments;
  final int userId;
  final String user;
  final String userImageURL;

  GalleryItemHints({
    required this.tags,
    required this.webformatURL,
    required this.largeImageURL,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.collection,
    required this.downloads,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageURL,
  });

  get id => null;

  GalleryItemHints copyWith({
    String? tags,
    String? webformatURL,
    String? largeImageURL,
    int? imageWidth,
    int? imageHeight,
    int? imageSize,
    int? views,
    int? collection,
    int? downloads,
    int? likes,
    int? comments,
    int? userId,
    String? user,
    String? userImageURL,
  }) {
    return GalleryItemHints(
      tags: tags ?? this.tags,
      webformatURL: webformatURL ?? this.webformatURL,
      largeImageURL: largeImageURL ?? this.largeImageURL,
      imageWidth: imageWidth ?? this.imageWidth,
      imageHeight: imageHeight ?? this.imageHeight,
      imageSize: imageSize ?? this.imageSize,
      views: views ?? this.views,
      collection: collection ?? this.collection,
      downloads: downloads ?? this.downloads,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      userId: userId ?? this.userId,
      user: user ?? this.user,
      userImageURL: userImageURL ?? this.userImageURL,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tags': tags,
      'webformatURL': webformatURL,
      'largeImageURL': largeImageURL,
      'imageWidth': imageWidth,
      'imageHeight': imageHeight,
      'imageSize': imageSize,
      'views': views,
      'collection': collection,
      'downloads': downloads,
      'likes': likes,
      'comments': comments,
      'userId': userId,
      'user': user,
      'userImageURL': userImageURL,
    };
  }

  factory GalleryItemHints.fromMap(Map<String, dynamic> map) {
    return GalleryItemHints(
      tags: map['tags'] as String,
      webformatURL: map['webformatURL'] as String,
      largeImageURL: map['largeImageURL'] as String,
      imageWidth: map['imageWidth'] as int? ?? 0,
      imageHeight: map['imageHeight'] as int? ?? 0,
      imageSize: map['imageSize'] as int? ?? 0,
      views: map['views'] as int? ?? 0,
      collection: map['collection'] as int? ?? 0,
      downloads: map['downloads'] as int? ?? 0,
      likes: map['likes'] as int? ?? 0,
      comments: map['comments'] as int? ?? 0,
      userId: map['userId'] as int? ?? 0,
      user: map['user'] as String? ?? '',
      userImageURL: map['userImageURL'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GalleryItemHints.fromJson(String source) =>
      GalleryItemHints.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GalleryItemHints(tags: $tags, webformatURL: $webformatURL, largeImageURL: $largeImageURL, imageWidth: $imageWidth, imageHeight: $imageHeight, imageSize: $imageSize, views: $views, collection: $collection, downloads: $downloads, likes: $likes, comments: $comments, userId: $userId, user: $user, userImageURL: $userImageURL)';
  }

  @override
  bool operator ==(covariant GalleryItemHints other) {
    if (identical(this, other)) return true;

    return other.tags == tags &&
        other.webformatURL == webformatURL &&
        other.largeImageURL == largeImageURL &&
        other.imageWidth == imageWidth &&
        other.imageHeight == imageHeight &&
        other.imageSize == imageSize &&
        other.views == views &&
        other.collection == collection &&
        other.downloads == downloads &&
        other.likes == likes &&
        other.comments == comments &&
        other.userId == userId &&
        other.user == user &&
        other.userImageURL == userImageURL;
  }

  @override
  int get hashCode {
    return tags.hashCode ^
        webformatURL.hashCode ^
        largeImageURL.hashCode ^
        imageWidth.hashCode ^
        imageHeight.hashCode ^
        imageSize.hashCode ^
        views.hashCode ^
        collection.hashCode ^
        downloads.hashCode ^
        likes.hashCode ^
        comments.hashCode ^
        userId.hashCode ^
        user.hashCode ^
        userImageURL.hashCode;
  }
}
