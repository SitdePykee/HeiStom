// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lodging_booking_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LodgingBookingDetailModel {
  String? get bookingId;
  LodgingModel? get lodging;
  UserModel? get user;
  num? get checkInAt;
  num? get checkOutAt;
  bool? get isBankTransfer;
  num? get numOfRoom;

  /// Create a copy of LodgingBookingDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LodgingBookingDetailModelCopyWith<LodgingBookingDetailModel> get copyWith =>
      _$LodgingBookingDetailModelCopyWithImpl<LodgingBookingDetailModel>(
          this as LodgingBookingDetailModel, _$identity);

  /// Serializes this LodgingBookingDetailModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LodgingBookingDetailModel &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.lodging, lodging) || other.lodging == lodging) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.checkInAt, checkInAt) ||
                other.checkInAt == checkInAt) &&
            (identical(other.checkOutAt, checkOutAt) ||
                other.checkOutAt == checkOutAt) &&
            (identical(other.isBankTransfer, isBankTransfer) ||
                other.isBankTransfer == isBankTransfer) &&
            (identical(other.numOfRoom, numOfRoom) ||
                other.numOfRoom == numOfRoom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bookingId, lodging, user,
      checkInAt, checkOutAt, isBankTransfer, numOfRoom);

  @override
  String toString() {
    return 'LodgingBookingDetailModel(bookingId: $bookingId, lodging: $lodging, user: $user, checkInAt: $checkInAt, checkOutAt: $checkOutAt, isBankTransfer: $isBankTransfer, numOfRoom: $numOfRoom)';
  }
}

/// @nodoc
abstract mixin class $LodgingBookingDetailModelCopyWith<$Res> {
  factory $LodgingBookingDetailModelCopyWith(LodgingBookingDetailModel value,
          $Res Function(LodgingBookingDetailModel) _then) =
      _$LodgingBookingDetailModelCopyWithImpl;
  @useResult
  $Res call(
      {String? bookingId,
      LodgingModel? lodging,
      UserModel? user,
      num? checkInAt,
      num? checkOutAt,
      bool? isBankTransfer,
      num? numOfRoom});

  $LodgingModelCopyWith<$Res>? get lodging;
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$LodgingBookingDetailModelCopyWithImpl<$Res>
    implements $LodgingBookingDetailModelCopyWith<$Res> {
  _$LodgingBookingDetailModelCopyWithImpl(this._self, this._then);

  final LodgingBookingDetailModel _self;
  final $Res Function(LodgingBookingDetailModel) _then;

  /// Create a copy of LodgingBookingDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = freezed,
    Object? lodging = freezed,
    Object? user = freezed,
    Object? checkInAt = freezed,
    Object? checkOutAt = freezed,
    Object? isBankTransfer = freezed,
    Object? numOfRoom = freezed,
  }) {
    return _then(_self.copyWith(
      bookingId: freezed == bookingId
          ? _self.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      lodging: freezed == lodging
          ? _self.lodging
          : lodging // ignore: cast_nullable_to_non_nullable
              as LodgingModel?,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      checkInAt: freezed == checkInAt
          ? _self.checkInAt
          : checkInAt // ignore: cast_nullable_to_non_nullable
              as num?,
      checkOutAt: freezed == checkOutAt
          ? _self.checkOutAt
          : checkOutAt // ignore: cast_nullable_to_non_nullable
              as num?,
      isBankTransfer: freezed == isBankTransfer
          ? _self.isBankTransfer
          : isBankTransfer // ignore: cast_nullable_to_non_nullable
              as bool?,
      numOfRoom: freezed == numOfRoom
          ? _self.numOfRoom
          : numOfRoom // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }

  /// Create a copy of LodgingBookingDetailModel
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

  /// Create a copy of LodgingBookingDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _LodgingBookingDetailModel implements LodgingBookingDetailModel {
  const _LodgingBookingDetailModel(
      {this.bookingId,
      this.lodging,
      this.user,
      this.checkInAt,
      this.checkOutAt,
      this.isBankTransfer,
      this.numOfRoom});
  factory _LodgingBookingDetailModel.fromJson(Map<String, dynamic> json) =>
      _$LodgingBookingDetailModelFromJson(json);

  @override
  final String? bookingId;
  @override
  final LodgingModel? lodging;
  @override
  final UserModel? user;
  @override
  final num? checkInAt;
  @override
  final num? checkOutAt;
  @override
  final bool? isBankTransfer;
  @override
  final num? numOfRoom;

  /// Create a copy of LodgingBookingDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LodgingBookingDetailModelCopyWith<_LodgingBookingDetailModel>
      get copyWith =>
          __$LodgingBookingDetailModelCopyWithImpl<_LodgingBookingDetailModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LodgingBookingDetailModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LodgingBookingDetailModel &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.lodging, lodging) || other.lodging == lodging) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.checkInAt, checkInAt) ||
                other.checkInAt == checkInAt) &&
            (identical(other.checkOutAt, checkOutAt) ||
                other.checkOutAt == checkOutAt) &&
            (identical(other.isBankTransfer, isBankTransfer) ||
                other.isBankTransfer == isBankTransfer) &&
            (identical(other.numOfRoom, numOfRoom) ||
                other.numOfRoom == numOfRoom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bookingId, lodging, user,
      checkInAt, checkOutAt, isBankTransfer, numOfRoom);

  @override
  String toString() {
    return 'LodgingBookingDetailModel(bookingId: $bookingId, lodging: $lodging, user: $user, checkInAt: $checkInAt, checkOutAt: $checkOutAt, isBankTransfer: $isBankTransfer, numOfRoom: $numOfRoom)';
  }
}

