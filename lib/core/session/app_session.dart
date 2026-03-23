import 'package:flutter/material.dart';
import 'package:ibiapabaapp/features/auth/domain/entities/user.dart';
import 'package:ibiapabaapp/features/cities/domain/entities/city.dart';
import 'package:latlong2/latlong.dart';

class AppSession {
  final User? user;
  final City? currentCity;
  final LatLng?
  devicePosition; // Null enquanto não resolvida ou se permissão negada
  // Aberto para novas preferências — adicione aqui depois
  final ThemeMode? themeMode;
  // final Locale locale;

  const AppSession({
    this.user,
    this.currentCity,
    this.devicePosition,
    this.themeMode,
  });

  AppSession copyWith({
    User? user,
    City? currentCity,
    ThemeMode? themeMode,
    LatLng? devicePosition,
    bool clearUser = false,
    bool clearCity = false,
    bool clearDevicePosition = false,
  }) {
    return AppSession(
      user: clearUser ? null : (user ?? this.user),
      currentCity: clearCity ? null : (currentCity ?? this.currentCity),
      devicePosition: clearDevicePosition
          ? null
          : (devicePosition ?? this.devicePosition),
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
