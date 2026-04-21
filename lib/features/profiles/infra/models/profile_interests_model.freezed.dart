// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_interests_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileInterestsModel {

@JsonKey(name: 'businesses') List<InterestModel> get businesses;@JsonKey(name: 'events') List<InterestModel> get events;
/// Create a copy of ProfileInterestsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileInterestsModelCopyWith<ProfileInterestsModel> get copyWith => _$ProfileInterestsModelCopyWithImpl<ProfileInterestsModel>(this as ProfileInterestsModel, _$identity);

  /// Serializes this ProfileInterestsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileInterestsModel&&const DeepCollectionEquality().equals(other.businesses, businesses)&&const DeepCollectionEquality().equals(other.events, events));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(businesses),const DeepCollectionEquality().hash(events));

@override
String toString() {
  return 'ProfileInterestsModel(businesses: $businesses, events: $events)';
}


}

/// @nodoc
abstract mixin class $ProfileInterestsModelCopyWith<$Res>  {
  factory $ProfileInterestsModelCopyWith(ProfileInterestsModel value, $Res Function(ProfileInterestsModel) _then) = _$ProfileInterestsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'businesses') List<InterestModel> businesses,@JsonKey(name: 'events') List<InterestModel> events
});




}
/// @nodoc
class _$ProfileInterestsModelCopyWithImpl<$Res>
    implements $ProfileInterestsModelCopyWith<$Res> {
  _$ProfileInterestsModelCopyWithImpl(this._self, this._then);

  final ProfileInterestsModel _self;
  final $Res Function(ProfileInterestsModel) _then;

/// Create a copy of ProfileInterestsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? businesses = null,Object? events = null,}) {
  return _then(_self.copyWith(
businesses: null == businesses ? _self.businesses : businesses // ignore: cast_nullable_to_non_nullable
as List<InterestModel>,events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<InterestModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileInterestsModel].
extension ProfileInterestsModelPatterns on ProfileInterestsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileInterestsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileInterestsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileInterestsModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileInterestsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileInterestsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileInterestsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'businesses')  List<InterestModel> businesses, @JsonKey(name: 'events')  List<InterestModel> events)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileInterestsModel() when $default != null:
return $default(_that.businesses,_that.events);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'businesses')  List<InterestModel> businesses, @JsonKey(name: 'events')  List<InterestModel> events)  $default,) {final _that = this;
switch (_that) {
case _ProfileInterestsModel():
return $default(_that.businesses,_that.events);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'businesses')  List<InterestModel> businesses, @JsonKey(name: 'events')  List<InterestModel> events)?  $default,) {final _that = this;
switch (_that) {
case _ProfileInterestsModel() when $default != null:
return $default(_that.businesses,_that.events);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileInterestsModel extends ProfileInterestsModel {
  const _ProfileInterestsModel({@JsonKey(name: 'businesses') final  List<InterestModel> businesses = const [], @JsonKey(name: 'events') final  List<InterestModel> events = const []}): _businesses = businesses,_events = events,super._();
  factory _ProfileInterestsModel.fromJson(Map<String, dynamic> json) => _$ProfileInterestsModelFromJson(json);

 final  List<InterestModel> _businesses;
@override@JsonKey(name: 'businesses') List<InterestModel> get businesses {
  if (_businesses is EqualUnmodifiableListView) return _businesses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_businesses);
}

 final  List<InterestModel> _events;
@override@JsonKey(name: 'events') List<InterestModel> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}


/// Create a copy of ProfileInterestsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileInterestsModelCopyWith<_ProfileInterestsModel> get copyWith => __$ProfileInterestsModelCopyWithImpl<_ProfileInterestsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileInterestsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileInterestsModel&&const DeepCollectionEquality().equals(other._businesses, _businesses)&&const DeepCollectionEquality().equals(other._events, _events));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_businesses),const DeepCollectionEquality().hash(_events));

@override
String toString() {
  return 'ProfileInterestsModel(businesses: $businesses, events: $events)';
}


}

/// @nodoc
abstract mixin class _$ProfileInterestsModelCopyWith<$Res> implements $ProfileInterestsModelCopyWith<$Res> {
  factory _$ProfileInterestsModelCopyWith(_ProfileInterestsModel value, $Res Function(_ProfileInterestsModel) _then) = __$ProfileInterestsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'businesses') List<InterestModel> businesses,@JsonKey(name: 'events') List<InterestModel> events
});




}
/// @nodoc
class __$ProfileInterestsModelCopyWithImpl<$Res>
    implements _$ProfileInterestsModelCopyWith<$Res> {
  __$ProfileInterestsModelCopyWithImpl(this._self, this._then);

  final _ProfileInterestsModel _self;
  final $Res Function(_ProfileInterestsModel) _then;

/// Create a copy of ProfileInterestsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? businesses = null,Object? events = null,}) {
  return _then(_ProfileInterestsModel(
businesses: null == businesses ? _self._businesses : businesses // ignore: cast_nullable_to_non_nullable
as List<InterestModel>,events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<InterestModel>,
  ));
}


}

// dart format on
