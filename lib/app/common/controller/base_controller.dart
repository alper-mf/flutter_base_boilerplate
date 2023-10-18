import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/common/extensions/widget_extension.dart';
import 'package:get/get.dart';

import '../../components/dialog/error_dialog.dart';

import '../../main/localizations/i10n/i10n.dart';
import '../../main/values/enums/loading_status_enum.dart';

import '../../repositories/repository.dart';
import '../exceptions/http_error_exception.dart';

abstract class BaseControllerInterface extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext get context => scaffoldKey.currentContext!;

  final repository = Repository();

  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<String?> _errorMessage = Rx(null);

  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  String? get errorMessage => _errorMessage.value;
  set errorMessage(String? value) => _errorMessage.value = value;

  bool get isOperationInProcess => loadingStatus == LoadingStatus.Init;

  bool get showAppBarLoading => loadingStatus == LoadingStatus.Init;

  Future<void> onReadyGeneric(Function onReadyFunction) async {
    super.onReady();
    try {
      loadingStatus = LoadingStatus.Loading;
      await onReadyFunction();
      loadingStatus = LoadingStatus.Loaded;
    } on AppException catch (e) {
      errorMessage = e.toString();
      loadingStatus = LoadingStatus.Error;
    } catch (e) {
      errorMessage = AppLocalization.getLabels.defaultErrorMessage;
      loadingStatus = LoadingStatus.Error;
    }
  }

  Future<T> getAllData<T>(Future<T> Function() getData) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await getData() as Response;
    if (response.status == BaseModelStatus.Ok) {
      return response.body as T;
    } else {
      throw AppException(response.body ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }

  void unFocus() => FocusScope.of(context).unfocus();

  void onTapBack() => Navigator.pop(context);

  void showErrorDialog({String? message, required VoidCallback onTapFirstBtn}) {
    ErrorDialog(
      message: message,
      onTapFirstBtn: () {
        Navigator.pop(context);
        onTapFirstBtn();
      },
    ).openSimpleDialog(context: context);
  }
}
