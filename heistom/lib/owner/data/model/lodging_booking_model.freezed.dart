// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lodging_booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LodgingBookingModel {
  String? get id;
  LodgingModel? get lodging;
  num? get bookedAt;

  /// Create a copy of LodgingBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LodgingBookingModelCopyWith<LodgingBookingModel> get copyWith =>
      _$LodgingBookingModelCopyWithImpl<LodgingBookingModel>(
          this as LodgingBookingModel, _$identity);

  /// Serializes this LodgingBookingModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LodgingBookingModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lodging, lodging) || other.lodging == lodging) &&
            (identical(other.bookedAt, bookedAt) ||
                other.bookedAt == bookedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, lodging, bookedAt);

  @override
  String toString() {
    return 'LodgingBookingModel(id: $id, lodging: $lodging, bookedAt: $bookedAt)';
  }
}

/// @nodoc
abstract mixin class $LodgingBookingModelCopyWith<$Res> {
  factory $LodgingBookingModelCopyWith(
          LodgingBookingModel value, $Res Function(LodgingBookingModel) _then) =
      _$LodgingBookingModelCopyWithImpl;
  @useResult
  $Res call({String? id, LodgingModel? lodging, num? bookedAt});

  $LodgingModelCopyWith<$Res>? get lodging;
}

/// @nodoc
class _$LodgingBookingModelCopyWithImpl<$Res>
    implements $LodgingBookingModelCopyWith<$Res> {
  _$LodgingBookingModelCopyWithImpl(this._self, this._then);

  final LodgingBookingModel _self;
  final $Res Function(LodgingBookingModel) _then;

  /// Create a copy of LodgingBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lodging = freezed,
    Object? bookedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lodging: freezed == lodging
          ? _self.lodging
          : lodging // ignore: cast_nullable_to_non_nullable
              as LodgingModel?,
      bookedAt: freezed == bookedAt
          ? _self.bookedAt
          : bookedAt // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }

  /// Create a copy of LodgingBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LodgingModelCopyWith<$Res>? get lodging {
    if (_self.lodging == null) {
      return null;
    }

    return $LodgingModelCopyWith<$Res>(_self.lodging!, (value) {
      return _then(_self.copyWith(lodging: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _LodgingBookingModel implements LodgingBookingModel {
  _LodgingBookingModel({this.id, this.lodging, this.bookedAt});
  factory _LodgingBookingModel.fromJson(Map<String, dynamic> json) =>
      _$LodgingBookingModelFromJson(json);

  @override
  final String? id;
  @override
  final LodgingModel? lodging;
  @override
  final num? bookedAt;

  /// Create a copy of LodgingBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LodgingBookingModelCopyWith<_LodgingBookingModel> get copyWith =>
      __$LodgingBookingModelCopyWithImpl<_LodgingBookingModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LodgingBookingModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LodgingBookingModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lodging, lodging) || other.lodging == lodging) &&
            (identical(other.bookedAt, bookedAt) ||
                other.bookedAt == bookedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, lodging, bookedAt);

  @override
  String toString() {
    return 'LodgingBookingModel(id: $id, lodging: $lodging, bookedAt: $bookedAt)';
  }
}

/// @nodoc
abstract mixin class _$LodgingBookingModelCopyWith<$Res>
    implements $LodgingBookingModelCopyWith<$Res> {
  factory _$LodgingBookingModelCopyWith(_LodgingBookingModel value,
          $Res Function(_LodgingBookingModel) _then) =
      __$LodgingBookingModelCopyWithImpl;
  @override
  @useResult
  $Res call({String? id, LodgingModel? lodging, num? bookedAt});

  @override
  $LodgingModelCopyWith<$Res>? get lodging;
}

/// @nodoc
class __$LodgingBookingModelCopyWithImpl<$Res>
    implements _$LodgingBookingModelCopyWith<$Res> {
  __$LodgingBookingModelCopyWithImpl(this._self, this._then);

  final _LodgingBookingModel _self;
  final $Res Function(_LodgingBookingModel) _then;

  /// Create a copy of LodgingBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? lodging = freezed,
    Object? bookedAt = freezed,
  }) {
    return _then(_LodgingBookingModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lodging: freezed == lodging
          ? _self.lodging
          : lodging // ignore: cast_nullable_to_non_nullable
              as LodgingModel?,
      bookedAt: freezed == bookedAt
          ? _self.bookedAt
          : bookedAt // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }

  /// Create a copy of LodgingBookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LodgingModelCopyWith<$Res>? get lodging {
    if (_self.lodging == null) {
      return null;
    }

    return $LodgingModelCopyWith<$Res>(_self.lodging!, (value) {
      return _then(_self.copyWith(lodging: value));
    });
  }
}

// dart format on
