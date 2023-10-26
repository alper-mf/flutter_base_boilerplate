import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/common/extensions/widget_extension.dart';
import 'package:get/get.dart';
import '../../../main/i10n/i10n.dart';
import '../../../components/dialog/error_dialog.dart';
import '../../../main/values/enum/loading_status_enum.dart';
import '../../../repositories/app_repository.dart';
import '../../exception/app_exception.dart';


abstract class BaseControllerInterface extends GetxController{
  
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext get context => scaffoldKey.currentContext!;

  AppRepository get appRepository => AppRepository.instance;

  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<String?> _errorMessage = Rx(null);

  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;

  String? get errorMessage => _errorMessage.value;
  set errorMessage(String? value) => _errorMessage.value = value;


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
    

  void unFocus() => FocusScope.of(context).unfocus();

  void onTapBack() => Navigator.pop(context);

  void showErrorDialog({String? message,bool barrierDismissible=true, required VoidCallback onTapFirstBtn}) => ErrorDialog(
        message: message,
        onTapFirstBtn: () {
          Navigator.pop(context);
          onTapFirstBtn();
        },
      ).openSimpleDialog(context: context,barrierDismissible:barrierDismissible );
}
