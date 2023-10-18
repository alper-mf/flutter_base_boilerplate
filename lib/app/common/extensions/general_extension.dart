import '../../main/values/enums/loading_status_enum.dart';

/// [LoadingStatus] Enumun durumlarını kontrol etmek için yazıldı
extension LoadingStatusExtension on LoadingStatus {
  get isLoading => this == LoadingStatus.Loading;

  get isInit => this == LoadingStatus.Init;

  get isError => this == LoadingStatus.Error;

  get isLoaded => this == LoadingStatus.Loaded;
}

/// [BaseModelStatus] Enumun durumlarını kontrol etmek için yazıldı
extension BaseModelStatusExtension on BaseModelStatus {
  get isOk => this == BaseModelStatus.Ok;

  get isAction => this == BaseModelStatus.Action;

  get isError => this == BaseModelStatus.Error;

  get isUnprocessableEntity => this == BaseModelStatus.UnprocessableEntity;

  get isTimeOut => this == BaseModelStatus.TimeOut;

  get isNotFound => this == BaseModelStatus.NotFound;

  get isFound => this == BaseModelStatus.Found;
}
