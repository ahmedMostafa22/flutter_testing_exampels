import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:login_example_testing/login_screen.dart';

void main() {
  group('Login Flow', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets(
        'Show home screen if user entered valid email & pass then tapped the login button',
        (tester) async {
      //Arrange
      await tester.pumpWidget(MaterialApp(
          title: 'Login Example',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoginScreen()));

      //Act
      Finder emailField = find.byKey(const Key('email_tf'));
      Finder passwordField = find.byKey(const Key('password_tf'));

      await tester.enterText(emailField, 'ahmedmetwalymostafa@gmail.com');
      await tester.enterText(passwordField, 'StrongPassword');
      await Future.delayed(const Duration(seconds: 3));

      Finder btn = find.byType(ElevatedButton);

      await tester.tap(btn);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      Finder welcomeHomeText = find.byKey(const Key('welcome_home'));

      //Assert
      expect(welcomeHomeText, findsOneWidget);
    });

    testWidgets(
        'Don\'t navigate to home screen if password and email are invalid',
        (tester) async {
      //Arrange
      await tester.pumpWidget(MaterialApp(
          title: 'Login Example',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoginScreen()));

      //Act
      Finder emailField = find.byKey(const Key('email_tf'));
      Finder passwordField = find.byKey(const Key('password_tf'));

      await tester.enterText(emailField, 'invalid mail');
      await tester.enterText(passwordField, 'shorpass');
      await Future.delayed(const Duration(seconds: 3));
      Finder btn = find.byType(ElevatedButton);

      await tester.tap(btn);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      Finder welcomeHomeText = find.byKey(const Key('welcome_home'));
      Finder emptyEmailWarningText = find.text('Incorrect email format');
      Finder emptyPasswordWarningText =
          find.text('Password can\'t be less than 9 characters');
      //Assert
      expect(welcomeHomeText, findsNothing);
      expect(emptyEmailWarningText, findsOneWidget);
      expect(emptyPasswordWarningText, findsOneWidget);
    });
  });
}
