// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_business_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountBusinessModel {

 String? get name; String? get document; String? get description; String? get website; String? get address; String? get phone; String? get category;
/// Create a copy of AccountBusinessModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountBusinessModelCopyWith<AccountBusinessModel> get copyWith => _$AccountBusinessModelCopyWithImpl<AccountBusinessModel>(this as AccountBusinessModel, _$identity);

  /// Serializes this AccountBusinessModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountBusinessModel&&super == other&&(identical(other.name, name) || other.name == name)&&(identical(other.document, document) || other.document == document)&&(identical(other.description, description) || other.description == description)&&(identical(other.website, website) || other.website == website)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,name,document,description,website,address,phone,category);

@override
String toString() {
  return 'AccountBusinessModel(name: $name, document: $document, description: $description, website: $website, address: $address, phone: $phone, category: $category)';
}


}

/// @nodoc
abstract mixin class $AccountBusinessModelCopyWith<$Res>  {
  factory $AccountBusinessModelCopyWith(AccountBusinessModel value, $Res Function(AccountBusinessModel) _then) = _$AccountBusinessModelCopyWithImpl;
@useResult
$Res call({
 String? name, String? document, String? description, String? website, String? address, String? phone, String? category
});




}
/// @nodoc
class _$AccountBusinessModelCopyWithImpl<$Res>
    implements $AccountBusinessModelCopyWith<$Res> {
  _$AccountBusinessModelCopyWithImpl(this._self, this._then);

  final AccountBusinessModel _self;
  final $Res Function(AccountBusinessModel) _then;

/// Create a copy of AccountBusinessModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? document = freezed,Object? description = freezed,Object? website = freezed,Object? address = freezed,Object? phone = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,document: freezed == document ? _self.document : document // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountBusinessModel].
extension AccountBusinessModelPatterns on AccountBusinessModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountBusinessModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountBusinessModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountBusinessModel value)  $default,){
final _that = this;
switch (_that) {
case _AccountBusinessModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountBusinessModel value)?  $default,){
final _that = this;
switch (_that) {
case _AccountBusinessModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? document,  String? description,  String? website,  String? address,  String? phone,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountBusinessModel() when $default != null:
return $default(_that.name,_that.document,_that.description,_that.website,_that.address,_that.phone,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? document,  String? description,  String? website,  String? address,  String? phone,  String? category)  $default,) {final _that = this;
switch (_that) {
case _AccountBusinessModel():
return $default(_that.name,_that.document,_that.description,_that.website,_that.address,_that.phone,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? document,  String? description,  String? website,  String? address,  String? phone,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _AccountBusinessModel() when $default != null:
return $default(_that.name,_that.document,_that.description,_that.website,_that.address,_that.phone,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountBusinessModel implements AccountBusinessModel {
  const _AccountBusinessModel({this.name, this.document, this.description, this.website, this.address, this.phone, this.category});
  factory _AccountBusinessModel.fromJson(Map<String, dynamic> json) => _$AccountBusinessModelFromJson(json);

@override final  String? name;
@override final  String? document;
@override final  String? description;
@override final  String? website;
@override final  String? address;
@override final  String? phone;
@override final  String? category;

/// Create a copy of AccountBusinessModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountBusinessModelCopyWith<_AccountBusinessModel> get copyWith => __$AccountBusinessModelCopyWithImpl<_AccountBusinessModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountBusinessModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountBusinessModel&&super == other&&(identical(other.name, name) || other.name == name)&&(identical(other.document, document) || other.document == document)&&(identical(other.description, description) || other.description == description)&&(identical(other.website, website) || other.website == website)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,name,document,description,website,address,phone,category);

@override
String toString() {
  return 'AccountBusinessModel(name: $name, document: $document, description: $description, website: $website, address: $address, phone: $phone, category: $category)';
}


}

/// @nodoc
abstract mixin class _$AccountBusinessModelCopyWith<$Res> implements $AccountBusinessModelCopyWith<$Res> {
  factory _$AccountBusinessModelCopyWith(_AccountBusinessModel value, $Res Function(_AccountBusinessModel) _then) = __$AccountBusinessModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? document, String? description, String? website, String? address, String? phone, String? category
});




}
/// @nodoc
class __$AccountBusinessModelCopyWithImpl<$Res>
    implements _$AccountBusinessModelCopyWith<$Res> {
  __$AccountBusinessModelCopyWithImpl(this._self, this._then);

  final _AccountBusinessModel _self;
  final $Res Function(_AccountBusinessModel) _then;

/// Create a copy of AccountBusinessModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? document = freezed,Object? description = freezed,Object? website = freezed,Object? address = freezed,Object? phone = freezed,Object? category = freezed,}) {
  return _then(_AccountBusinessModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,document: freezed == document ? _self.document : document // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
