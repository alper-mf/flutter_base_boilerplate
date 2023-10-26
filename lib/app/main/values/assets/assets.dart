/// Tüm Assets path leri buradan çekilecek
/// Proje içinde Herhangi bir path yazılmayacak

const String fontFamily = 'GreycliffCF';
const String assetsPath = 'assets/';

const String iconPath = '$assetsPath/icons/';


const String circleDoneIcon = '${iconPath}circle_done_icon.svg';
const String errorIcon = '${iconPath}error_icon.svg';
const String outlineDoneIcon = '${iconPath}outline_done_icon.svg';
const String outlineErrorIcon = '${iconPath}outline_error_icon.svg';
const String warningIcon = '${iconPath}warning_ixon.svg';



String getFlagPath(String countryCode) => 'assets/flags/${countryCode.toLowerCase()}.png';

