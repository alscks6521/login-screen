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

class GalleryItemHints {
  final String tags;
  final String webformatURL;

  GalleryItemHints({
    required this.tags,
    required this.webformatURL,
  });

  GalleryItemHints copyWith({
    String? tags,
    String? webformatURL,
  }) {
    return GalleryItemHints(
      tags: tags ?? this.tags,
      webformatURL: webformatURL ?? this.webformatURL,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tags': tags,
      'webformatURL': webformatURL,
    };
  }

  factory GalleryItemHints.fromMap(Map<String, dynamic> map) {
    return GalleryItemHints(
      tags: map['tags'] as String,
      webformatURL: map['webformatURL'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GalleryItemHints.fromJson(String source) =>
      GalleryItemHints.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GalleryItemHints(tags: $tags, webformatURL: $webformatURL)';

  @override
  bool operator ==(covariant GalleryItemHints other) {
    if (identical(this, other)) return true;

    return other.tags == tags && other.webformatURL == webformatURL;
  }

  @override
  int get hashCode => tags.hashCode ^ webformatURL.hashCode;
}
