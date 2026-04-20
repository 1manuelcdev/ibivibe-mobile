import 'package:ibiapabaapp/core/cache/base_cache_storage.dart';

class LocationLocalStorage extends BaseCacheStorage {
  LocationLocalStorage(super.cacheDatabaseService);

  @override
  String get storeName => 'location';

  Future<void> saveCurrentCityId(String cityId) async {
    saveObject(
      key: 'current_city_id',
      item: cityId,
      toMap: (i) => {'value': i},
    );
  }

  Future<void> clearCurrentCity() async {
    clearKey('current_city_id');
  }

  Future<String?> getCurrentCityId() async {
    return getObject(key: 'current_city_id', fromJson: (json) => json['value']);
  }
}
