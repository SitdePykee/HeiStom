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
  LodgingModel? get lodging;
  UserModel? get user;
  int? get numberOfPeople;
  List<RoomModel>? get room;
  num? get checkInDate;
  num? get checkOutDate;
  double? get totalPrice;
  String? get paymentMethod;

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
            (identical(other.lodging, lodging) || other.lodging == lodging) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.numberOfPeople, numberOfPeople) ||
                other.numberOfPeople == numberOfPeople) &&
            const DeepCollectionEquality().equals(other.room, room) &&
            (identical(other.checkInDate, checkInDate) ||
                other.checkInDate == checkInDate) &&
            (identical(other.checkOutDate, checkOutDate) ||
                other.checkOutDate == checkOutDate) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      lodging,
      user,
      numberOfPeople,
      const DeepCollectionEquality().hash(room),
      checkInDate,
      checkOutDate,
      totalPrice,
      paymentMethod);

  @override
  String toString() {
    return 'BillModel(id: $id, lodging: $lodging, user: $user, numberOfPeople: $numberOfPeople, room: $room, checkInDate: $checkInDate, checkOutDate: $checkOutDate, totalPrice: $totalPrice, paymentMethod: $paymentMethod)';
  }
}

/// @nodoc
abstract mixin class $BillModelCopyWith<$Res> {
  factory $BillModelCopyWith(BillModel value, $Res Function(BillModel) _then) =
      _$BillModelCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      LodgingModel? lodging,
      UserModel? user,
      int? numberOfPeople,
      List<RoomModel>? room,
      num? checkInDate,
      num? checkOutDate,
      double? totalPrice,
      String? paymentMethod});

  $LodgingModelCopyWith<$Res>? get lodging;
  $UserModelCopyWith<$Res>? get user;
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
    Object? lodging = freezed,
    Object? user = freezed,
    Object? numberOfPeople = freezed,
    Object? room = freezed,
    Object? checkInDate = freezed,
    Object? checkOutDate = freezed,
    Object? totalPrice = freezed,
    Object? paymentMethod = freezed,
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
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      numberOfPeople: freezed == numberOfPeople
          ? _self.numberOfPeople
          : numberOfPeople // ignore: cast_nullable_to_non_nullable
              as int?,
      room: freezed == room
          ? _self.room
          : room // ignore: cast_nullable_to_non_nullable
              as List<RoomModel>?,
      checkInDate: freezed == checkInDate
          ? _self.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as num?,
      checkOutDate: freezed == checkOutDate
          ? _self.checkOutDate
          : checkOutDate // ignore: cast_nullable_to_non_nullable
              as num?,
      totalPrice: freezed == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentMethod: freezed == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
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

  /// Create a copy of BillModel
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
class _BillModel implements BillModel {
  _BillModel(
      {this.id,
      this.lodging,
      this.user,
      this.numberOfPeople,
      final List<RoomModel>? room,
      this.checkInDate,
      this.checkOutDate,
      this.totalPrice,
      this.paymentMethod})
      : _room = room;
  factory _BillModel.fromJson(Map<String, dynamic> json) =>
      _$BillModelFromJson(json);

  @override
  final String? id;
  @override
  final LodgingModel? lodging;
  @override
  final UserModel? user;
  @override
  final int? numberOfPeople;
  final List<RoomModel>? _room;
  @override
  List<RoomModel>? get room {
    final value = _room;
    if (value == null) return null;
    if (_room is EqualUnmodifiableListView) return _room;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final num? checkInDate;
  @override
  final num? checkOutDate;
  @override
  final double? totalPrice;
  @override
  final String? paymentMethod;

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
            (identical(other.lodging, lodging) || other.lodging == lodging) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.numberOfPeople, numberOfPeople) ||
                other.numberOfPeople == numberOfPeople) &&
            const DeepCollectionEquality().equals(other._room, _room) &&
            (identical(other.checkInDate, checkInDate) ||
                other.checkInDate == checkInDate) &&
            (identical(other.checkOutDate, checkOutDate) ||
                other.checkOutDate == checkOutDate) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      lodging,
      user,
      numberOfPeople,
      const DeepCollectionEquality().hash(_room),
      checkInDate,
      checkOutDate,
      totalPrice,
      paymentMethod);

  @override
  String toString() {
    return 'BillModel(id: $id, lodging: $lodging, user: $user, numberOfPeople: $numberOfPeople, room: $room, checkInDate: $checkInDate, checkOutDate: $checkOutDate, totalPrice: $totalPrice, paymentMethod: $paymentMethod)';
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
      LodgingModel? lodging,
      UserModel? user,
      int? numberOfPeople,
      List<RoomModel>? room,
      num? checkInDate,
      num? checkOutDate,
      double? totalPrice,
      String? paymentMethod});

  @override
  $LodgingModelCopyWith<$Res>? get lodging;
  @override
  $UserModelCopyWith<$Res>? get user;
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
    Object? lodging = freezed,
    Object? user = freezed,
    Object? numberOfPeople = freezed,
    Object? room = freezed,
    Object? checkInDate = freezed,
    Object? checkOutDate = freezed,
    Object? totalPrice = freezed,
    Object? paymentMethod = freezed,
  }) {
    return _then(_BillModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lodging: freezed == lodging
          ? _self.lodging
          : lodging // ignore: cast_nullable_to_non_nullable
              as LodgingModel?,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      numberOfPeople: freezed == numberOfPeople
          ? _self.numberOfPeople
          : numberOfPeople // ignore: cast_nullable_to_non_nullable
              as int?,
      room: freezed == room
          ? _self._room
          : room // ignore: cast_nullable_to_non_nullable
              as List<RoomModel>?,
      checkInDate: freezed == checkInDate
          ? _self.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as num?,
      checkOutDate: freezed == checkOutDate
          ? _self.checkOutDate
          : checkOutDate // ignore: cast_nullable_to_non_nullable
              as num?,
      totalPrice: freezed == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentMethod: freezed == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
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

  /// Create a copy of BillModel
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
