/// Localized text constants used throughout the authentication flow and dashboard.
class AppStrings {
  AppStrings._();

  // App & Branding
  static const String appName = 'دفتر المحاسب';
  static const String appSubtitle = 'المنظومة المالية وإدارة الحسابات الذكية';
  static const String appBadge = 'الإصدار المالي v2.5';

  // Login Header
  static const String loginTitle = 'مرحباً بك مجدداً';
  static const String loginSubtitle = 'سجّل دخولك للوصول إلى لوحة المؤشرات، الفواتير، والتقارير المالية.';

  // Form Fields
  static const String emailLabel = 'البريد الإلكتروني للعمل';
  static const String emailHint = 'name@company.com';
  static const String passwordLabel = 'كلمة المرور';
  static const String passwordHint = '••••••••';
  static const String companyNameLabel = 'اسم المؤسسة / الشركة';
  static const String companyNameHint = 'شركة الأفق للتجارة والمقاولات';
  static const String phoneLabel = 'رقم الجوال';
  static const String phoneHint = '0501234567';
  static const String confirmPasswordLabel = 'تأكيد كلمة المرور';

  // Options
  static const String rememberMe = 'تذكر هذا الجهاز';
  static const String forgotPassword = 'نسيت كلمة المرور؟';
  static const String biometricLogin = 'الدخول السريع بالبصمة';

  // Actions
  static const String loginButton = 'تسجيل الدخول';
  static const String loggingIn = 'جارٍ تسجيل الدخول...';
  static const String quickDemoFill = 'تعبئة بيانات تجريبية';
  static const String signupButton = 'إنشاء الحساب المالي';
  static const String signingUp = 'جارٍ إنشاء الحساب...';

  // Social / SSO
  static const String orDivider = 'أو المتابعة عبر';
  static const String googleLogin = 'حساب Google';
  static const String microsoftLogin = 'حساب Microsoft';
  static const String appleLogin = 'حساب Apple';

  // Footer & Navigation
  static const String noAccount = 'ليس لديك حساب لمؤسستك بعد؟';
  static const String createAccount = 'إنشاء حساب جديد';
  static const String hasAccount = 'لديك حساب بالفعل؟';
  static const String loginHere = 'سجّل دخولك من هنا';

  // Validation Messages
  static const String emailRequired = 'يرجى إدخال البريد الإلكتروني';
  static const String emailInvalid = 'يرجى إدخال بريد إلكتروني صحيح';
  static const String passwordRequired = 'يرجى إدخال كلمة المرور';
  static const String passwordTooShort = 'كلمة المرور يجب ألا تقل عن 6 أحرف';
  static const String companyNameRequired = 'يرجى إدخال اسم المؤسسة';
  static const String phoneRequired = 'يرجى إدخال رقم الجوال';
  static const String passwordsDoNotMatch = 'كلمتا المرور غير متطابقتين';

  // Forgot Password Dialog
  static const String resetPasswordTitle = 'استعادة كلمة المرور';
  static const String resetPasswordDesc = 'أدخل بريدك الإلكتروني المسجل وسنرسل لك رابطاً آمناً لإعادة تعيين كلمة المرور.';
  static const String sendResetLink = 'إرسال رابط التعيين';
  static const String cancel = 'إلغاء';
  static const String resetLinkSent = 'تم إرسال رابط استعادة كلمة المرور إلى بريدك الإلكتروني بنجاح.';

  // Login Messages
  static const String loginSuccess = 'تم تسجيل الدخول بنجاح! مرحباً بك.';
  static const String signupSuccess = 'تم إنشاء الحساب المؤسسي بنجاح!';
  static const String loginError = 'بيانات الاعتماد غير صحيحة، يرجى التحقق وإعادة المحاولة.';

  // Dashboard Strings
  static const String dashboardTitle = 'لوحة المؤشرات المالية';
  static const String totalRevenue = 'إجمالي الإيرادات';
  static const String totalExpenses = 'إجمالي المصروفات';
  static const String netProfit = 'صافي الأرباح';
  static const String pendingInvoices = 'الفواتير المعلقة';
  static const String quickActions = 'الإجراءات السريعة';
  static const String addInvoice = 'إضافة فاتورة';
  static const String financialReports = 'التقارير المالية';
  static const String clientsList = 'العملاء والموردون';
  static const String settings = 'إعدادات النظام';
  static const String recentTransactions = 'آخر المعاملات المالية';
  static const String logout = 'تسجيل الخروج';
  static const String viewAll = 'عرض الكل';
}
