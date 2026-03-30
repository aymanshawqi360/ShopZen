class Endpoints {
  //Api Path
  static const String _apiEndPont = 'api/';
  //V1 Path
  static const String _v1EndPont = 'v1/';
  //Auth Path
  static const String _auth = 'auth';

  //===========[Auth]===========

  //Register
  static const String register = '$_apiEndPont$_v1EndPont$_auth/register';

  //Login
  static const String login = '$_apiEndPont$_v1EndPont$_auth/login';

  //Change Password
  static const String forgotPassword =
      '$_apiEndPont$_v1EndPont$_auth/forgot-password';

  //Resend Otp
  static const String otpVerification =
      '$_apiEndPont$_v1EndPont$_auth/otp-verification';

  //Reset Password
  static const String resetPassword =
      '$_apiEndPont$_v1EndPont$_auth/reset-password';
  //Password Update
  static const String passwordUpdate =
      '$_apiEndPont$_v1EndPont$_auth/password-update';

  static const String refreshToken = '$_apiEndPont$_v1EndPont$_auth/refresh';

  //===========[Home]===========
  static const String categories =
      '$_apiEndPont$_v1EndPont$_v1EndPont get-categories';
}
