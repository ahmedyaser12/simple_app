import 'package:simply_app/screens/login_screen/data/model/login_model.dart';
import 'package:simply_app/services/api_services/api_consumer.dart';

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
}
