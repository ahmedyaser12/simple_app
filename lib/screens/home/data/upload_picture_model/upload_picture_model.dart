
import 'package:json_annotation/json_annotation.dart';
part 'upload_picture_model.g.dart';
@JsonSerializable()
class UploadPhotoModel {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "data")
  List<dynamic>? data;
  @JsonKey(name: "message")
  String? message;

  UploadPhotoModel({
    this.status,
    this.data,
    this.message,
  });

  factory UploadPhotoModel.fromJson(Map<String, dynamic> json) => _$UploadPhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UploadPhotoModelToJson(this);
}
