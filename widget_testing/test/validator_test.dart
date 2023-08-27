import 'package:flutter_test/flutter_test.dart';
import 'package:login_example_testing/validator.dart';

void main() {
  group('Email Validation', () {
    test('Validate for empty email', () {
      //Arrange
      String input = '';
      //Act
      String? result = Validator.validateEmail(input);

      //Assert
      expect(result, 'Email is required');
    });

    test('Validate incorrect email format', () {
      //Arrange
      String input = 'some incorrect email';
      //Act
      String? result = Validator.validateEmail(input);

      //Assert
      expect(result, 'Incorrect email format');
    });

    test('Validate correct email', () {
      //Arrange
      String input = 'ahmedmetwalymostafa@gmail.com';
      //Act
      String? result = Validator.validateEmail(input);

      //Assert
      expect(result, null);
    });
  });

  group('Password Validation', () {
    test('Validate Empty Password', () {
      //Arrange
      String password = '';

      //Act
      String? result = Validator.validatePassword(password);

      //Assert
      expect(result, 'Password is required');
    });

    test('Validate password less than 9 characters', () {
      //Arrange
      String password = 'weak';

      //Act
      String? result = Validator.validatePassword(password);

      //Assert
      expect(result, 'Password can\'t be less than 9 characters');
    });

    test('Validate valid password', () {
      //Arrange
      String password = 'Strong Password';

      //Act
      String? result = Validator.validatePassword(password);

      //Assert
      expect(result, null);
    });
  });
}
