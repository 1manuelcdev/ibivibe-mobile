class Interest {
  const Interest({required this.id, required this.name});

  final String id;
  final String name;

  factory Interest.fromJson(Map<String, dynamic> json) {
    return Interest(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );
  }

  static Map<String, dynamic> toMap(Interest interest) => {
    'id': interest.id,
    'name': interest.name,
  };
}

class ProfileInterests {
  final List<Interest> businesses;
  final List<Interest> events;

  const ProfileInterests({this.businesses = const [], this.events = const []});

  const ProfileInterests.empty() : businesses = const [], events = const [];

  factory ProfileInterests.fromJson(Map<String, dynamic> json) {
    return ProfileInterests(
      businesses:
          (json['businesses'] as List<dynamic>?)
              ?.map((item) => Interest.fromJson(item as Map<String, dynamic>))
              .toList() ??
          const [],
      events:
          (json['events'] as List<dynamic>?)
              ?.map((item) => Interest.fromJson(item as Map<String, dynamic>))
              .toList() ??
          const [],
    );
  }

  static Map<String, dynamic> toMap(ProfileInterests interests) => {
    'businesses': interests.businesses.map((e) => e.id).toList(),
    'events': interests.events.map((e) => e.id).toList(),
  };

  List<String> get interestsIdsList => [
    ...businesses.map((e) => e.id),
    ...events.map((e) => e.id),
  ];

  List<String> get interestsNamesList => [
    ...businesses.map((e) => e.name),
    ...events.map((e) => e.name),
  ];

  Set<String> get interestsIdsSet => {
    ...businesses.map((e) => e.id),
    ...events.map((e) => e.id),
  };
}
