import 'package:ibivibe/core/logger/handlers/controller_log_handler.dart';
import 'package:ibivibe/core/logger/log_tags.dart';
import 'package:ibivibe/core/logger/logger.dart';
import 'package:ibivibe/features/businesses/models/business_detail_data.dart';
import 'package:ibivibe/features/businesses/businesses_logtags.dart';
import 'package:ibivibe/features/businesses/providers/businesses_providers.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'business_detail_viewmodel.g.dart';

@riverpod
class BusinessDetailViewModel extends _$BusinessDetailViewModel
    with ControllerLogHandler {
  @override
  late final Logger logger = ref.read(loggerProvider);

  @override
  LogFeature get feature => LogFeature.businesses;

  @override
  Future<BusinessDetailData?> build(String id) async {
    final repository = ref.read(businessesRepositoryProvider);
    final profile = await repository.getPublicProfile(id);

    if (!ref.mounted) throw Exception('Provider disposed');

    logControllerSuccess(action: BusinessAction.getBusinessById);

    return BusinessDetailData(profile: profile);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    ref.invalidateSelf();
    await future;
  }
}
