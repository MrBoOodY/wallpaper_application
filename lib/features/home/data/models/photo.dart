import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallpaper_application/features/home/data/models/image.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
abstract class Photo with _$Photo {
  const Photo._();
  const factory Photo({
    int? id,
    int? width,
    int? height,
    String? url,
    String? photographer,
    String? photographerUrl,
    int? photographerId,
    String? avgColor,
    ImageModel? src,
    bool? liked,
    String? alt,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toSQFLiteMap() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
      'photographer': photographer,
      'photographer_url': photographerUrl,
      'photographer_id': photographerId,
      'avg_color': avgColor,
      'src': jsonEncode(src?.toJson()),
      'liked': liked! ? 1 : 0,
      'alt': alt,
    };
  }

  factory Photo.fromSQFLiteMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id'],
      width: map['width'],
      height: map['height'],
      url: map['url'],
      photographer: map['photographer'],
      photographerUrl: map['photographer_url'],
      photographerId: map['photographer_id'],
      avgColor: map['avg_color'],
      src: ImageModel.fromJson(jsonDecode(map['src'])),
      liked: map['liked'] == 1,
      alt: map['alt'],
    );
  }
}
