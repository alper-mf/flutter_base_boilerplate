class SessionHeaderModel {
  const SessionHeaderModel({
    required this.token,
  });

  final String token;
  final String lang = 'tr';

  Map<String, String> createHeader({Map<String, String> addMap = const {}}) {
    final Map<String, String> map = {
      'content-type': 'application/json',
      'authorization': 'Bearer $token',
      'lang': lang,
    };
    map.addAll(addMap);
    return map;
  }
}
