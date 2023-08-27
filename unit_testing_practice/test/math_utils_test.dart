import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing_practice/math_utils.dart';

void main() {
  group('Math Utils', () {
    test('Add Two Numbers', () {
      //Arrange
      int a = 10, b = 5;

      //Act
      int result = add(a, b);

      //Assert
      expect(result, 15);
    });

    test('Subtract Two Numbers', () {
      //Arrange
      int a = 10, b = 5;

      //Act
      int result = subtract(a, b);

      //Assert
      expect(result, 5);
    });

    test('Multiply Two Numbers', () {
      //Arrange
      int a = 10, b = 5;

      //Act
      int result = multiply(a, b);

      //Assert
      expect(result, 50);
    });

    test('Divide Two Numbers', () {
      //Arrange
      double a = 10, b = 5;

      //Act
      double result = divide(a, b);

      //Assert
      expect(result, 2);
    });
  });
}
