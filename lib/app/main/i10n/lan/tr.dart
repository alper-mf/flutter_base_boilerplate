import '../default_localization.dart';

class TrLocalization extends AppLocalizationLabel {
  const TrLocalization();

  @override
  final String lanCode = 'tr';
  @override
  final String localizationTitle = 'Türkçe';
  @override
  final String defaultErrorMessage = 'Hata oluştu. Lütfen daha sonra tekrar deneyiniz';
  @override
  final String noInternetErrorMessage = 'Lütfen internet bağlantınızı kontrol ediniz.';
  @override
  final String unauthorizedErrorMessage = 'Bu işlem için yetkiniz bulunmamaktadır.';
  @override
  final String serverErrorMessage = 'Sunucu kaynaklı bi hata oluştu. Lütfen daha sonra tekrar deneyiniz';
  @override
  final String cancelBtnText = 'İptal';
  @override
  final String tryAgainBtnText = 'Tekrar Dene';
  @override
  final String enterEmailAddressReqExMessage = 'Eposta adresi giriniz.';
  @override
  final String enterValidEmailReqExMessage = 'Geçerli eposta adresi giriniz.';
  @override
  final String enterTelNoReqExMessage = 'Telefon numarası giriniz.';
  @override
  final String enterValidTelNoReqExMessage = 'Geçerli telefon numarası giriniz.';
  @override
  final String enterValidCodeReqExMessage = 'Geçerli kod giriniz.';
  @override
  final String enterNameReqExMessage = 'Ad giriniz.';
  @override
  final String enterValidNameReqExMessage = 'Geçerli ad giriniz.';
  @override
  final String enterSurnameReqExMessage = 'Soyadı giriniz.';
  @override
  final String enterValidSurnameReqExMessage = 'Geçerli Soyadı giriniz.';
  @override
  final String requiredFieldReqExMessage = 'Zorunlu alan.';
  @override
  final String enterValidCardNoReqExMessage = 'Geçerli kart numarası giriniz.';
  @override
  final String enterValidDatReqExMessage = 'Geçerli tarih girin.';
  @override
  final String enterValidPasswordReqExMessage = 'Geçerli şifre giriniz.';
  @override
  String get timeoutErrorMessage => 'Bağlantı zaman aşımına uğradı';
  
  @override
  String get unknownPageRouteMessageText => 'Burada olmaman gerek :)';
}
