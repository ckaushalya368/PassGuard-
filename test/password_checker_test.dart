import 'package:flutter_test/flutter_test.dart';
import 'package:passguard/utils/password_checker.dart';

void main() {

  test('Empty password test', () {
    expect(
      checkPasswordStrength(''),
      'Please enter a password',
    );
  });

  test('Common password test', () {
    expect(
      checkPasswordStrength('Password123!'),
      'Weak',
    );
  });

  test('Medium password test', () {
    expect(
      checkPasswordStrength('Hello123!'),
      'Medium',
    );
  });

  test('Strong password test', () {
    expect(
      checkPasswordStrength('K9#mT2@pL8!x'),
      'Strong',
    );
  });

}