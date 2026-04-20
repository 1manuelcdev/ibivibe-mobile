import 'package:flutter/material.dart';
import 'package:ibiapabaapp/features/auth/domain/entities/account.dart';
import 'package:ibiapabaapp/features/cities/domain/entities/city.dart';
import 'package:ibiapabaapp/features/businesses/domain/entities/business.dart';
import 'package:ibiapabaapp/features/profiles/domain/entities/profile.dart';
import 'package:latlong2/latlong.dart';

class AppSession {
  final Account? account;
  final Profile? activeProfile;
  final List<Profile> accountProfiles;

  final City? currentCity;
  final LatLng? devicePosition;
  final List<String> recentSearches;

  final ThemeMode themeMode;
  final bool needsOnboarding;

  const AppSession({
    this.account,
    this.activeProfile,
    this.accountProfiles = const [],
    this.currentCity,
    this.devicePosition,
    this.recentSearches = const [],
    this.themeMode = ThemeMode.system,
    this.needsOnboarding = true,
  });

  bool get isAuthenticated => activeProfile != null;
  bool get isPersonal => activeProfile?.type == ProfileType.personal;

  BusinessRole? get currentBusinessRole => activeProfile?.businessRole;
  Business? get activeBusiness => activeProfile?.business;

  AppSession copyWith({
    Account? account,
    Profile? activeProfile,
    bool clearActiveProfile = false,
    List<Profile>? accountProfiles,
    City? currentCity,
    bool clearCity = false,
    LatLng? devicePosition,
    bool clearDevicePosition = false,
    List<String>? recentSearches,
    ThemeMode? themeMode,
    bool? needsOnboarding,
  }) {
    return AppSession(
      account: account ?? this.account,
      activeProfile: clearActiveProfile
          ? null
          : (activeProfile ?? this.activeProfile),
      accountProfiles: accountProfiles ?? this.accountProfiles,
      currentCity: clearCity ? null : (currentCity ?? this.currentCity),
      devicePosition: clearDevicePosition
          ? null
          : (devicePosition ?? this.devicePosition),
      recentSearches: recentSearches ?? this.recentSearches,
      themeMode: themeMode ?? this.themeMode,
      needsOnboarding: needsOnboarding ?? this.needsOnboarding,
    );
  }
}
