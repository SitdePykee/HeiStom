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
  int? get capacity;
  UserModel? get owner;
  int? get roomName;

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
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, status, capacity, owner, roomName);

  @override
  String toString() {
    return 'RoomModel(id: $id, status: $status, capacity: $capacity, owner: $owner, roomName: $roomName)';
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
      int? capacity,
      UserModel? owner,
      int? roomName});

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
    Object? capacity = freezed,
    Object? owner = freezed,
    Object? roomName = freezed,
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
      capacity: freezed == capacity
          ? _self.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      roomName: freezed == roomName
          ? _self.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as int?,
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
  _RoomModel({this.id, this.status, this.capacity, this.owner, this.roomName});
  factory _RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  @override
  final String? id;
  @override
  final String? status;
  @override
  final int? capacity;
  @override
  final UserModel? owner;
  @override
  final int? roomName;

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
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, status, capacity, owner, roomName);

  @override
  String toString() {
    return 'RoomModel(id: $id, status: $status, capacity: $capacity, owner: $owner, roomName: $roomName)';
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
      int? capacity,
      UserModel? owner,
      int? roomName});

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
    Object? capacity = freezed,
    Object? owner = freezed,
    Object? roomName = freezed,
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
      capacity: freezed == capacity
          ? _self.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      roomName: freezed == roomName
          ? _self.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as int?,
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
