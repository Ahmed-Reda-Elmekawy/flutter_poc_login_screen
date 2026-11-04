import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/utils/validators.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/social_login_button.dart';
import '../dashboard/dashboard_screen.dart';
import '../signup/signup_screen.dart';
import 'widgets/forgot_password_sheet.dart';

/// Complete, responsive Login Screen with enhanced UX and navigation.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  bool _obscurePassword = true;
  bool _rememberMe = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _fillDemoCredentials() {
    setState(() {
      _emailController.text = 'accountant@enterprise.com';
      _passwordController.text = 'SecretPass123!';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم إدراج بيانات الحساب التجريبي بنجاح'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _handleLogin() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(milliseconds: 1400));

    if (!mounted) return;

    setState(() => _isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                AppStrings.loginSuccess,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );

    // Navigate to Dashboard Screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => DashboardScreen(userEmail: _emailController.text.trim()),
      ),
    );
  }

  Future<void> _handleBiometricLogin() async {
    FocusScope.of(context).unfocus();
    setState(() => _isLoading = true);

    await Future.delayed(const Duration(milliseconds: 1000));

    if (!mounted) return;
    setState(() => _isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.fingerprint_rounded, color: Colors.white),
            SizedBox(width: 10),
            Text('تم التحقق بالبصمة بنجاح!', style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
        backgroundColor: AppColors.secondary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const DashboardScreen(userEmail: 'biometric.accountant@enterprise.com'),
      ),
    );
  }

  void _openForgotPassword() {
    ForgotPasswordSheet.show(context, initialEmail: _emailController.text.trim());
  }

  void _handleSocialLogin(SocialProvider provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('جاري المصادقة عبر حساب ${provider.name.toUpperCase()}...'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
      ),
    );

    Future.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => DashboardScreen(userEmail: 'sso.user@${provider.name}.com'),
        ),
      );
    });
  }

  void _navigateToSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SignupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isTabletOrDesktop = mediaQuery.size.width >= 640;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: isTabletOrDesktop ? 32 : 20,
              vertical: 24,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isTabletOrDesktop ? 500 : double.infinity,
              ),
              child: isTabletOrDesktop
                  ? Card(
                      elevation: 4,
                      shadowColor: AppColors.shadow.withValues(alpha: 0.12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: AppColors.border, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(36),
                        child: _buildFormContent(),
                      ),
                    )
                  : _buildFormContent(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormContent() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── App Logo & Header ─────────────────────────────────────────
          const AppLogo(size: 74),
          const SizedBox(height: 28),

          // ── Title & Subtitle Card ─────────────────────────────────────
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border, width: 1.2),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.shield_outlined,
                      size: 24,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      AppStrings.loginTitle,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  AppStrings.loginSubtitle,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ── Email Field ───────────────────────────────────────────────
          CustomTextField(
            label: AppStrings.emailLabel,
            hintText: AppStrings.emailHint,
            controller: _emailController,
            focusNode: _emailFocusNode,
            validator: Validators.validateEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            autofillHints: const [AutofillHints.email],
            prefixIcon: const Icon(Icons.mail_outline_rounded, size: 22),
          ),

          const SizedBox(height: 16),

          // ── Password Field ────────────────────────────────────────────
          CustomTextField(
            label: AppStrings.passwordLabel,
            hintText: AppStrings.passwordHint,
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            validator: Validators.validatePassword,
            obscureText: _obscurePassword,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _handleLogin(),
            autofillHints: const [AutofillHints.password],
            prefixIcon: const Icon(Icons.lock_outline_rounded, size: 22),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                size: 22,
                color: AppColors.textSecondary,
              ),
              onPressed: _togglePasswordVisibility,
              tooltip: _obscurePassword ? 'إظهار كلمة المرور' : 'إخفاء كلمة المرور',
            ),
          ),

          const SizedBox(height: 14),

          // ── Options: Remember Me & Forgot Password ────────────────────
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 8,
            children: [
              InkWell(
                onTap: () => setState(() => _rememberMe = !_rememberMe),
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: _rememberMe,
                          activeColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onChanged: (val) =>
                              setState(() => _rememberMe = val ?? false),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        AppStrings.rememberMe,
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: _openForgotPassword,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  AppStrings.forgotPassword,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          // ── Login Button ──────────────────────────────────────────────
          CustomButton(
            text: _isLoading ? AppStrings.loggingIn : AppStrings.loginButton,
            isLoading: _isLoading,
            onPressed: _handleLogin,
            icon: const Icon(Icons.login_rounded, size: 22, color: Colors.white),
          ),

          const SizedBox(height: 12),

          // ── Biometric Quick Login Button ──────────────────────────────
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: AppColors.primary, width: 1.2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              foregroundColor: AppColors.primary,
              backgroundColor: AppColors.primary.withValues(alpha: 0.03),
            ),
            onPressed: _handleBiometricLogin,
            icon: const Icon(Icons.fingerprint_rounded, size: 22),
            label: const Text(
              AppStrings.biometricLogin,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 12),

          // ── Quick Demo Fill ───────────────────────────────────────────
          Center(
            child: TextButton.icon(
              onPressed: _fillDemoCredentials,
              icon: const Icon(
                Icons.flash_on_rounded,
                size: 18,
                color: AppColors.secondary,
              ),
              label: const Text(
                AppStrings.quickDemoFill,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ── Divider ───────────────────────────────────────────────────
          Row(
            children: [
              Expanded(child: Divider(color: AppColors.divider)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  AppStrings.orDivider,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textMuted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(child: Divider(color: AppColors.divider)),
            ],
          ),

          const SizedBox(height: 16),

          // ── Social / SSO Buttons ──────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: SocialLoginButton(
                  provider: SocialProvider.google,
                  label: 'Google',
                  onPressed: () => _handleSocialLogin(SocialProvider.google),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SocialLoginButton(
                  provider: SocialProvider.microsoft,
                  label: 'Microsoft',
                  onPressed: () => _handleSocialLogin(SocialProvider.microsoft),
                ),
              ),
            ],
          ),

          const SizedBox(height: 26),

          // ── Footer ────────────────────────────────────────────────────
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 6,
            runSpacing: 4,
            children: [
              const Text(
                AppStrings.noAccount,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              GestureDetector(
                onTap: _navigateToSignup,
                child: const Text(
                  AppStrings.createAccount,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
