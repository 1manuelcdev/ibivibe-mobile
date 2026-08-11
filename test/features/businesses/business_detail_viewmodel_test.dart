import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibivibe/features/businesses/models/business_detail_data.dart';
import 'package:ibivibe/features/businesses/models/business_public_profile_model.dart';
import 'package:ibivibe/features/businesses/providers/businesses_providers.dart';
import 'package:ibivibe/features/businesses/viewmodels/business_detail_viewmodel.dart';
import 'package:ibivibe/core/logger/logger.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mocks.dart';

void main() {
  late MockBusinessesRepository mockBusinessesRepo;
  late MockLogger mockLogger;

  const testProfile = BusinessPublicProfileModel(
    id: 'b1',
    name: 'Business 1',
    commercialName: 'Business 1',
    bio: 'Descrição curta',
    tags: ['cat1'],
    media: [
      BusinessMediaModel(
        id: 'm1',
        url: 'https://example.com/image.jpg',
        isCover: true,
        position: 0,
      ),
    ],
  );

  setUp(() {
    mockBusinessesRepo = MockBusinessesRepository();
    mockLogger = MockLogger();
  });

  ProviderContainer createContainer() {
    return ProviderContainer(
      overrides: [
        businessesRepositoryProvider.overrideWithValue(mockBusinessesRepo),
        loggerProvider.overrideWithValue(mockLogger),
      ],
    );
  }

  group('business detail controller', () {
    test('build returns the aggregated public profile', () async {
      when(
        () => mockBusinessesRepo.getPublicProfile('b1'),
      ).thenAnswer((_) async => testProfile);

      final container = createContainer();
      final state = await container.read(
        businessDetailViewModelProvider('b1').future,
      );

      expect(state, isA<BusinessDetailData>());
      expect(state!.profile.id, 'b1');
      expect(state.profile.commercialName, 'Business 1');
      expect(state.profile.media, hasLength(1));
      verify(() => mockBusinessesRepo.getPublicProfile('b1')).called(1);

      container.dispose();
    });

    test('build handles a profile without media', () async {
      const profile = BusinessPublicProfileModel(
        id: 'b1',
        name: 'Business 1',
        commercialName: 'Business 1',
      );
      when(
        () => mockBusinessesRepo.getPublicProfile('b1'),
      ).thenAnswer((_) async => profile);

      final container = createContainer();
      final state = await container.read(
        businessDetailViewModelProvider('b1').future,
      );

      expect(state, isNotNull);
      expect(state!.profile.media, isEmpty);

      container.dispose();
    });
  });
}
