// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:scryfall_repository/scryfall_repository.dart';

void main() {
  group('ScryfallRepository', () {
    test('can be instantiated', () {
      expect(ScryfallRepository(), isNotNull);
    });
  });
}
