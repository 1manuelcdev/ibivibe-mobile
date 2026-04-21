// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_business_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileBusinessModel {

 String get id; String? get cnpj;@JsonKey(unknownEnumValue: ReachLevel.local, name: 'max_reach_level') ReachLevel get maxReachLevel; List<String> get categories;
/// Create a copy of ProfileBusinessModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileBusinessModelCopyWith<ProfileBusinessModel> get copyWith => _$ProfileBusinessModelCopyWithImpl<ProfileBusinessModel>(this as ProfileBusinessModel, _$identity);

  /// Serializes this ProfileBusinessModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileBusinessModel&&(identical(other.id, id) || other.id == id)&&(identical(other.cnpj, cnpj) || other.cnpj == cnpj)&&(identical(other.maxReachLevel, maxReachLevel) || other.maxReachLevel == maxReachLevel)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cnpj,maxReachLevel,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'ProfileBusinessModel(id: $id, cnpj: $cnpj, maxReachLevel: $maxReachLevel, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $ProfileBusinessModelCopyWith<$Res>  {
  factory $ProfileBusinessModelCopyWith(ProfileBusinessModel value, $Res Function(ProfileBusinessModel) _then) = _$ProfileBusinessModelCopyWithImpl;
@useResult
$Res call({
 String id, String? cnpj,@JsonKey(unknownEnumValue: ReachLevel.local, name: 'max_reach_level') ReachLevel maxReachLevel, List<String> categories
});




}
/// @nodoc
class _$ProfileBusinessModelCopyWithImpl<$Res>
    implements $ProfileBusinessModelCopyWith<$Res> {
  _$ProfileBusinessModelCopyWithImpl(this._self, this._then);

  final ProfileBusinessModel _self;
  final $Res Function(ProfileBusinessModel) _then;

/// Create a copy of ProfileBusinessModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cnpj = freezed,Object? maxReachLevel = null,Object? categories = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cnpj: freezed == cnpj ? _self.cnpj : cnpj // ignore: cast_nullable_to_non_nullable
as String?,maxReachLevel: null == maxReachLevel ? _self.maxReachLevel : maxReachLevel // ignore: cast_nullable_to_non_nullable
as ReachLevel,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileBusinessModel].
extension ProfileBusinessModelPatterns on ProfileBusinessModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileBusinessModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileBusinessModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileBusinessModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileBusinessModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileBusinessModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileBusinessModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? cnpj, @JsonKey(unknownEnumValue: ReachLevel.local, name: 'max_reach_level')  ReachLevel maxReachLevel,  List<String> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileBusinessModel() when $default != null:
return $default(_that.id,_that.cnpj,_that.maxReachLevel,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? cnpj, @JsonKey(unknownEnumValue: ReachLevel.local, name: 'max_reach_level')  ReachLevel maxReachLevel,  List<String> categories)  $default,) {final _that = this;
switch (_that) {
case _ProfileBusinessModel():
return $default(_that.id,_that.cnpj,_that.maxReachLevel,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? cnpj, @JsonKey(unknownEnumValue: ReachLevel.local, name: 'max_reach_level')  ReachLevel maxReachLevel,  List<String> categories)?  $default,) {final _that = this;
switch (_that) {
case _ProfileBusinessModel() when $default != null:
return $default(_that.id,_that.cnpj,_that.maxReachLevel,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileBusinessModel extends ProfileBusinessModel {
  const _ProfileBusinessModel({this.id = '', this.cnpj, @JsonKey(unknownEnumValue: ReachLevel.local, name: 'max_reach_level') required this.maxReachLevel, final  List<String> categories = const []}): _categories = categories,super._();
  factory _ProfileBusinessModel.fromJson(Map<String, dynamic> json) => _$ProfileBusinessModelFromJson(json);

@override@JsonKey() final  String id;
@override final  String? cnpj;
@override@JsonKey(unknownEnumValue: ReachLevel.local, name: 'max_reach_level') final  ReachLevel maxReachLevel;
 final  List<String> _categories;
@override@JsonKey() List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of ProfileBusinessModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileBusinessModelCopyWith<_ProfileBusinessModel> get copyWith => __$ProfileBusinessModelCopyWithImpl<_ProfileBusinessModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileBusinessModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileBusinessModel&&(identical(other.id, id) || other.id == id)&&(identical(other.cnpj, cnpj) || other.cnpj == cnpj)&&(identical(other.maxReachLevel, maxReachLevel) || other.maxReachLevel == maxReachLevel)&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cnpj,maxReachLevel,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'ProfileBusinessModel(id: $id, cnpj: $cnpj, maxReachLevel: $maxReachLevel, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$ProfileBusinessModelCopyWith<$Res> implements $ProfileBusinessModelCopyWith<$Res> {
  factory _$ProfileBusinessModelCopyWith(_ProfileBusinessModel value, $Res Function(_ProfileBusinessModel) _then) = __$ProfileBusinessModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? cnpj,@JsonKey(unknownEnumValue: ReachLevel.local, name: 'max_reach_level') ReachLevel maxReachLevel, List<String> categories
});




}
/// @nodoc
class __$ProfileBusinessModelCopyWithImpl<$Res>
    implements _$ProfileBusinessModelCopyWith<$Res> {
  __$ProfileBusinessModelCopyWithImpl(this._self, this._then);

  final _ProfileBusinessModel _self;
  final $Res Function(_ProfileBusinessModel) _then;

/// Create a copy of ProfileBusinessModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cnpj = freezed,Object? maxReachLevel = null,Object? categories = null,}) {
  return _then(_ProfileBusinessModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cnpj: freezed == cnpj ? _self.cnpj : cnpj // ignore: cast_nullable_to_non_nullable
as String?,maxReachLevel: null == maxReachLevel ? _self.maxReachLevel : maxReachLevel // ignore: cast_nullable_to_non_nullable
as ReachLevel,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
