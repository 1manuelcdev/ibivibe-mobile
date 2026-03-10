import 'package:dartz/dartz.dart';
import 'package:ibiapabaapp/core/errors/failures/failures.dart';
import 'package:ibiapabaapp/features/cities/domain/entities/city.dart';
import 'package:ibiapabaapp/features/cities/domain/repositories/cities_repository.dart';

class GetCityById {
  final CitiesRepository repository;
  GetCityById(this.repository);

  Future<Either<Failure, City?>> call(String id) {
    return repository.getCityById(id);
  }
}
