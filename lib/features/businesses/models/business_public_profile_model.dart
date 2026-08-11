import 'package:equatable/equatable.dart';

class BusinessPublicProfileModel extends Equatable {
  final String id;
  final String name;
  final String commercialName;
  final String? bio;
  final String? description;
  final String? avatarUrl;
  final bool isVerified;
  final List<String> tags;
  final Map<String, bool> facilities;
  final BusinessContactModel? contact;
  final List<BusinessLocationModel> locations;
  final List<BusinessHourModel> hours;
  final List<BusinessServiceModel> services;
  final List<BusinessMediaModel> media;
  final BusinessReviewsModel reviews;
  final List<BusinessEventModel> events;

  const BusinessPublicProfileModel({
    required this.id,
    required this.name,
    required this.commercialName,
    this.bio,
    this.description,
    this.avatarUrl,
    this.isVerified = false,
    this.tags = const [],
    this.facilities = const {},
    this.contact,
    this.locations = const [],
    this.hours = const [],
    this.services = const [],
    this.media = const [],
    this.reviews = const BusinessReviewsModel(),
    this.events = const [],
  });

  factory BusinessPublicProfileModel.fromJson(Map<String, dynamic> json) {
    final contact = json['contact'];
    return BusinessPublicProfileModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      commercialName:
          json['commercial_name'] as String? ?? json['name'] as String? ?? '',
      bio: json['bio'] as String?,
      description: json['description'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      isVerified: json['is_verified'] as bool? ?? false,
      tags: _strings(json['tags']),
      facilities: _booleans(json['facilities']),
      contact: contact is Map<String, dynamic>
          ? BusinessContactModel.fromJson(contact)
          : null,
      locations: _maps(
        json['locations'],
      ).map(BusinessLocationModel.fromJson).toList(),
      hours: _maps(json['hours']).map(BusinessHourModel.fromJson).toList(),
      services: _maps(
        json['services'],
      ).map(BusinessServiceModel.fromJson).toList(),
      media: _maps(json['media']).map(BusinessMediaModel.fromJson).toList(),
      reviews: BusinessReviewsModel.fromJson(json['reviews']),
      events: _maps(json['events']).map(BusinessEventModel.fromJson).toList(),
    );
  }

  static List<Map<String, dynamic>> _maps(dynamic value) => value is List
      ? value
            .whereType<Map>()
            .map((item) => Map<String, dynamic>.from(item))
            .toList()
      : const [];

  static List<String> _strings(dynamic value) =>
      value is List ? value.whereType<String>().toList() : const [];

  static Map<String, bool> _booleans(dynamic value) => value is Map
      ? value.map((key, item) => MapEntry(key.toString(), item == true))
      : const {};

  @override
  List<Object?> get props => [
    id,
    name,
    commercialName,
    bio,
    description,
    avatarUrl,
    isVerified,
    tags,
    facilities,
    contact,
    locations,
    hours,
    services,
    media,
    reviews,
    events,
  ];
}

class BusinessContactModel extends Equatable {
  final String? phone;
  final String? whatsapp;
  final String? publicEmail;
  final String? website;
  final String? instagram;
  final String? facebook;

  const BusinessContactModel({
    this.phone,
    this.whatsapp,
    this.publicEmail,
    this.website,
    this.instagram,
    this.facebook,
  });

  factory BusinessContactModel.fromJson(Map<String, dynamic> json) =>
      BusinessContactModel(
        phone: json['phone'] as String?,
        whatsapp: json['whatsapp'] as String?,
        publicEmail: json['public_email'] as String?,
        website: json['website'] as String?,
        instagram: json['instagram'] as String?,
        facebook: json['facebook'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'whatsapp': whatsapp,
    'public_email': publicEmail,
    'website': website,
    'instagram': instagram,
    'facebook': facebook,
  };

  @override
  List<Object?> get props => [
    phone,
    whatsapp,
    publicEmail,
    website,
    instagram,
    facebook,
  ];
}

class BusinessLocationModel extends Equatable {
  final String id;
  final String cityId;
  final String cityName;
  final bool isHeadquarter;
  final String? address;
  final String? neighborhood;
  final String? postalCode;
  final double? latitude;
  final double? longitude;
  final String? mapUrl;

  const BusinessLocationModel({
    required this.id,
    required this.cityId,
    required this.cityName,
    required this.isHeadquarter,
    this.address,
    this.neighborhood,
    this.postalCode,
    this.latitude,
    this.longitude,
    this.mapUrl,
  });

  factory BusinessLocationModel.fromJson(Map<String, dynamic> json) {
    final city = json['city'];
    final cityMap = city is Map
        ? Map<String, dynamic>.from(city)
        : const <String, dynamic>{};
    return BusinessLocationModel(
      id: json['id'] as String? ?? '',
      cityId: json['city_id'] as String? ?? cityMap['id'] as String? ?? '',
      cityName:
          json['city_name'] as String? ?? cityMap['name'] as String? ?? '',
      isHeadquarter: json['is_headquarter'] as bool? ?? false,
      address:
          json['address'] as String? ?? json['address_specific'] as String?,
      neighborhood: json['neighborhood'] as String?,
      postalCode: json['postal_code'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      mapUrl: json['map_url'] as String?,
    );
  }

  @override
  List<Object?> get props => [
    id,
    cityId,
    cityName,
    isHeadquarter,
    address,
    neighborhood,
    postalCode,
    latitude,
    longitude,
    mapUrl,
  ];
}

class BusinessHourModel extends Equatable {
  final String? businessCityId;
  final int weekday;
  final bool isClosed;
  final String? opensAt;
  final String? closesAt;
  final String? breakStart;
  final String? breakEnd;

