// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BillModel {
  String? get id;
  String? get lodgingId;
  String? get userID;
  LodgingModel? get lodging;
  int? get numOfPeople;
  List<RoomModel>? get rooms;
  num? get checkInAt;
  num? get checkOutAt;
  bool? get isBankTransfer;

  /// Create a copy of BillModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BillModelCopyWith<BillModel> get copyWith =>
      _$BillModelCopyWithImpl<BillModel>(this as BillModel, _$identity);

  /// Serializes this BillModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BillModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lodgingId, lodgingId) ||
                other.lodgingId == lodgingId) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.lodging, lodging) || other.lodging == lodging) &&
            (identical(other.numOfPeople, numOfPeople) ||
                other.numOfPeople == numOfPeople) &&
            const DeepCollectionEquality().equals(other.rooms, rooms) &&
            (identical(other.checkInAt, checkInAt) ||
                other.checkInAt == checkInAt) &&
            (identical(other.checkOutAt, checkOutAt) ||
                other.checkOutAt == checkOutAt) &&
            (identical(other.isBankTransfer, isBankTransfer) ||
                other.isBankTransfer == isBankTransfer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      lodgingId,
      userID,
      lodging,
      numOfPeople,
      const DeepCollectionEquality().hash(rooms),
      checkInAt,
      checkOutAt,
      isBankTransfer);

  @override
  String toString() {
    return 'BillModel(id: $id, lodgingId: $lodgingId, userID: $userID, lodging: $lodging, numOfPeople: $numOfPeople, rooms: $rooms, checkInAt: $checkInAt, checkOutAt: $checkOutAt, isBankTransfer: $isBankTransfer)';
  }
}

/// @nodoc
abstract mixin class $BillModelCopyWith<$Res> {
  factory $BillModelCopyWith(BillModel value, $Res Function(BillModel) _then) =
      _$BillModelCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? lodgingId,
      String? userID,
      LodgingModel? lodging,
      int? numOfPeople,
      List<RoomModel>? rooms,
      num? checkInAt,
      num? checkOutAt,
      bool? isBankTransfer});

  $LodgingModelCopyWith<$Res>? get lodging;
}

/// @nodoc
class _$BillModelCopyWithImpl<$Res> implements $BillModelCopyWith<$Res> {
  _$BillModelCopyWithImpl(this._self, this._then);

  final BillModel _self;
  final $Res Function(BillModel) _then;

  /// Create a copy of BillModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lodgingId = freezed,
    Object? userID = freezed,
    Object? lodging = freezed,
    Object? numOfPeople = freezed,
    Object? rooms = freezed,
    Object? checkInAt = freezed,
    Object? checkOutAt = freezed,
    Object? isBankTransfer = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lodgingId: freezed == lodgingId
          ? _self.lodgingId
          : lodgingId // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: freezed == userID
          ? _self.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      lodging: freezed == lodging
          ? _self.lodging
          : lodging // ignore: cast_nullable_to_non_nullable
              as LodgingModel?,
      numOfPeople: freezed == numOfPeople
          ? _self.numOfPeople
          : numOfPeople // ignore: cast_nullable_to_non_nullable
              as int?,
      rooms: freezed == rooms
          ? _self.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<RoomModel>?,
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
    ));
  }

  /// Create a copy of BillModel
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
class _BillModel implements BillModel {
  _BillModel(
      {this.id,
      this.lodgingId,
      this.userID,
      this.lodging,
      this.numOfPeople,
      final List<RoomModel>? rooms,
      this.checkInAt,
      this.checkOutAt,
      this.isBankTransfer})
      : _rooms = rooms;
  factory _BillModel.fromJson(Map<String, dynamic> json) =>
      _$BillModelFromJson(json);

  @override
  final String? id;
  @override
  final String? lodgingId;
  @override
  final String? userID;
  @override
  final LodgingModel? lodging;
  @override
  final int? numOfPeople;
  final List<RoomModel>? _rooms;
  @override
  List<RoomModel>? get rooms {
    final value = _rooms;
    if (value == null) return null;
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final num? checkInAt;
  @override
  final num? checkOutAt;
  @override
  final bool? isBankTransfer;

  /// Create a copy of BillModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BillModelCopyWith<_BillModel> get copyWith =>
      __$BillModelCopyWithImpl<_BillModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BillModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BillModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lodgingId, lodgingId) ||
                other.lodgingId == lodgingId) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.lodging, lodging) || other.lodging == lodging) &&
            (identical(other.numOfPeople, numOfPeople) ||
                other.numOfPeople == numOfPeople) &&
            const DeepCollectionEquality().equals(other._rooms, _rooms) &&
            (identical(other.checkInAt, checkInAt) ||
                other.checkInAt == checkInAt) &&
            (identical(other.checkOutAt, checkOutAt) ||
                other.checkOutAt == checkOutAt) &&
            (identical(other.isBankTransfer, isBankTransfer) ||
                other.isBankTransfer == isBankTransfer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      lodgingId,
      userID,
      lodging,
      numOfPeople,
      const DeepCollectionEquality().hash(_rooms),
      checkInAt,
      checkOutAt,
      isBankTransfer);

  @override
  String toString() {
    return 'BillModel(id: $id, lodgingId: $lodgingId, userID: $userID, lodging: $lodging, numOfPeople: $numOfPeople, rooms: $rooms, checkInAt: $checkInAt, checkOutAt: $checkOutAt, isBankTransfer: $isBankTransfer)';
  }
}

/// @nodoc
abstract mixin class _$BillModelCopyWith<$Res>
    implements $BillModelCopyWith<$Res> {
  factory _$BillModelCopyWith(
          _BillModel value, $Res Function(_BillModel) _then) =
      __$BillModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? lodgingId,
      String? userID,
      LodgingModel? lodging,
      int? numOfPeople,
      List<RoomModel>? rooms,
      num? checkInAt,
      num? checkOutAt,
      bool? isBankTransfer});

  @override
  $LodgingModelCopyWith<$Res>? get lodging;
}

/// @nodoc
class __$BillModelCopyWithImpl<$Res> implements _$BillModelCopyWith<$Res> {
  __$BillModelCopyWithImpl(this._self, this._then);

  final _BillModel _self;
  final $Res Function(_BillModel) _then;

  /// Create a copy of BillModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? lodgingId = freezed,
    Object? userID = freezed,
    Object? lodging = freezed,
    Object? numOfPeople = freezed,
    Object? rooms = freezed,
    Object? checkInAt = freezed,
    Object? checkOutAt = freezed,
    Object? isBankTransfer = freezed,
  }) {
    return _then(_BillModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lodgingId: freezed == lodgingId
          ? _self.lodgingId
          : lodgingId // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: freezed == userID
          ? _self.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      lodging: freezed == lodging
          ? _self.lodging
          : lodging // ignore: cast_nullable_to_non_nullable
              as LodgingModel?,
      numOfPeople: freezed == numOfPeople
          ? _self.numOfPeople
          : numOfPeople // ignore: cast_nullable_to_non_nullable
              as int?,
      rooms: freezed == rooms
          ? _self._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<RoomModel>?,
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
    ));
  }

  /// Create a copy of BillModel
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
