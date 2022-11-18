/// Written for Http Exception error
class AppException implements Exception {
  String? message;

  AppException([this.message]);

  @override
  String toString() {
    message ??= 'Error';

    return message!;
  }
}

class ServerError extends AppException {
  ServerError() : super('Server Error.');
}

class InternetError extends AppException {
  InternetError() : super('Internet connection error.');
}
