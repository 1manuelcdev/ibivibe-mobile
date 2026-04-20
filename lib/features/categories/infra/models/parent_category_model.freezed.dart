// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parent_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParentCategoryModel {

 String get id; String get name; List<EntityType> get entities; List<ChildCategoryModel>? get children;
/// Create a copy of ParentCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParentCategoryModelCopyWith<ParentCategoryModel> get copyWith => _$ParentCategoryModelCopyWithImpl<ParentCategoryModel>(this as ParentCategoryModel, _$identity);

  /// Serializes this ParentCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParentCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.entities, entities)&&const DeepCollectionEquality().equals(other.children, children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(entities),const DeepCollectionEquality().hash(children));

@override
String toString() {
  return 'ParentCategoryModel(id: $id, name: $name, entities: $entities, children: $children)';
}


}

/// @nodoc
abstract mixin class $ParentCategoryModelCopyWith<$Res>  {
  factory $ParentCategoryModelCopyWith(ParentCategoryModel value, $Res Function(ParentCategoryModel) _then) = _$ParentCategoryModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<EntityType> entities, List<ChildCategoryModel>? children
});




}
/// @nodoc
class _$ParentCategoryModelCopyWithImpl<$Res>
    implements $ParentCategoryModelCopyWith<$Res> {
  _$ParentCategoryModelCopyWithImpl(this._self, this._then);

  final ParentCategoryModel _self;
  final $Res Function(ParentCategoryModel) _then;

/// Create a copy of ParentCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? entities = null,Object? children = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,entities: null == entities ? _self.entities : entities // ignore: cast_nullable_to_non_nullable
as List<EntityType>,children: freezed == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<ChildCategoryModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ParentCategoryModel].
extension ParentCategoryModelPatterns on ParentCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParentCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParentCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParentCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _ParentCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParentCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ParentCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<EntityType> entities,  List<ChildCategoryModel>? children)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParentCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.entities,_that.children);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<EntityType> entities,  List<ChildCategoryModel>? children)  $default,) {final _that = this;
switch (_that) {
case _ParentCategoryModel():
return $default(_that.id,_that.name,_that.entities,_that.children);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<EntityType> entities,  List<ChildCategoryModel>? children)?  $default,) {final _that = this;
switch (_that) {
case _ParentCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.entities,_that.children);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParentCategoryModel extends ParentCategoryModel {
  const _ParentCategoryModel({this.id = '', this.name = '', required final  List<EntityType> entities, final  List<ChildCategoryModel>? children = null}): _entities = entities,_children = children,super._();
  factory _ParentCategoryModel.fromJson(Map<String, dynamic> json) => _$ParentCategoryModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
 final  List<EntityType> _entities;
@override List<EntityType> get entities {
  if (_entities is EqualUnmodifiableListView) return _entities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entities);
}

 final  List<ChildCategoryModel>? _children;
@override@JsonKey() List<ChildCategoryModel>? get children {
  final value = _children;
  if (value == null) return null;
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ParentCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParentCategoryModelCopyWith<_ParentCategoryModel> get copyWith => __$ParentCategoryModelCopyWithImpl<_ParentCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParentCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParentCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._entities, _entities)&&const DeepCollectionEquality().equals(other._children, _children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_entities),const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'ParentCategoryModel(id: $id, name: $name, entities: $entities, children: $children)';
}


}

/// @nodoc
abstract mixin class _$ParentCategoryModelCopyWith<$Res> implements $ParentCategoryModelCopyWith<$Res> {
  factory _$ParentCategoryModelCopyWith(_ParentCategoryModel value, $Res Function(_ParentCategoryModel) _then) = __$ParentCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<EntityType> entities, List<ChildCategoryModel>? children
});




}
/// @nodoc
class __$ParentCategoryModelCopyWithImpl<$Res>
    implements _$ParentCategoryModelCopyWith<$Res> {
  __$ParentCategoryModelCopyWithImpl(this._self, this._then);

  final _ParentCategoryModel _self;
  final $Res Function(_ParentCategoryModel) _then;

/// Create a copy of ParentCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? entities = null,Object? children = freezed,}) {
  return _then(_ParentCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,entities: null == entities ? _self._entities : entities // ignore: cast_nullable_to_non_nullable
as List<EntityType>,children: freezed == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<ChildCategoryModel>?,
  ));
}


}

// dart format on