/// @nodoc
abstract mixin class _$LodgingBookingDetailModelCopyWith<$Res>
    implements $LodgingBookingDetailModelCopyWith<$Res> {
  factory _$LodgingBookingDetailModelCopyWith(_LodgingBookingDetailModel value,
          $Res Function(_LodgingBookingDetailModel) _then) =
      __$LodgingBookingDetailModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? bookingId,
      LodgingModel? lodging,
      UserModel? user,
      num? checkInAt,
      num? checkOutAt,
      bool? isBankTransfer,
      num? numOfRoom});

  @override
  $LodgingModelCopyWith<$Res>? get lodging;
  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$LodgingBookingDetailModelCopyWithImpl<$Res>
    implements _$LodgingBookingDetailModelCopyWith<$Res> {
  __$LodgingBookingDetailModelCopyWithImpl(this._self, this._then);

  final _LodgingBookingDetailModel _self;
  final $Res Function(_LodgingBookingDetailModel) _then;

  /// Create a copy of LodgingBookingDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bookingId = freezed,
    Object? lodging = freezed,
    Object? user = freezed,
    Object? checkInAt = freezed,
    Object? checkOutAt = freezed,
    Object? isBankTransfer = freezed,
    Object? numOfRoom = freezed,
  }) {
    return _then(_LodgingBookingDetailModel(
      bookingId: freezed == bookingId
          ? _self.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      lodging: freezed == lodging
          ? _self.lodging
          : lodging // ignore: cast_nullable_to_non_nullable
              as LodgingModel?,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      checkInAt: freezed == checkInAt
          ? _self.checkInAt
          : checkInAt // ignore: cast_nullable_to_non_nullable
              as num?,
      checkOutAt: freezed == checkOutAt
          ? _self.checkOutAt
          : checkOutAt // ignore: cast_nullable_to_non_nullable
              as num?,
      isBankTransfer: freezed == isBankTransfer
          ? _self.isBankTransfer
          : isBankTransfer // ignore: cast_nullable_to_non_nullable
              as bool?,
      numOfRoom: freezed == numOfRoom
          ? _self.numOfRoom
          : numOfRoom // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }

  /// Create a copy of LodgingBookingDetailModel
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

  /// Create a copy of LodgingBookingDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

// dart format on
