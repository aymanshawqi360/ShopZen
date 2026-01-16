// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get onboardingAppDescription =>
      'Your one-stop destination for hassle-\nfree online shopping';

  @override
  String get onboardingWelcome => 'Welcome to ShopZen';

  @override
  String get onboardingGetStarted => 'Get Started';

  @override
  String get loginWithEmail => 'Login with Email';

  @override
  String get passwordField => 'Password';

  @override
  String get emailField => 'Email';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get enterYourEmail => 'Enter your email';

  @override
  String get enterYourPassword => 'Enter your password';

  @override
  String get login => 'Login';

  @override
  String get noAccount => 'Don\'t have an account? ';

  @override
  String get signUp => 'Sign Up';

  @override
  String get rememberMe => 'Remember me';
}
