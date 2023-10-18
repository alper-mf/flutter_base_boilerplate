import 'package:overlay_kit/overlay_kit.dart';

extension EndpointFutureExtenstion<T> on Future<T> {
  Future<T> callEndpoint() async {
    return await callWithProgress();
  }
}
