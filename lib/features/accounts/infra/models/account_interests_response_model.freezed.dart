// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_interests_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountInterestsResponseModel {

 int get count;
/// Create a copy of AccountInterestsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountInterestsResponseModelCopyWith<AccountInterestsResponseModel> get copyWith => _$AccountInterestsResponseModelCopyWithImpl<AccountInterestsResponseModel>(this as AccountInterestsResponseModel, _$identity);

  /// Serializes this AccountInterestsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountInterestsResponseModel&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'AccountInterestsResponseModel(count: $count)';
}


}

/// @nodoc
abstract mixin class $AccountInterestsResponseModelCopyWith<$Res>  {
  factory $AccountInterestsResponseModelCopyWith(AccountInterestsResponseModel value, $Res Function(AccountInterestsResponseModel) _then) = _$AccountInterestsResponseModelCopyWithImpl;
@useResult
$Res call({
 int count
});




}
/// @nodoc
class _$AccountInterestsResponseModelCopyWithImpl<$Res>
    implements $AccountInterestsResponseModelCopyWith<$Res> {
  _$AccountInterestsResponseModelCopyWithImpl(this._self, this._then);

  final AccountInterestsResponseModel _self;
  final $Res Function(AccountInterestsResponseModel) _then;

/// Create a copy of AccountInterestsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountInterestsResponseModel].
extension AccountInterestsResponseModelPatterns on AccountInterestsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountInterestsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountInterestsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountInterestsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _AccountInterestsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountInterestsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AccountInterestsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountInterestsResponseModel() when $default != null:
return $default(_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count)  $default,) {final _that = this;
switch (_that) {
case _AccountInterestsResponseModel():
return $default(_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count)?  $default,) {final _that = this;
switch (_that) {
case _AccountInterestsResponseModel() when $default != null:
return $default(_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountInterestsResponseModel extends AccountInterestsResponseModel {
  const _AccountInterestsResponseModel({required this.count}): super._();
  factory _AccountInterestsResponseModel.fromJson(Map<String, dynamic> json) => _$AccountInterestsResponseModelFromJson(json);

@override final  int count;

/// Create a copy of AccountInterestsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountInterestsResponseModelCopyWith<_AccountInterestsResponseModel> get copyWith => __$AccountInterestsResponseModelCopyWithImpl<_AccountInterestsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountInterestsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountInterestsResponseModel&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'AccountInterestsResponseModel(count: $count)';
}


}

/// @nodoc
abstract mixin class _$AccountInterestsResponseModelCopyWith<$Res> implements $AccountInterestsResponseModelCopyWith<$Res> {
  factory _$AccountInterestsResponseModelCopyWith(_AccountInterestsResponseModel value, $Res Function(_AccountInterestsResponseModel) _then) = __$AccountInterestsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int count
});




}
/// @nodoc
class __$AccountInterestsResponseModelCopyWithImpl<$Res>
    implements _$AccountInterestsResponseModelCopyWith<$Res> {
  __$AccountInterestsResponseModelCopyWithImpl(this._self, this._then);

  final _AccountInterestsResponseModel _self;
  final $Res Function(_AccountInterestsResponseModel) _then;

/// Create a copy of AccountInterestsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,}) {
  return _then(_AccountInterestsResponseModel(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
