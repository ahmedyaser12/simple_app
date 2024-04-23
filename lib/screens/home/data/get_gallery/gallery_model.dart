import 'package:json_annotation/json_annotation.dart';
part  'gallery_model.g.dart';
@JsonSerializable()
class GalleryModel {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "data")
  Data? data;
  @JsonKey(name: "message")
  String? message;

  GalleryModel({
    this.status,
    this.data,
    this.message,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) => _$GalleryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "images")
  List<String>? images;

  Data({
    this.images,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
