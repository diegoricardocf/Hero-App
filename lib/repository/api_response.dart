class APIResponse<T> {
  T? successData;
  bool error;
  String? errorMessage;

  APIResponse({this.successData, this.errorMessage, this.error=false});
}