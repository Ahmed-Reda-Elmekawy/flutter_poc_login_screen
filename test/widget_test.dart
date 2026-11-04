import 'package:flutter_test/flutter_test.dart';
import 'package:login_screen/core/constants/app_strings.dart';
import 'package:login_screen/main.dart';

void main() {
  testWidgets('Login screen smoke test - renders all essential UI elements', (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(const AccountingLoginApp());
    await tester.pumpAndSettle();

    // Verify App Name and Brand Badge
    expect(find.text(AppStrings.appName), findsOneWidget);
    expect(find.text(AppStrings.appBadge), findsOneWidget);

    // Verify Email and Password Fields
    expect(find.text(AppStrings.emailLabel), findsOneWidget);
    expect(find.text(AppStrings.passwordLabel), findsOneWidget);

    // Verify Login Button
    expect(find.text(AppStrings.loginButton), findsOneWidget);

    // Verify Options
    expect(find.text(AppStrings.rememberMe), findsOneWidget);
    expect(find.text(AppStrings.forgotPassword), findsOneWidget);

    // Verify Password Toggle functionality
    final toggleButton = find.byTooltip('إظهار كلمة المرور');
    expect(toggleButton, findsOneWidget);

    await tester.ensureVisible(toggleButton);
    await tester.tap(toggleButton, warnIfMissed: false);
    await tester.pumpAndSettle();

    expect(find.byTooltip('إخفاء كلمة المرور'), findsOneWidget);
  });

  testWidgets('Validation errors appear on empty submission', (WidgetTester tester) async {
    await tester.pumpWidget(const AccountingLoginApp());
    await tester.pumpAndSettle();

    final loginBtn = find.text(AppStrings.loginButton);
    await tester.ensureVisible(loginBtn);
    await tester.tap(loginBtn);
    await tester.pumpAndSettle();

    // Verify validation error messages are displayed
    expect(find.text(AppStrings.emailRequired), findsOneWidget);
    expect(find.text(AppStrings.passwordRequired), findsOneWidget);
  });

  testWidgets('Forgot password sheet opens when link is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(const AccountingLoginApp());
    await tester.pumpAndSettle();

    final forgotPasswordLink = find.text(AppStrings.forgotPassword);
    await tester.ensureVisible(forgotPasswordLink);
    await tester.tap(forgotPasswordLink);
    await tester.pumpAndSettle();

    expect(find.text(AppStrings.resetPasswordTitle), findsOneWidget);
    expect(find.text(AppStrings.sendResetLink), findsOneWidget);
  });
}
