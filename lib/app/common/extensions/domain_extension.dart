import 'package:flutter_base_project/app/common/exception/app_exception.dart';
import 'package:flutter_base_project/app/common/extensions/general_extension.dart';
import '../../main/i10n/i10n.dart';
import '../../data/local_models/domain/base_http_model.dart';

extension BaseRequestExtension<T> on Future<BaseHttpModel<T>> {
  
  Future<T> getAllData() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await this;
    if (response.status.isOk) {
      return response.data as T;
    } else {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }
}

