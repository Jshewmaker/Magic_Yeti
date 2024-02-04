// ignore_for_file: prefer_const_constructors
import 'package:firebase_storage/firebase_storage.dart';
import 'package:test/test.dart';

void main() {
  group('FirebaseStorage', () {
    test('can be instantiated', () {
      expect(FirebaseStorage(), isNotNull);
    });
  });
}
