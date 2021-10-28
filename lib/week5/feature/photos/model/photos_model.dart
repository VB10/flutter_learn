import 'package:json_annotation/json_annotation.dart';

part 'photos_model.g.dart';

@JsonSerializable()
class PhotoModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  @JsonKey(ignore: true)
  int count = 0;
  @JsonKey(ignore: true)
  double price = 25;

  PhotoModel();

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return _$PhotoModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PhotoModelToJson(this);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhotoModel &&
        other.albumId == albumId &&
        other.id == id &&
        other.title == title &&
        other.url == url &&
        other.thumbnailUrl == thumbnailUrl &&
        other.price == price;
  }

  @override
  int get hashCode {
    return albumId.hashCode ^ id.hashCode ^ title.hashCode ^ url.hashCode ^ thumbnailUrl.hashCode ^ count.hashCode ^ price.hashCode;
  }
}
