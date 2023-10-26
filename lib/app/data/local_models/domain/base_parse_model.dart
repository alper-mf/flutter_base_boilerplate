import 'dart:convert';
import 'dart:isolate';

abstract class IBaseModel<T> {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();

  dynamic jsonParser(String jsonBody) {
    assert(T.toString() != 'dynamic');
    final _json = json.decode(jsonBody);
    if (_json is List) {
      return _json.map((e) => fromJson(e)).toList().cast<T>();
    } else if (_json is Map<String, dynamic>) {
      return fromJson(_json);
    } else {
      return _json;
    }
  }

  Future<dynamic> backgroundJsonParser(String jsonBody) async {
    final port = ReceivePort('BaseParseModel');
    await Isolate.spawn(
      _backgroundJsonParser,
      {'port': port.sendPort, 'body': jsonBody},
      onError: port.sendPort,
    );
    return await port.first;
  }

  _backgroundJsonParser(map) {
    final port = map['port'];
    Isolate.exit(port, jsonParser(map['body']));
  }

  String convertToJson([dynamic model]) {
    if (model == null) {
      return json.encode(toJson());
    }

    assert(model is T || model is List<T>);

    if (model is List) {
      final list = List.from(model.map((e) => e?.toJson()));
      return json.encode(list);
    } else {
      return json.encode(model.toJson());
    }
  }

  Future<String> backgroundConvertToJson([List<T>? model]) async {
    final port = ReceivePort('BaseParseModel');
    await Isolate.spawn<Map>(
      _backgroundConvertToJson,
      {'port': port.sendPort, 'model': model},
      onError: port.sendPort,
    );
    return await port.first;
  }

  _backgroundConvertToJson(Map map) {
    final port = map['port'];
    final model = map['model'];
    Isolate.exit(port, convertToJson(model));
  }
}
