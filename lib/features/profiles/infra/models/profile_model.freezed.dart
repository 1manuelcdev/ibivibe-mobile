// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileModel {

 String get id; String get slug;@JsonKey(name: 'display_name') String get displayName; String get bio;@JsonKey(name: 'avatar_url') String get avatarUrl; ProfileType get type;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(fromJson: _profileInterestsFromJson, toJson: _profileInterestsToJson) ProfileInterests? get interests; ProfileBusinessModel? get business;@JsonKey(name: 'role', defaultValue: null) BusinessRole? get businessRole;
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<ProfileModel> get copyWith => _$ProfileModelCopyWithImpl<ProfileModel>(this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.interests, interests) || other.interests == interests)&&(identical(other.business, business) || other.business == business)&&(identical(other.businessRole, businessRole) || other.businessRole == businessRole));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,displayName,bio,avatarUrl,type,createdAt,updatedAt,interests,business,businessRole);

@override
String toString() {
  return 'ProfileModel(id: $id, slug: $slug, displayName: $displayName, bio: $bio, avatarUrl: $avatarUrl, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, interests: $interests, business: $business, businessRole: $businessRole)';
}


}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res>  {
  factory $ProfileModelCopyWith(ProfileModel value, $Res Function(ProfileModel) _then) = _$ProfileModelCopyWithImpl;
@useResult
$Res call({
 String id, String slug,@JsonKey(name: 'display_name') String displayName, String bio,@JsonKey(name: 'avatar_url') String avatarUrl, ProfileType type,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(fromJson: _profileInterestsFromJson, toJson: _profileInterestsToJson) ProfileInterests? interests, ProfileBusinessModel? business,@JsonKey(name: 'role', defaultValue: null) BusinessRole? businessRole
});


$ProfileBusinessModelCopyWith<$Res>? get business;

}
/// @nodoc
class _$ProfileModelCopyWithImpl<$Res>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? displayName = null,Object? bio = null,Object? avatarUrl = null,Object? type = null,Object? createdAt = null,Object? updatedAt = null,Object? interests = freezed,Object? business = freezed,Object? businessRole = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProfileType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,interests: freezed == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as ProfileInterests?,business: freezed == business ? _self.business : business // ignore: cast_nullable_to_non_nullable
as ProfileBusinessModel?,businessRole: freezed == businessRole ? _self.businessRole : businessRole // ignore: cast_nullable_to_non_nullable
as BusinessRole?,
  ));
}
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileBusinessModelCopyWith<$Res>? get business {
    if (_self.business == null) {
    return null;
  }

  return $ProfileBusinessModelCopyWith<$Res>(_self.business!, (value) {
    return _then(_self.copyWith(business: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug, @JsonKey(name: 'display_name')  String displayName,  String bio, @JsonKey(name: 'avatar_url')  String avatarUrl,  ProfileType type, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(fromJson: _profileInterestsFromJson, toJson: _profileInterestsToJson)  ProfileInterests? interests,  ProfileBusinessModel? business, @JsonKey(name: 'role', defaultValue: null)  BusinessRole? businessRole)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.id,_that.slug,_that.displayName,_that.bio,_that.avatarUrl,_that.type,_that.createdAt,_that.updatedAt,_that.interests,_that.business,_that.businessRole);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug, @JsonKey(name: 'display_name')  String displayName,  String bio, @JsonKey(name: 'avatar_url')  String avatarUrl,  ProfileType type, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(fromJson: _profileInterestsFromJson, toJson: _profileInterestsToJson)  ProfileInterests? interests,  ProfileBusinessModel? business, @JsonKey(name: 'role', defaultValue: null)  BusinessRole? businessRole)  $default,) {final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that.id,_that.slug,_that.displayName,_that.bio,_that.avatarUrl,_that.type,_that.createdAt,_that.updatedAt,_that.interests,_that.business,_that.businessRole);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug, @JsonKey(name: 'display_name')  String displayName,  String bio, @JsonKey(name: 'avatar_url')  String avatarUrl,  ProfileType type, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(fromJson: _profileInterestsFromJson, toJson: _profileInterestsToJson)  ProfileInterests? interests,  ProfileBusinessModel? business, @JsonKey(name: 'role', defaultValue: null)  BusinessRole? businessRole)?  $default,) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.id,_that.slug,_that.displayName,_that.bio,_that.avatarUrl,_that.type,_that.createdAt,_that.updatedAt,_that.interests,_that.business,_that.businessRole);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileModel extends ProfileModel {
  const _ProfileModel({this.id = '', this.slug = '', @JsonKey(name: 'display_name') required this.displayName, this.bio = '', @JsonKey(name: 'avatar_url') this.avatarUrl = '', required this.type, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(fromJson: _profileInterestsFromJson, toJson: _profileInterestsToJson) this.interests, this.business, @JsonKey(name: 'role', defaultValue: null) this.businessRole}): super._();
  factory _ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String slug;
@override@JsonKey(name: 'display_name') final  String displayName;
@override@JsonKey() final  String bio;
@override@JsonKey(name: 'avatar_url') final  String avatarUrl;
@override final  ProfileType type;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(fromJson: _profileInterestsFromJson, toJson: _profileInterestsToJson) final  ProfileInterests? interests;
@override final  ProfileBusinessModel? business;
@override@JsonKey(name: 'role', defaultValue: null) final  BusinessRole? businessRole;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileModelCopyWith<_ProfileModel> get copyWith => __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.interests, interests) || other.interests == interests)&&(identical(other.business, business) || other.business == business)&&(identical(other.businessRole, businessRole) || other.businessRole == businessRole));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,displayName,bio,avatarUrl,type,createdAt,updatedAt,interests,business,businessRole);

@override
String toString() {
  return 'ProfileModel(id: $id, slug: $slug, displayName: $displayName, bio: $bio, avatarUrl: $avatarUrl, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, interests: $interests, business: $business, businessRole: $businessRole)';
}


}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res> implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(_ProfileModel value, $Res Function(_ProfileModel) _then) = __$ProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug,@JsonKey(name: 'display_name') String displayName, String bio,@JsonKey(name: 'avatar_url') String avatarUrl, ProfileType type,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(fromJson: _profileInterestsFromJson, toJson: _profileInterestsToJson) ProfileInterests? interests, ProfileBusinessModel? business,@JsonKey(name: 'role', defaultValue: null) BusinessRole? businessRole
});


@override $ProfileBusinessModelCopyWith<$Res>? get business;

}
/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? displayName = null,Object? bio = null,Object? avatarUrl = null,Object? type = null,Object? createdAt = null,Object? updatedAt = null,Object? interests = freezed,Object? business = freezed,Object? businessRole = freezed,}) {
  return _then(_ProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProfileType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,interests: freezed == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as ProfileInterests?,business: freezed == business ? _self.business : business // ignore: cast_nullable_to_non_nullable
as ProfileBusinessModel?,businessRole: freezed == businessRole ? _self.businessRole : businessRole // ignore: cast_nullable_to_non_nullable
as BusinessRole?,
  ));
}

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileBusinessModelCopyWith<$Res>? get business {
    if (_self.business == null) {
    return null;
  }

  return $ProfileBusinessModelCopyWith<$Res>(_self.business!, (value) {
    return _then(_self.copyWith(business: value));
  });
}
}

// dart format on
