// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'child_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChildCategoryModel {

 String get id; String get name; List<EntityType> get entities;
/// Create a copy of ChildCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChildCategoryModelCopyWith<ChildCategoryModel> get copyWith => _$ChildCategoryModelCopyWithImpl<ChildCategoryModel>(this as ChildCategoryModel, _$identity);

  /// Serializes this ChildCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChildCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.entities, entities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(entities));

@override
String toString() {
  return 'ChildCategoryModel(id: $id, name: $name, entities: $entities)';
}


}

/// @nodoc
abstract mixin class $ChildCategoryModelCopyWith<$Res>  {
  factory $ChildCategoryModelCopyWith(ChildCategoryModel value, $Res Function(ChildCategoryModel) _then) = _$ChildCategoryModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<EntityType> entities
});




}
/// @nodoc
class _$ChildCategoryModelCopyWithImpl<$Res>
    implements $ChildCategoryModelCopyWith<$Res> {
  _$ChildCategoryModelCopyWithImpl(this._self, this._then);

  final ChildCategoryModel _self;
  final $Res Function(ChildCategoryModel) _then;

/// Create a copy of ChildCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? entities = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,entities: null == entities ? _self.entities : entities // ignore: cast_nullable_to_non_nullable
as List<EntityType>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChildCategoryModel].
extension ChildCategoryModelPatterns on ChildCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChildCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChildCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChildCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _ChildCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChildCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChildCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<EntityType> entities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChildCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.entities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<EntityType> entities)  $default,) {final _that = this;
switch (_that) {
case _ChildCategoryModel():
return $default(_that.id,_that.name,_that.entities);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<EntityType> entities)?  $default,) {final _that = this;
switch (_that) {
case _ChildCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.entities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChildCategoryModel extends ChildCategoryModel {
  const _ChildCategoryModel({this.id = '', this.name = '', required final  List<EntityType> entities}): _entities = entities,super._();
  factory _ChildCategoryModel.fromJson(Map<String, dynamic> json) => _$ChildCategoryModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
 final  List<EntityType> _entities;
@override List<EntityType> get entities {
  if (_entities is EqualUnmodifiableListView) return _entities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entities);
}


/// Create a copy of ChildCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChildCategoryModelCopyWith<_ChildCategoryModel> get copyWith => __$ChildCategoryModelCopyWithImpl<_ChildCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChildCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChildCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._entities, _entities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_entities));

@override
String toString() {
  return 'ChildCategoryModel(id: $id, name: $name, entities: $entities)';
}


}

/// @nodoc
abstract mixin class _$ChildCategoryModelCopyWith<$Res> implements $ChildCategoryModelCopyWith<$Res> {
  factory _$ChildCategoryModelCopyWith(_ChildCategoryModel value, $Res Function(_ChildCategoryModel) _then) = __$ChildCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<EntityType> entities
});




}
/// @nodoc
class __$ChildCategoryModelCopyWithImpl<$Res>
    implements _$ChildCategoryModelCopyWith<$Res> {
  __$ChildCategoryModelCopyWithImpl(this._self, this._then);

  final _ChildCategoryModel _self;
  final $Res Function(_ChildCategoryModel) _then;

/// Create a copy of ChildCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? entities = null,}) {
  return _then(_ChildCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,entities: null == entities ? _self._entities : entities // ignore: cast_nullable_to_non_nullable
as List<EntityType>,
  ));
}


}

// dart format on
