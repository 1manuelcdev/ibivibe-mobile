// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_interests_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountInterestsModel {

@JsonKey(name: 'businesses') List<InterestModel> get businesses;@JsonKey(name: 'events') List<InterestModel> get events;
/// Create a copy of AccountInterestsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountInterestsModelCopyWith<AccountInterestsModel> get copyWith => _$AccountInterestsModelCopyWithImpl<AccountInterestsModel>(this as AccountInterestsModel, _$identity);

  /// Serializes this AccountInterestsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountInterestsModel&&const DeepCollectionEquality().equals(other.businesses, businesses)&&const DeepCollectionEquality().equals(other.events, events));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(businesses),const DeepCollectionEquality().hash(events));

@override
String toString() {
  return 'AccountInterestsModel(businesses: $businesses, events: $events)';
}


}

/// @nodoc
abstract mixin class $AccountInterestsModelCopyWith<$Res>  {
  factory $AccountInterestsModelCopyWith(AccountInterestsModel value, $Res Function(AccountInterestsModel) _then) = _$AccountInterestsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'businesses') List<InterestModel> businesses,@JsonKey(name: 'events') List<InterestModel> events
});




}
/// @nodoc
class _$AccountInterestsModelCopyWithImpl<$Res>
    implements $AccountInterestsModelCopyWith<$Res> {
  _$AccountInterestsModelCopyWithImpl(this._self, this._then);

  final AccountInterestsModel _self;
  final $Res Function(AccountInterestsModel) _then;

/// Create a copy of AccountInterestsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? businesses = null,Object? events = null,}) {
  return _then(_self.copyWith(
businesses: null == businesses ? _self.businesses : businesses // ignore: cast_nullable_to_non_nullable
as List<InterestModel>,events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<InterestModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountInterestsModel].
extension AccountInterestsModelPatterns on AccountInterestsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountInterestsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountInterestsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountInterestsModel value)  $default,){
final _that = this;
switch (_that) {
case _AccountInterestsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountInterestsModel value)?  $default,){
final _that = this;
switch (_that) {
case _AccountInterestsModel() when $default != null:
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
case _AccountInterestsModel() when $default != null:
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
case _AccountInterestsModel():
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
case _AccountInterestsModel() when $default != null:
return $default(_that.businesses,_that.events);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountInterestsModel extends AccountInterestsModel {
  const _AccountInterestsModel({@JsonKey(name: 'businesses') final  List<InterestModel> businesses = const [], @JsonKey(name: 'events') final  List<InterestModel> events = const []}): _businesses = businesses,_events = events,super._();
  factory _AccountInterestsModel.fromJson(Map<String, dynamic> json) => _$AccountInterestsModelFromJson(json);

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


/// Create a copy of AccountInterestsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountInterestsModelCopyWith<_AccountInterestsModel> get copyWith => __$AccountInterestsModelCopyWithImpl<_AccountInterestsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountInterestsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountInterestsModel&&const DeepCollectionEquality().equals(other._businesses, _businesses)&&const DeepCollectionEquality().equals(other._events, _events));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_businesses),const DeepCollectionEquality().hash(_events));

@override
String toString() {
  return 'AccountInterestsModel(businesses: $businesses, events: $events)';
}


}

/// @nodoc
abstract mixin class _$AccountInterestsModelCopyWith<$Res> implements $AccountInterestsModelCopyWith<$Res> {
  factory _$AccountInterestsModelCopyWith(_AccountInterestsModel value, $Res Function(_AccountInterestsModel) _then) = __$AccountInterestsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'businesses') List<InterestModel> businesses,@JsonKey(name: 'events') List<InterestModel> events
});




}
/// @nodoc
class __$AccountInterestsModelCopyWithImpl<$Res>
    implements _$AccountInterestsModelCopyWith<$Res> {
  __$AccountInterestsModelCopyWithImpl(this._self, this._then);

  final _AccountInterestsModel _self;
  final $Res Function(_AccountInterestsModel) _then;

/// Create a copy of AccountInterestsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? businesses = null,Object? events = null,}) {
  return _then(_AccountInterestsModel(
businesses: null == businesses ? _self._businesses : businesses // ignore: cast_nullable_to_non_nullable
as List<InterestModel>,events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<InterestModel>,
  ));
}


}

// dart format on
