import 'package:ibiapabaapp/features/cities/domain/entities/city.dart';
import 'package:ibiapabaapp/features/medias/domain/entity/media.dart';

class CityDetailData {
  final City city;
  final List<Media> media;
  const CityDetailData({required this.city, required this.media});
}
