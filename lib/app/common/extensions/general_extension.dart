import 'package:get/get.dart';
import '../../main/values/enum/loading_status_enum.dart';


extension LoadingStatusExtension on LoadingStatus {
  bool get isLoading => this == LoadingStatus.Loading;

  bool get isInit => this == LoadingStatus.Init;

  bool get isError => this == LoadingStatus.Error;

  bool get isLoaded => this == LoadingStatus.Loaded;

  bool get isProcessing => this == LoadingStatus.Processing;
}

extension BaseModelStatusExtension on BaseModelStatus {
  bool get isOk => this == BaseModelStatus.Ok;

  bool get isAction => this == BaseModelStatus.Action;

  bool get isError => this == BaseModelStatus.Error;

  bool get isUnprocessableEntity => this == BaseModelStatus.UnprocessableEntity;

  bool get isTimeOut => this == BaseModelStatus.TimeOut;

  bool get isNotFound => this == BaseModelStatus.NotFound;

  bool get isFound => this == BaseModelStatus.Found;
}


extension GetXExtension on GetInterface {
  S? canFind<S>({String? tag}) {
    try {
      return GetInstance().find<S>(tag: tag);
    } on String {
      return null;
    }
  }
}
