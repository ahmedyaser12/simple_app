import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simply_app/screens/home/data/get_gallery/gallery_model.dart';

import '../../../core/helper/cache_helper.dart';
import '../../../core/utils/status.dart';
import '../../../services/api_services/api_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ApiService apiService;

  HomeCubit(this.apiService) : super(HomeInitial());

  logout() async {
    CacheHelper().saveData(key: 'login', value: false);
  }

  XFile? uploadImage;

  void uploadProfilePic(XFile? image) {
    uploadImage = image;
    emit(PickImage());
  }

  getGallery() async {
    emit(GalleryLoading());
    var response = await apiService.getGallery();
    if (response.status == Status.SUCCESS) {
      emit(GallerySuccess(response.data!));
    } else {
      emit(FailureRequest(response.errorMessage!));
    }
  }

  uploadPicture() async {
    emit(UploadLoading());
    var response = await apiService.uploadPicture(profilePic: uploadImage);
    if (response.status == Status.SUCCESS) {
      emit(UploadSuccess(response.data!.message!));
    }
  }
}