  const BusinessHourModel({
    this.businessCityId,
    required this.weekday,
    required this.isClosed,
    this.opensAt,
    this.closesAt,
    this.breakStart,
    this.breakEnd,
  });

  factory BusinessHourModel.fromJson(Map<String, dynamic> json) =>
      BusinessHourModel(
        businessCityId: json['business_city_id'] as String?,
        weekday: json['weekday'] as int? ?? 0,
        isClosed: json['is_closed'] as bool? ?? false,
        opensAt: json['opens_at'] as String?,
        closesAt: json['closes_at'] as String?,
        breakStart: json['break_start'] as String?,
        breakEnd: json['break_end'] as String?,
      );

  @override
  List<Object?> get props => [
    businessCityId,
    weekday,
    isClosed,
    opensAt,
    closesAt,
    breakStart,
    breakEnd,
  ];
}

class BusinessServiceModel extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String? priceLabel;
  final String? priceFrom;
  final String? priceTo;
  final String? bookingUrl;
  final String? serviceType;
  final bool active;

  const BusinessServiceModel({
    required this.id,
    required this.name,
    this.description,
    this.priceLabel,
    this.priceFrom,
    this.priceTo,
    this.bookingUrl,
    this.serviceType,
    this.active = true,
  });

  factory BusinessServiceModel.fromJson(Map<String, dynamic> json) =>
      BusinessServiceModel(
        id: json['id'] as String? ?? '',
        name: json['name'] as String? ?? '',
        description: json['description'] as String?,
        priceLabel: json['price_label'] as String?,
        priceFrom: _numberAsString(json['price_from']),
        priceTo: _numberAsString(json['price_to']),
        bookingUrl: json['booking_url'] as String?,
        serviceType: json['service_type'] as String?,
        active: json['active'] as bool? ?? true,
      );

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    priceLabel,
    priceFrom,
    priceTo,
    bookingUrl,
    serviceType,
    active,
  ];
}

class BusinessMediaModel extends Equatable {
  final String id;
  final String url;
  final bool isCover;
  final int position;
  final String? altText;
  final String? thumbnailUrl;
  final String? mediaType;

  const BusinessMediaModel({
    required this.id,
    required this.url,
    required this.isCover,
    required this.position,
    this.altText,
    this.thumbnailUrl,
    this.mediaType,
  });

  factory BusinessMediaModel.fromJson(Map<String, dynamic> json) =>
      BusinessMediaModel(
        id: json['id'] as String? ?? '',
        url: json['url'] as String? ?? '',
        isCover: json['is_cover'] as bool? ?? false,
        position: json['position'] as int? ?? 0,
        altText: json['alt_text'] as String?,
        thumbnailUrl: json['thumbnail_url'] as String?,
        mediaType: json['media_type'] as String?,
      );

  @override
  List<Object?> get props => [
    id,
    url,
    isCover,
    position,
    altText,
    thumbnailUrl,
    mediaType,
  ];
}

class BusinessReviewsModel extends Equatable {
  final double averageRating;
  final int totalReviews;

  const BusinessReviewsModel({this.averageRating = 0, this.totalReviews = 0});

  factory BusinessReviewsModel.fromJson(dynamic json) {
    if (json is! Map) return const BusinessReviewsModel();
    final map = Map<String, dynamic>.from(json);
    return BusinessReviewsModel(
      averageRating: (map['average_rating'] as num?)?.toDouble() ?? 0,
      totalReviews: map['total_reviews'] as int? ?? 0,
    );
  }

  @override
  List<Object?> get props => [averageRating, totalReviews];
}

class BusinessEventModel extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String? slug;
  final String? coverImageUrl;
  final DateTime? startDate;
  final DateTime? endDate;

  const BusinessEventModel({
    required this.id,
    required this.name,
    this.description,
    this.slug,
    this.coverImageUrl,
    this.startDate,
    this.endDate,
  });

  factory BusinessEventModel.fromJson(Map<String, dynamic> json) =>
      BusinessEventModel(
        id: json['id'] as String? ?? '',
        name: json['name'] as String? ?? '',
        description: json['description'] as String?,
        slug: json['slug'] as String?,
        coverImageUrl: json['cover_img_url'] as String?,
        startDate: DateTime.tryParse(json['start_date'] as String? ?? ''),
        endDate: DateTime.tryParse(json['end_date'] as String? ?? ''),
      );

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    slug,
    coverImageUrl,
    startDate,
    endDate,
  ];
}

String? _numberAsString(dynamic value) {
  if (value == null) return null;
  return value.toString();
}
