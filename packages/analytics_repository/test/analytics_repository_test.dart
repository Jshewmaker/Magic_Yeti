import 'package:analytics_repository/analytics_repository.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

void main() {
  group('AnalyticsRepository', () {
    late FirebaseAnalytics firebaseAnalytics;
    late AnalyticsRepository analyticsRepository;

    setUp(() {
      firebaseAnalytics = _MockFirebaseAnalytics();
      analyticsRepository = AnalyticsRepository(firebaseAnalytics);

      when(
        () => firebaseAnalytics.logEvent(
          name: any(named: 'name'),
          parameters: any(named: 'parameters'),
        ),
      ).thenAnswer((_) async {});
    });

    test('creates FirebaseAnalytics instance internally when not injected', () {
      expect(() => analyticsRepository, isNot(throwsException));
    });

    group('track', () {
      test('tracks event successfully', () {
        const event = AnalyticsEvent(
          '_TestEvent',
          properties: <String, String>{'test-key': 'mock-id'},
        );

        analyticsRepository.track(event);

        verify(
          () => firebaseAnalytics.logEvent(
            name: event.name,
            parameters: event.properties,
          ),
        ).called(1);
      });
    });
  });
}
