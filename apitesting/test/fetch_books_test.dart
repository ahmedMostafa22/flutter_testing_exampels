import 'package:apitesting/fetch_books.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'fetch_books_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;

  setUp(() => mockClient = MockClient());

  tearDown(() => mockClient.close());

  group('Fetch Books API', () {
    test('Return List Of Books', () async {
      //Arrange
      when(mockClient.get(Uri.parse(fetchBooksURL))).thenAnswer(
          (realInvocation) async => http.Response(
              '[{"name":"The 5 Second 5 Rule","author":"Mel Robbins"}]', 200));

      //Act & Assert
      expect(await fetchBooks(mockClient), isA<List<BooksListModel>>());
    });

    test('Throw Exception then http api call finishes with an error', () {
      //Arrange
      when(mockClient.get(Uri.parse(fetchBooksURL))).thenAnswer(
          (realInvocation) async => http.Response('NOT FOUND', 404));

      //Act & Assert
      expect(fetchBooks(mockClient), throwsException);
    });
  });
}
