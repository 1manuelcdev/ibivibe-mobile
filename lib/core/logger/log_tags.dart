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
  businesses('[COMPANIES]'),
  events('[EVENTS]'),
  medias('[MEDIAS]'),
  session('[SESSION]'),
  categories('[CATEGORIES]'),
  interests('[INTERESTS]'),
  onboarding('[ONBOARDING]'),
  profiles('[PROFILES]'),
  location('[LOCATION]'),
  search('[SEARCH]');

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

enum BusinessAction implements LogTag {
  getAllBusinesses('[GET_ALL_BUSINESSES]'),
  getBusinessById('[GET_BUSINESS_BY_ID]'),
  getBusinessMedia('[GET_BUSINESS_MEDIA]');

  @override
  final String tag;
  const BusinessAction(this.tag);
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
  setNeedsOnboarding('[SET_NEEDS_ONBOARDING]'),
  resolveDevicePosition('[RESOLVE_DEVICE_POSITION]'),
  setUserInterests('[SET_USER_INTERESTS]'),
  switchProfile('[SWITCH_PROFILE]'),
  getAccountProfiles('[GET_ACCOUNT_PROFILES]');

  @override
  final String tag;
  const AppSessionAction(this.tag);
}

enum CategoryAction implements LogTag {
  getParentCategories('[GET_PARENT_CATEGORIES]'),
  getChildrenCategories('[GET_CHILDREN_CATEGORIES]');

  @override
  final String tag;
  const CategoryAction(this.tag);
}

enum InterestAction implements LogTag {
  postUserInterests('[POST_USER_INTERESTS]');

  @override
  final String tag;
  const InterestAction(this.tag);
}

enum UserInterestsAction implements LogTag {
  complete('[USER_INTERESTS_COMPLETE]');

  @override
  final String tag;
  const UserInterestsAction(this.tag);
}

enum CompanyDataAction implements LogTag {
  getCities('[GET_CITIES]'),
  submit('[SUBMIT]');

  @override
  final String tag;
  const CompanyDataAction(this.tag);
}

enum ProfileAction implements LogTag {
  getAccountProfiles('[GET_ACCOUNT_PROFILES]'),
  getProfileInterests('[GET_PROFILE_INTERESTS]'),
  updateProfileInterests('[UPDATE_PROFILE_INTERESTS]');

  @override
  final String tag;
  const ProfileAction(this.tag);
}

enum SearchAction implements LogTag {
  restore('[RESTORE]');

  @override
  final String tag;
  const SearchAction(this.tag);
}
