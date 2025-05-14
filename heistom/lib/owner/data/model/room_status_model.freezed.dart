// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoomStatusModel {
  RoomModel? get room;
  UserModel? get user;
  BookingModel? get booking;

  /// Create a copy of RoomStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoomStatusModelCopyWith<RoomStatusModel> get copyWith =>
      _$RoomStatusModelCopyWithImpl<RoomStatusModel>(
          this as RoomStatusModel, _$identity);

  /// Serializes this RoomStatusModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoomStatusModel &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.booking, booking) || other.booking == booking));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, room, user, booking);

  @override
  String toString() {
    return 'RoomStatusModel(room: $room, user: $user, booking: $booking)';
  }
}

/// @nodoc
abstract mixin class $RoomStatusModelCopyWith<$Res> {
  factory $RoomStatusModelCopyWith(
          RoomStatusModel value, $Res Function(RoomStatusModel) _then) =
      _$RoomStatusModelCopyWithImpl;
  @useResult
  $Res call({RoomModel? room, UserModel? user, BookingModel? booking});

  $RoomModelCopyWith<$Res>? get room;
  $UserModelCopyWith<$Res>? get user;
  $BookingModelCopyWith<$Res>? get booking;
}

/// @nodoc
class _$RoomStatusModelCopyWithImpl<$Res>
    implements $RoomStatusModelCopyWith<$Res> {
  _$RoomStatusModelCopyWithImpl(this._self, this._then);

  final RoomStatusModel _self;
  final $Res Function(RoomStatusModel) _then;

  /// Create a copy of RoomStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = freezed,
    Object? user = freezed,
    Object? booking = freezed,
  }) {
    return _then(_self.copyWith(
      room: freezed == room
          ? _self.room
          : room // ignore: cast_nullable_to_non_nullable
              as RoomModel?,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      booking: freezed == booking
          ? _self.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as BookingModel?,
    ));
  }

  /// Create a copy of RoomStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoomModelCopyWith<$Res>? get room {
    if (_self.room == null) {
      return null;
    }

    return $RoomModelCopyWith<$Res>(_self.room!, (value) {
      return _then(_self.copyWith(room: value));
    });
  }

  /// Create a copy of RoomStatusModel
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

  /// Create a copy of RoomStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingModelCopyWith<$Res>? get booking {
    if (_self.booking == null) {
      return null;
    }

    return $BookingModelCopyWith<$Res>(_self.booking!, (value) {
      return _then(_self.copyWith(booking: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _RoomStatusModel implements RoomStatusModel {
  _RoomStatusModel({this.room, this.user, this.booking});
  factory _RoomStatusModel.fromJson(Map<String, dynamic> json) =>
      _$RoomStatusModelFromJson(json);

  @override
  final RoomModel? room;
  @override
  final UserModel? user;
  @override
  final BookingModel? booking;

  /// Create a copy of RoomStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoomStatusModelCopyWith<_RoomStatusModel> get copyWith =>
      __$RoomStatusModelCopyWithImpl<_RoomStatusModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RoomStatusModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoomStatusModel &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.booking, booking) || other.booking == booking));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, room, user, booking);

  @override
  String toString() {
    return 'RoomStatusModel(room: $room, user: $user, booking: $booking)';
  }
}

/// @nodoc
abstract mixin class _$RoomStatusModelCopyWith<$Res>
    implements $RoomStatusModelCopyWith<$Res> {
  factory _$RoomStatusModelCopyWith(
          _RoomStatusModel value, $Res Function(_RoomStatusModel) _then) =
      __$RoomStatusModelCopyWithImpl;
  @override
  @useResult
  $Res call({RoomModel? room, UserModel? user, BookingModel? booking});

  @override
  $RoomModelCopyWith<$Res>? get room;
  @override
  $UserModelCopyWith<$Res>? get user;
  @override
  $BookingModelCopyWith<$Res>? get booking;
}

/// @nodoc
class __$RoomStatusModelCopyWithImpl<$Res>
    implements _$RoomStatusModelCopyWith<$Res> {
  __$RoomStatusModelCopyWithImpl(this._self, this._then);

  final _RoomStatusModel _self;
  final $Res Function(_RoomStatusModel) _then;

  /// Create a copy of RoomStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? room = freezed,
    Object? user = freezed,
    Object? booking = freezed,
  }) {
    return _then(_RoomStatusModel(
      room: freezed == room
          ? _self.room
          : room // ignore: cast_nullable_to_non_nullable
              as RoomModel?,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      booking: freezed == booking
          ? _self.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as BookingModel?,
    ));
  }

  /// Create a copy of RoomStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoomModelCopyWith<$Res>? get room {
    if (_self.room == null) {
      return null;
    }

    return $RoomModelCopyWith<$Res>(_self.room!, (value) {
      return _then(_self.copyWith(room: value));
    });
  }

  /// Create a copy of RoomStatusModel
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

  /// Create a copy of RoomStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingModelCopyWith<$Res>? get booking {
    if (_self.booking == null) {
      return null;
    }

    return $BookingModelCopyWith<$Res>(_self.booking!, (value) {
      return _then(_self.copyWith(booking: value));
    });
  }
}

/// @nodoc
mixin _$RoomModel {
  String? get id;
  num? get roomName;
  num? get capacity;
  String? get status;

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
            (identical(other.roomName, roomName) ||
                other.roomName == roomName) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, roomName, capacity, status);

  @override
  String toString() {
    return 'RoomModel(id: $id, roomName: $roomName, capacity: $capacity, status: $status)';
  }
}

