class ApiConnectTimeout {
  static const int _seconds = 30;
  static const Duration _apiRequestTimeout = Duration(seconds: _seconds);
  static const Duration connectTimeout = _apiRequestTimeout;
  static const Duration receiveTimeout = _apiRequestTimeout;
}

class ApiBasUrl {
  static const String baseUrl = 'http://192.168.1.101:8000/';
  static const String imageUrl = '${baseUrl}storage/';
}

class ApiDefaults {
  static const bool shouldReceiveDataWhenStatusError = true;
}

class APiHeaders {
  static Map<String, String> headers = {'Accept': 'application/json'};
}
