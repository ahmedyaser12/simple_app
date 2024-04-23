import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simply_app/screens/home/data/get_gallery/gallery_model.dart';
import 'package:simply_app/screens/home/data/upload_picture_model/upload_picture_model.dart';
import 'package:simply_app/screens/login_screen/data/model/login_model.dart';
import 'package:simply_app/services/api_services/api_consumer.dart';

import '../../core/errors/exceptions.dart';
import '../../core/utils/resources.dart';
import '../../core/utils/status.dart';
import 'end_points.dart';

class ApiService {
  ApiConsumer api;

  ApiService(this.api);

  Future<Resource<UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    var response = await api.post(ApiConstants.signIn, isFormData: true, data: {
      ApiKey.email: email,
      ApiKey.password: password,
    });
    if (response['error_message'] == 'Invalid Credntials') {
      return Resource(
        Status.ERROR,
        errorMessage: response['error_message'],
      );
    } else {
      return Resource(Status.SUCCESS, data: UserModel.fromJson(response));
    }
  }

  Future<Resource<UploadPhotoModel>> uploadPicture({
    XFile? profilePic, // Note: Make sure profilePic is nullable
  }) async {
    try {
      Map<String, dynamic> data = {};

      if (profilePic != null) {
        data[ApiKey.profilePic] = await MultipartFile.fromFile(profilePic.path,
            filename: profilePic.path.split('/').last);
      }

      var response =
          await api.post(ApiConstants.upload, isFormData: true, data: data);
      return Resource(Status.SUCCESS,
          data: UploadPhotoModel.fromJson(response));
    } on ServerExceptions catch (exception) {
      return Resource(
        Status.ERROR,
        errorMessage: exception.errModel.errorMessage,
      );
    }
  }

  Future<Resource<GalleryModel>> getGallery() async {
    try {
      var response = await api.get(ApiConstants.getGallery);
      return Resource(Status.SUCCESS, data: GalleryModel.fromJson(response));
    } on ServerExceptions catch (exception) {
      return Resource(Status.ERROR,
          errorMessage: exception.errModel.errorMessage);
    }
  }
}