/// @nodoc
abstract mixin class $RoomModelCopyWith<$Res> {
  factory $RoomModelCopyWith(RoomModel value, $Res Function(RoomModel) _then) =
      _$RoomModelCopyWithImpl;
  @useResult
  $Res call({String? id, num? roomName, num? capacity, String? status});
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
    Object? roomName = freezed,
    Object? capacity = freezed,
    Object? status = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      roomName: freezed == roomName
          ? _self.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as num?,
      capacity: freezed == capacity
          ? _self.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as num?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RoomModel implements RoomModel {
  _RoomModel({this.id, this.roomName, this.capacity, this.status});
  factory _RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  @override
  final String? id;
  @override
  final num? roomName;
  @override
  final num? capacity;
  @override
  final String? status;

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
            (identical(other.roomName, roomName) ||
                other.roomName == roomName) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, roomName, capacity, status);

  @override
  String toString() {
    return 'RoomModel(id: $id, roomName: $roomName, capacity: $capacity, status: $status)';
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
  $Res call({String? id, num? roomName, num? capacity, String? status});
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
    Object? roomName = freezed,
    Object? capacity = freezed,
    Object? status = freezed,
  }) {
    return _then(_RoomModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      roomName: freezed == roomName
          ? _self.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as num?,
      capacity: freezed == capacity
          ? _self.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as num?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$BookingModel {
  String? get bookingId;
  String? get lodgingId;
  String? get userId;
  String? get roomId;
  num? get checkInAt;
  num? get checkOutAt;
  bool? get isBankTransfer;
  num? get numOfRoom;

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookingModelCopyWith<BookingModel> get copyWith =>
      _$BookingModelCopyWithImpl<BookingModel>(
          this as BookingModel, _$identity);

  /// Serializes this BookingModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookingModel &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.lodgingId, lodgingId) ||
                other.lodgingId == lodgingId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
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
  int get hashCode => Object.hash(runtimeType, bookingId, lodgingId, userId,
      roomId, checkInAt, checkOutAt, isBankTransfer, numOfRoom);

  @override
  String toString() {
    return 'BookingModel(bookingId: $bookingId, lodgingId: $lodgingId, userId: $userId, roomId: $roomId, checkInAt: $checkInAt, checkOutAt: $checkOutAt, isBankTransfer: $isBankTransfer, numOfRoom: $numOfRoom)';
  }
}

/// @nodoc
abstract mixin class $BookingModelCopyWith<$Res> {
  factory $BookingModelCopyWith(
          BookingModel value, $Res Function(BookingModel) _then) =
      _$BookingModelCopyWithImpl;
  @useResult
  $Res call(
      {String? bookingId,
      String? lodgingId,
      String? userId,
      String? roomId,
      num? checkInAt,
      num? checkOutAt,
      bool? isBankTransfer,
      num? numOfRoom});
}

/// @nodoc
class _$BookingModelCopyWithImpl<$Res> implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._self, this._then);

  final BookingModel _self;
  final $Res Function(BookingModel) _then;

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = freezed,
    Object? lodgingId = freezed,
    Object? userId = freezed,
    Object? roomId = freezed,
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
      lodgingId: freezed == lodgingId
          ? _self.lodgingId
          : lodgingId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: freezed == roomId
          ? _self.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String?,
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
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _BookingModel implements BookingModel {
  _BookingModel(
      {this.bookingId,
      this.lodgingId,
      this.userId,
      this.roomId,
      this.checkInAt,
      this.checkOutAt,
      this.isBankTransfer,
      this.numOfRoom});
  factory _BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);

  @override
  final String? bookingId;
  @override
  final String? lodgingId;
  @override
  final String? userId;
  @override
  final String? roomId;
  @override
  final num? checkInAt;
  @override
  final num? checkOutAt;
  @override
  final bool? isBankTransfer;
  @override
  final num? numOfRoom;

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookingModelCopyWith<_BookingModel> get copyWith =>
      __$BookingModelCopyWithImpl<_BookingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookingModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookingModel &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.lodgingId, lodgingId) ||
                other.lodgingId == lodgingId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
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
  int get hashCode => Object.hash(runtimeType, bookingId, lodgingId, userId,
      roomId, checkInAt, checkOutAt, isBankTransfer, numOfRoom);

  @override
  String toString() {
    return 'BookingModel(bookingId: $bookingId, lodgingId: $lodgingId, userId: $userId, roomId: $roomId, checkInAt: $checkInAt, checkOutAt: $checkOutAt, isBankTransfer: $isBankTransfer, numOfRoom: $numOfRoom)';
  }
}

/// @nodoc
abstract mixin class _$BookingModelCopyWith<$Res>
    implements $BookingModelCopyWith<$Res> {
  factory _$BookingModelCopyWith(
          _BookingModel value, $Res Function(_BookingModel) _then) =
      __$BookingModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? bookingId,
      String? lodgingId,
      String? userId,
      String? roomId,
      num? checkInAt,
      num? checkOutAt,
      bool? isBankTransfer,
      num? numOfRoom});
}

/// @nodoc
class __$BookingModelCopyWithImpl<$Res>
    implements _$BookingModelCopyWith<$Res> {
  __$BookingModelCopyWithImpl(this._self, this._then);

  final _BookingModel _self;
  final $Res Function(_BookingModel) _then;

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bookingId = freezed,
    Object? lodgingId = freezed,
    Object? userId = freezed,
    Object? roomId = freezed,
    Object? checkInAt = freezed,
    Object? checkOutAt = freezed,
    Object? isBankTransfer = freezed,
    Object? numOfRoom = freezed,
  }) {
    return _then(_BookingModel(
      bookingId: freezed == bookingId
          ? _self.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      lodgingId: freezed == lodgingId
          ? _self.lodgingId
          : lodgingId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: freezed == roomId
          ? _self.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String?,
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
}

// dart format on
