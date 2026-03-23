abstract class LogTag {
  String get tag;
}

enum LogLayer implements LogTag {
  network('[NETWORK]'),
  datasource('[DATASOURCE]'),
  repository('[REPOSITORY]'),
  controller('[CONTROLLER]');

  @override
  final String tag;
  const LogLayer(this.tag);
}

enum LogLib implements LogTag {
  dio('[DIO]'),
  sembast('[SEMBAST]');

  @override
  final String tag;
  const LogLib(this.tag);
}

enum NetworkAction implements LogTag {
  interceptor('[INTERCEPTOR]'),
  request('[REQUEST]'),
  response('[RESPONSE]');

  @override
  final String tag;
  const NetworkAction(this.tag);
}

enum LogStatus implements LogTag {
  success('[SUCCESS]'),
  error('[ERROR]'),
  info('[INFO]');

  @override
  final String tag;
  const LogStatus(this.tag);
}

enum LogFeature implements LogTag {
  auth('[AUTH]'),
  cities('[CITIES]'),
  companies('[COMPANIES]'),
  events('[EVENTS]'),
  medias('[MEDIAS]'),
  session('[SESSION]');

  @override
  final String tag;
  const LogFeature(this.tag);
}

enum AuthAction implements LogTag {
  login('[LOGIN_WITH_EMAIL]'),
  register('[REGISTER_WITH_EMAIL]'),
  refreshTokens('[REFRESH_TOKENS]'),
  getMe('[GET_ME]'),
  checkAvailability('[CHECK_AVAILABILITY]');

  @override
  final String tag;
  const AuthAction(this.tag);
}

enum CityAction implements LogTag {
  getAllCities('[GET_ALL_CITIES]'),
  getCityById('[GET_CITY_BY_ID]'),
  getCityMedia('[GET_CITY_MEDIA]');

  @override
  final String tag;
  const CityAction(this.tag);
}

enum CompanyAction implements LogTag {
  getAllCompanies('[GET_ALL_COMPANIES]'),
  getCompanyById('[GET_COMPANY_BY_ID]'),
  getCompanyMedia('[GET_COMPANY_MEDIA]');

  @override
  final String tag;
  const CompanyAction(this.tag);
}

enum EventAction implements LogTag {
  getAllEvents('[GET_ALL_EVENTS]'),
  getEventById('[GET_EVENT_BY_ID]'),
  getEventMedia('[GET_EVENT_MEDIA]');

  @override
  final String tag;
  const EventAction(this.tag);
}

enum MediaAction implements LogTag {
  getEntityMedia('[GET_ENTITY_MEDIA]');

  @override
  final String tag;
  const MediaAction(this.tag);
}

enum AppSessionAction implements LogTag {
  restore('[RESTORE]'),
  initSession('[INIT_SESSION]'),
  logout('[LOGOUT]'),
  setCurrentCity('[SET_CURRENT_CITY]'),
  clearCurrentCity('[CLEAR_CURRENT_CITY]'),
  detectNearestCity('[DETECT_NEAREST_CITY]'),
  setFavoriteThemeMode('[SET_FAVORITE_THEME_MODE]'),
  resolveDevicePosition('[RESOLVE_DEVICE_POSITION]');

  @override
  final String tag;
  const AppSessionAction(this.tag);
}
