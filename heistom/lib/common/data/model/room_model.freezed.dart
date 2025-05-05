// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoomModel {
  String? get id;
  String? get status;
  num? get checkInDate;
  num? get checkOutDate;
  int? get capacity;
  UserModel? get owner;

  /// Create a copy of RoomModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoomModelCopyWith<RoomModel> get copyWith =>
      _$RoomModelCopyWithImpl<RoomModel>(this as RoomModel, _$identity);

  /// Serializes this RoomModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoomModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.checkInDate, checkInDate) ||
                other.checkInDate == checkInDate) &&
            (identical(other.checkOutDate, checkOutDate) ||
                other.checkOutDate == checkOutDate) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, status, checkInDate, checkOutDate, capacity, owner);

  @override
  String toString() {
    return 'RoomModel(id: $id, status: $status, checkInDate: $checkInDate, checkOutDate: $checkOutDate, capacity: $capacity, owner: $owner)';
  }
}

/// @nodoc
abstract mixin class $RoomModelCopyWith<$Res> {
  factory $RoomModelCopyWith(RoomModel value, $Res Function(RoomModel) _then) =
      _$RoomModelCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? status,
      num? checkInDate,
      num? checkOutDate,
      int? capacity,
      UserModel? owner});

  $UserModelCopyWith<$Res>? get owner;
}

/// @nodoc
class _$RoomModelCopyWithImpl<$Res> implements $RoomModelCopyWith<$Res> {
  _$RoomModelCopyWithImpl(this._self, this._then);

  final RoomModel _self;
  final $Res Function(RoomModel) _then;

  /// Create a copy of RoomModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? checkInDate = freezed,
    Object? checkOutDate = freezed,
    Object? capacity = freezed,
    Object? owner = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      checkInDate: freezed == checkInDate
          ? _self.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as num?,
      checkOutDate: freezed == checkOutDate
          ? _self.checkOutDate
          : checkOutDate // ignore: cast_nullable_to_non_nullable
              as num?,
      capacity: freezed == capacity
          ? _self.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }

  /// Create a copy of RoomModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get owner {
    if (_self.owner == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.owner!, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }
}

/// @nodoc

@JsonSerializable()
class _RoomModel implements RoomModel {
  _RoomModel(
      {this.id,
      this.status,
      this.checkInDate,
      this.checkOutDate,
      this.capacity,
      this.owner});
  factory _RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  @override
  final String? id;
  @override
  final String? status;
  @override
  final num? checkInDate;
  @override
  final num? checkOutDate;
  @override
  final int? capacity;
  @override
  final UserModel? owner;

  /// Create a copy of RoomModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoomModelCopyWith<_RoomModel> get copyWith =>
      __$RoomModelCopyWithImpl<_RoomModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RoomModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoomModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.checkInDate, checkInDate) ||
                other.checkInDate == checkInDate) &&
            (identical(other.checkOutDate, checkOutDate) ||
                other.checkOutDate == checkOutDate) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, status, checkInDate, checkOutDate, capacity, owner);

  @override
  String toString() {
    return 'RoomModel(id: $id, status: $status, checkInDate: $checkInDate, checkOutDate: $checkOutDate, capacity: $capacity, owner: $owner)';
  }
}

/// @nodoc
abstract mixin class _$RoomModelCopyWith<$Res>
    implements $RoomModelCopyWith<$Res> {
  factory _$RoomModelCopyWith(
          _RoomModel value, $Res Function(_RoomModel) _then) =
      __$RoomModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? status,
      num? checkInDate,
      num? checkOutDate,
      int? capacity,
      UserModel? owner});

  @override
  $UserModelCopyWith<$Res>? get owner;
}

/// @nodoc
class __$RoomModelCopyWithImpl<$Res> implements _$RoomModelCopyWith<$Res> {
  __$RoomModelCopyWithImpl(this._self, this._then);

  final _RoomModel _self;
  final $Res Function(_RoomModel) _then;

  /// Create a copy of RoomModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? checkInDate = freezed,
    Object? checkOutDate = freezed,
    Object? capacity = freezed,
    Object? owner = freezed,
  }) {
    return _then(_RoomModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      checkInDate: freezed == checkInDate
          ? _self.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as num?,
      checkOutDate: freezed == checkOutDate
          ? _self.checkOutDate
          : checkOutDate // ignore: cast_nullable_to_non_nullable
              as num?,
      capacity: freezed == capacity
          ? _self.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }

  /// Create a copy of RoomModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get owner {
    if (_self.owner == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.owner!, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }
}

// dart format on
