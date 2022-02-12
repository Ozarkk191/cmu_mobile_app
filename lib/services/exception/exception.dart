class AppException implements Exception {
  final int? code;
  final String? message;
  final String? prefix;

  AppException([this.code, this.message, this.prefix]);

  // Returns a string representing the exception.
  @override
  String toString() {
    return "$prefix$message";
  }
}

/// Exception on fetching data from web service.
class FetchDataException extends AppException {
  FetchDataException([int? code, String? message]) : super(null, message, "");
}

/// Exception on receiving 400 Bad Request HTTP status from web service.
class BadRequestException extends AppException {
  BadRequestException([int? code, message]) : super(400, message, "");
}

/// Exception on receiving 401 Unauthorised or 403 Forbidden HTTP status from web service.
class UnauthorisedException extends AppException {
  UnauthorisedException([int? code, message]) : super(401, message, "");
}

/// Exception on invalid input.
class InvalidInputException extends AppException {
  InvalidInputException([int? code, String? message]) : super(400, message, "");
}
