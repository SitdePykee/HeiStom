// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'street_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StreetModel {
  String? get id;
  String? get name;
  String? get image;

  /// Create a copy of StreetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StreetModelCopyWith<StreetModel> get copyWith =>
      _$StreetModelCopyWithImpl<StreetModel>(this as StreetModel, _$identity);

  /// Serializes this StreetModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StreetModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  @override
  String toString() {
    return 'StreetModel(id: $id, name: $name, image: $image)';
  }
}

/// @nodoc
abstract mixin class $StreetModelCopyWith<$Res> {
  factory $StreetModelCopyWith(
          StreetModel value, $Res Function(StreetModel) _then) =
      _$StreetModelCopyWithImpl;
  @useResult
  $Res call({String? id, String? name, String? image});
}

/// @nodoc
class _$StreetModelCopyWithImpl<$Res> implements $StreetModelCopyWith<$Res> {
  _$StreetModelCopyWithImpl(this._self, this._then);

  final StreetModel _self;
  final $Res Function(StreetModel) _then;

  /// Create a copy of StreetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _StreetModel implements StreetModel {
  _StreetModel({this.id, this.name, this.image});
  factory _StreetModel.fromJson(Map<String, dynamic> json) =>
      _$StreetModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? image;

  /// Create a copy of StreetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StreetModelCopyWith<_StreetModel> get copyWith =>
      __$StreetModelCopyWithImpl<_StreetModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StreetModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StreetModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  @override
  String toString() {
    return 'StreetModel(id: $id, name: $name, image: $image)';
  }
}

/// @nodoc
abstract mixin class _$StreetModelCopyWith<$Res>
    implements $StreetModelCopyWith<$Res> {
  factory _$StreetModelCopyWith(
          _StreetModel value, $Res Function(_StreetModel) _then) =
      __$StreetModelCopyWithImpl;
  @override
  @useResult
  $Res call({String? id, String? name, String? image});
}

/// @nodoc
class __$StreetModelCopyWithImpl<$Res> implements _$StreetModelCopyWith<$Res> {
  __$StreetModelCopyWithImpl(this._self, this._then);

  final _StreetModel _self;
  final $Res Function(_StreetModel) _then;

  /// Create a copy of StreetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
  }) {
    return _then(_StreetModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
