import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_example_testing/login_screen.dart';

void main() {
  testWidgets('Login have a title', (WidgetTester tester) async {
    //Arrange
    await tester.pumpWidget(MaterialApp(
        title: 'Login Example',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen()));

    //Act
    Finder title = find.byKey(const Key('login_title'));

    //Assert
    expect(title, findsOneWidget);
  });

  testWidgets('Login have an email text field ', (WidgetTester tester) async {
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

    //Assert
    expect(emailField, findsOneWidget);
  });

  testWidgets('Login have a password text field ', (WidgetTester tester) async {
    //Arrange
    await tester.pumpWidget(MaterialApp(
        title: 'Login Example',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen()));

    //Act
    Finder passField = find.byKey(const Key('password_tf'));

    //Assert
    expect(passField, findsOneWidget);
  });

  testWidgets('Login have an button', (WidgetTester tester) async {
    //Arrange
    await tester.pumpWidget(MaterialApp(
        title: 'Login Example',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen()));

    //Act
    Finder btn = find.byType(ElevatedButton);

    //Assert
    expect(btn, findsOneWidget);
  });

  testWidgets('Should show warning for empty email and password fields',
      (WidgetTester tester) async {
    //Arrange
    await tester.pumpWidget(MaterialApp(
        title: 'Login Example',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen()));

    //Act
    Finder btn = find.byType(ElevatedButton);
    await tester.tap(btn);
    await tester.pumpAndSettle();

    Finder emptyEmailWarningText = find.text('Email is required');
    Finder emptyPasswordWarningText = find.text('Password is required');

    //Assert
    expect(emptyEmailWarningText, findsOneWidget);
    expect(emptyPasswordWarningText, findsOneWidget);
  });

  testWidgets('Should show no warning if both fields are satisfied',
      (WidgetTester tester) async {
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

    Finder btn = find.byType(ElevatedButton);

    await tester.tap(btn);
    await tester.pumpAndSettle();

    Finder emptyEmailWarningText = find.text('Email is required');
    Finder emptyEmailWarningText2 = find.text('Incorrect email format');
    Finder emptyPasswordWarningText = find.text('Password is required');
    Finder emptyPasswordWarningText2 =
        find.text('Password can\'t be less than 9 characters');

    expect(emptyEmailWarningText, findsNothing);
    expect(emptyEmailWarningText2, findsNothing);
    expect(emptyPasswordWarningText, findsNothing);
    expect(emptyPasswordWarningText2, findsNothing);
  });
}
