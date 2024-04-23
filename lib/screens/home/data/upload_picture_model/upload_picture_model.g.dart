// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_picture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadPhotoModel _$UploadPhotoModelFromJson(Map<String, dynamic> json) =>
    UploadPhotoModel(
      status: json['status'] as String?,
      data: json['data'] as List<dynamic>?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UploadPhotoModelToJson(UploadPhotoModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
