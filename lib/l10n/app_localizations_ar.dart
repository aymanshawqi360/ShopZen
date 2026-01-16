// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get onboardingAppDescription =>
      'وجهتك المثالية للتسوق عبر الإنترنت\nبسهولة ودون عناء';

  @override
  String get onboardingWelcome => 'مرحباً بك في ShopZen';

  @override
  String get onboardingGetStarted => 'ابدأ الآن';

  @override
  String get loginWithEmail => 'تسجيل الدخول بالبريد الإلكتروني';

  @override
  String get passwordField => 'كلمة المرور';

  @override
  String get emailField => 'البريد الإلكتروني';

  @override
  String get forgotPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get enterYourEmail => 'أدخل بريدك الإلكتروني';

  @override
  String get enterYourPassword => 'أدخل كلمة المرور الخاصة بك';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get noAccount => 'ليس لديك حساب؟ ';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get rememberMe => 'تذكرني';
}
