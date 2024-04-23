part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GalleryLoading extends HomeState {}

class GallerySuccess extends HomeState {
  final GalleryModel galleryModel;

  GallerySuccess(this.galleryModel);
}

class FailureRequest extends HomeState {
  final String error;

  FailureRequest(this.error);
}

class UploadLoading extends HomeState {}
class PickImage extends HomeState {}

class UploadSuccess extends HomeState {
  final String uploadPictureModel;

  UploadSuccess(this.uploadPictureModel);
}

class UploadFailure extends HomeState {
  final String error;

  UploadFailure(this.error);
}
