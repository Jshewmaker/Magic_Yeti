import 'dart:async';

import 'package:firebase_authentication_client/src/lock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Lock', () {
    test('initial lock state is unlocked', () {
      final lock = Lock();
      expect(lock.isLocked, isFalse);
    });

    test('run returns the result', () async {
      final lock = Lock();
      final completer = Completer<int>();
      const result = 42;

      expect(lock.isLocked, isFalse);
      final future = lock.run(() => completer.future);
      expect(lock.isLocked, isTrue);

      completer.complete(result);

      await expectLater(future, completion(equals(result)));

      expect(lock.isLocked, isFalse);
    });

    test('lock state is set to locked until run has completed', () async {
      final lock = Lock();
      final completer = Completer<void>();

      expect(lock.isLocked, isFalse);
      final future = lock.run(() => completer.future);
      expect(lock.isLocked, isTrue);

      completer.complete();

      await future;

      expect(lock.isLocked, isFalse);
    });

    test('lock is released if an exception occurs', () async {
      final lock = Lock();
      final completer = Completer<void>();
      final exception = Exception('oops');

      expect(lock.isLocked, isFalse);
      final future = lock.run(() => completer.future);
      expect(lock.isLocked, isTrue);

      completer.completeError(exception);

      await expectLater(() => future, throwsA(exception));

      expect(lock.isLocked, isFalse);
    });

    test('multiple runs run sequentially', () async {
      final lock = Lock();
      final completer1 = Completer<void>();
      final completer2 = Completer<void>();

      expect(lock.isLocked, isFalse);

      final future1 = lock.run(() => completer1.future);
      final future2 = lock.run(() => completer2.future);

      expect(lock.isLocked, isTrue);

      completer1.complete();

      await future1;

      expect(completer1.isCompleted, isTrue);
      expect(completer2.isCompleted, isFalse);
      expect(lock.isLocked, isFalse);

      completer2.complete();

      await future2;

      expect(completer1.isCompleted, isTrue);
      expect(completer2.isCompleted, isTrue);
      expect(lock.isLocked, isFalse);
    });
  });
}
