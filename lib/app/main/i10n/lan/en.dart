import '../default_localization.dart';

class EnLocalization extends AppLocalizationLabel {
  const EnLocalization();

  @override
  final String lanCode = 'en';

  @override
  final String localizationTitle = 'English';

  @override
  final String defaultErrorMessage = 'An error occurred. Please try again later';

  @override
  final String noInternetErrorMessage = 'Please check your internet connection.';

  @override
  final String unauthorizedErrorMessage = 'You do not have the authority for this operation.';

  @override
  final String serverErrorMessage = 'A server-related error occurred. Please try again later';

  @override
  final String cancelBtnText = 'Cancel';

  @override
  final String tryAgainBtnText = 'Try Again';

  @override
  final String enterEmailAddressReqExMessage = 'Please enter an email address.';

  @override
  final String enterValidEmailReqExMessage = 'Please enter a valid email address.';

  @override
  final String enterTelNoReqExMessage = 'Please enter a phone number.';

  @override
  final String enterValidTelNoReqExMessage = 'Please enter a valid phone number.';

  @override
  final String enterValidCodeReqExMessage = 'Please enter a valid code.';

  @override
  final String enterNameReqExMessage = 'Please enter a name.';

  @override
  final String enterValidNameReqExMessage = 'Please enter a valid name.';

  @override
  final String enterSurnameReqExMessage = 'Please enter a surname.';

  @override
  final String enterValidSurnameReqExMessage = 'Please enter a valid surname.';

  @override
  final String requiredFieldReqExMessage = 'Required field.';

  @override
  final String enterValidCardNoReqExMessage = 'Please enter a valid card number.';

  @override
  final String enterValidDatReqExMessage = 'Please enter a valid date.';

  @override
  final String enterValidPasswordReqExMessage = 'Please enter a valid password.';

  @override
  final String unknownPageRouteMessageText = 'You should not be here :)';

  @override
  String get timeoutErrorMessage => 'The connection has timed out';

}
