import 'package:dartz/dartz.dart';
import 'package:ibiapabaapp/core/errors/exceptions/exceptions.dart';
import 'package:ibiapabaapp/core/errors/failures/failures.dart';
import 'package:ibiapabaapp/core/logger/log_tags.dart';
import 'package:ibiapabaapp/core/logger/logger.dart';
import 'package:ibiapabaapp/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ibiapabaapp/features/auth/data/mappers/auth_exception_to_failure_mapper.dart';
import 'package:ibiapabaapp/features/auth/domain/entities/register_form_data.dart';
import 'package:ibiapabaapp/features/auth/domain/entities/auth_result.dart';
import 'package:ibiapabaapp/features/auth/domain/entities/check_availability.dart';
import 'package:ibiapabaapp/features/auth/domain/entities/user.dart';
import 'package:ibiapabaapp/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource datasource;
  AuthRepositoryImpl(this.datasource);

  Failure _handleError(dynamic e, StackTrace stack, String tag) {
    final code = e is AppException ? e.code : null;
    logger.e(
      '${LogTags.repository}${LogTags.auth}$tag',
      error: {
        'exception': e.runtimeType.toString(),
        'code': code,
        'message': e.toString(),
      },
      stackTrace: stack,
    );
    return AuthExceptionToFailureMapper.map(e);
  }

  @override
  Future<Either<Failure, AuthResult>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await datasource.login(email: email, password: password);
      return Right(result);
    } catch (e, stack) {
      return Left(_handleError(e, stack, LogTags.login));
    }
  }

  @override
  Future<Either<Failure, AuthResult>> register({
    required RegisterFormData registerFormData,
  }) async {
    try {
      final result = await datasource.register(
        registerFormData: registerFormData,
      );
      return Right(result);
    } catch (e, stack) {
      return Left(_handleError(e, stack, LogTags.register));
    }
  }

  @override
  Future<Either<Failure, CheckAvailability>> checkAvailability({
    required AvailabilityField field,
    required String value,
  }) async {
    try {
      final result = await datasource.checkAvailability(
        field: field.value,
        value: value,
      );
      return Right(result);
    } catch (e, stack) {
      return Left(_handleError(e, stack, LogTags.checkAvailability));
    }
  }

  @override
  Future<Either<Failure, User>> getMe() async {
    try {
      final result = await datasource.getMe();
      return Right(result);
    } catch (e, stack) {
      return Left(_handleError(e, stack, LogTags.getMe));
    }
  }

  @override
  Future<Either<Failure, AuthResult>> refreshTokens() async {
    try {
      final result = await datasource.refreshTokens();
      return Right(result);
    } catch (e, stack) {
      return Left(_handleError(e, stack, LogTags.refresh));
    }
  }
}
