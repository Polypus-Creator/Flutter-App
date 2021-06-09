class ApiException implements Exception {
  final String message;

  ApiException(this.message) {
    print("Api Exception: $message");
  }
}
