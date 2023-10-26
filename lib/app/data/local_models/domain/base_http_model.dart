import '../../../main/values/enum/loading_status_enum.dart';

class BaseHttpModel<T> {

  BaseHttpModel({required this.status, this.data, this.message, this.errorCode});
  BaseModelStatus status;
  T? data;
  String? message;
  String? errorCode;
}
