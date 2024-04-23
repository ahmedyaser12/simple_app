import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/cache_helper.dart';
import '../../../services/api_services/api_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ApiService apiService;

  HomeCubit(this.apiService) : super(HomeInitial());

  logout() async {
    CacheHelper().saveData(key: 'login', value: false);
  }
}
