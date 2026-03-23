import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibiapabaapp/core/errors/failures/failures.dart';
import 'package:ibiapabaapp/core/logger/handlers/controller_log_handler.dart';
import 'package:ibiapabaapp/core/logger/log_tags.dart';
import 'package:ibiapabaapp/core/logger/logger.dart';
import 'package:ibiapabaapp/core/session/app_session_notifier_provider.dart';
import 'package:ibiapabaapp/features/companies/domain/entities/company.dart';
import 'package:ibiapabaapp/features/companies/domain/entities/company_detail_data.dart';
import 'package:ibiapabaapp/features/companies/presentation/providers/companies_providers.dart';
import 'package:ibiapabaapp/features/medias/domain/entity/media.dart';
import 'package:ibiapabaapp/features/medias/presentation/providers/medias_providers.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_detail_controller.g.dart';

@riverpod
class CompanyDetail extends _$CompanyDetail with ControllerLogHandler {
  @override
  Logger get logger => ref.read(loggerProvider);

  @override
  LogFeature get feature => LogFeature.companies;

  @override
  Future<CompanyDetailData?> build(String id) async {
    final user = ref.watch(appSessionProvider.select((s) => s.user));
    if (user == null) return null;

    final results = await Future.wait([
      ref.read(getCompanyByIdProvider).call(id),
      ref
          .read(getEntityMediaProvider)
          .call(entityType: EntityType.company, entityId: id),
    ]);

    final companyResult = results[0] as Either<Failure, Company?>;
    final mediaResult = results[1] as Either<Failure, List<Media>>;

    final company = companyResult.fold(
      (failure) {
        logControllerError(
          action: CompanyAction.getCompanyById,
          failure: failure,
        );
        throw Exception(failure.message);
      },
      (companyData) {
        logControllerSuccess(action: CompanyAction.getCompanyById);
        return companyData;
      },
    );

    if (company == null) return null;

    final media = mediaResult.fold(
      (failure) {
        logControllerError(
          action: CompanyAction.getCompanyMedia,
          failure: failure,
        );
        return <Media>[];
      },
      (media) {
        logControllerSuccess(action: CompanyAction.getCompanyMedia);
        return media;
      },
    );

    return CompanyDetailData(company: company, media: media);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    ref.invalidateSelf();
    await future;
  }
}
