import 'package:flutter/material.dart';
import 'package:ibiapabaapp/features/auth/domain/entities/user.dart';
import 'package:ibiapabaapp/features/cities/domain/entities/city.dart';
import 'package:ibiapabaapp/features/interests/domain/entities/user_interests.dart';
import 'package:latlong2/latlong.dart';

class AppSession {
  final User? user;
  final UserInterests? userInterests;
  final City? currentCity;

  // Null enquanto não resolvida ou se permissão negada
  final LatLng? devicePosition;

  final ThemeMode? themeMode;
  final bool needsOnboarding;

  const AppSession({
    this.user,
    this.userInterests,
    this.currentCity,
    this.devicePosition,
    this.themeMode,
    this.needsOnboarding = false,
  });

  AppSession copyWith({
    User? user,
    UserInterests? userInterests,
    City? currentCity,
    ThemeMode? themeMode,
    LatLng? devicePosition,
    bool clearUser = false,
    bool clearUserInterests = false,
    bool clearCity = false,
    bool clearDevicePosition = false,
    bool? needsOnboarding,
  }) {
    return AppSession(
      user: clearUser ? null : (user ?? this.user),
      userInterests: clearUserInterests
          ? null
          : (userInterests ?? this.userInterests),
      currentCity: clearCity ? null : (currentCity ?? this.currentCity),
      devicePosition: clearDevicePosition
          ? null
          : (devicePosition ?? this.devicePosition),
      themeMode: themeMode ?? this.themeMode,
      needsOnboarding: needsOnboarding ?? this.needsOnboarding,
    );
  }
}
