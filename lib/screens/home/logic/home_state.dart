part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class Loading extends HomeState {}


class SuccessRequest extends HomeState {

}
class FailureRequest extends HomeState {
  final String error;

  FailureRequest(this.error);
}
