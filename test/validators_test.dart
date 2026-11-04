import 'package:flutter_test/flutter_test.dart';
import 'package:login_screen/core/constants/app_strings.dart';
import 'package:login_screen/core/utils/validators.dart';

void main() {
  group('Validators Test Suite', () {
    test('Email validation tests', () {
      expect(Validators.validateEmail(null), AppStrings.emailRequired);
      expect(Validators.validateEmail(''), AppStrings.emailRequired);
      expect(Validators.validateEmail('   '), AppStrings.emailRequired);
      expect(Validators.validateEmail('not-an-email'), AppStrings.emailInvalid);
      expect(Validators.validateEmail('user@domain'), AppStrings.emailInvalid);
      expect(Validators.validateEmail('user@domain.com'), isNull);
      expect(Validators.validateEmail('john.doe@company.org'), isNull);
    });

    test('Password validation tests', () {
      expect(Validators.validatePassword(null), AppStrings.passwordRequired);
      expect(Validators.validatePassword(''), AppStrings.passwordRequired);
      expect(Validators.validatePassword('12345'), AppStrings.passwordTooShort);
      expect(Validators.validatePassword('123456'), isNull);
      expect(Validators.validatePassword('ComplexPass#2026'), isNull);
    });
  });
}
