import 'package:shopzen/core/config/env_config.dart';

class ApiConnectTimeout{
  static const int _seconds =30;
  static const Duration _apiRequestTimeout = Duration(seconds: _seconds);
  static const Duration connectTimeout =_apiRequestTimeout;
  static const Duration receiveTimeout = _apiRequestTimeout;
  
}
class ApiBasUrl{
   static final String baseUrl =EnvConfig.getBaseUrl();
  
}
class ApiDefaults{
 static const bool shouldReceiveDataWhenStatusError = true;
}
class APiHeaders{
  static  Map<String,String> headers = 
   {
    'Accept':EnvConfig.getAcceptToken(),
   };
}

class EndPonts{
  //Api Path
  static const String _apiEndPont='api/';
  //V1 Path
  static const String _v1EndPont='v1/';
  //Auth Path
  static const String _auth='auth';
 
 //Auth

  //Register
  static const String register='$_apiEndPont$_v1EndPont$_auth/register';

  //Login
  static const String login='$_apiEndPont$_v1EndPont$_auth/login';
  
  //Change Password
  static const String forgotPassword='$_apiEndPont$_v1EndPont$_auth/forgot-password';
}

// {
//     "status": true,
//     "message": "344903"
// }