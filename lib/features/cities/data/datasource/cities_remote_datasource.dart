import 'package:dio/dio.dart';
import 'package:ibiapabaapp/core/network/dio_error_to_exception_mapper.dart';
import 'package:ibiapabaapp/features/cities/data/parsers/city_parser.dart';
import 'package:ibiapabaapp/features/cities/domain/entities/city.dart';

abstract class CitiesRemoteDatasource {
  Future<List<City>> getAllCities();
}

class CitiesRemoteDatasourceImpl implements CitiesRemoteDatasource {
  final Dio dio;
  CitiesRemoteDatasourceImpl(this.dio);

  @override
  Future<List<City>> getAllCities() async {
    try {
      final response = await dio.get('/cities');
      return CityParser.fromJsonList(response.data);
    } on DioException catch (e) {
      throw DioErrorToExceptionMapper.map(e);
    }
  }
}
