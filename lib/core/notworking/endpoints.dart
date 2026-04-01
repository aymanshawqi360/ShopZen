class Endpoints {
  //Api Path
  static const String _apiEndPoint = 'api/';
  //V1 Path
  static const String _v1EndPoint = 'v1/';

  static const String _basePath = '$_apiEndPoint$_v1EndPoint';

  //===========[Auth]===========
  static const String _auth = 'auth';

  //Register
  static const String register = '$_basePath$_auth/register';

  //Login
  static const String login = '$_basePath$_auth/login';

  //Change Password
  static const String forgotPassword = '$_basePath$_auth/forgot-password';

  //Resend Otp
  static const String otpVerification = '$_basePath$_auth/otp-verification';

  //Reset Password
  static const String resetPassword = '$_basePath$_auth/reset-password';

  //Password Update
  static const String passwordUpdate = '$_basePath$_auth/password-update';

  //Refresh
  static const String refreshToken = '$_basePath$_auth/refresh';

  //===========[Home]===========
  static const String categories = '${_basePath}get-categories';
}
