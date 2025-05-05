// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lodging_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LodgingModel {
  String? get id;
  String? get name;
  String? get address;
  double? get dayPrice;
  double? get hourPrice;
  double? get area;
  List<String>? get image;
  String? get description;
  List<String>? get amenities;
  List<RoomModel>? get rooms;
  int? get rating;
  List<ReviewModel>? get reviews;
  UserModel? get owner;
  num? get uploadDate;
  num? get lat;
  num? get lng;

  /// Create a copy of LodgingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LodgingModelCopyWith<LodgingModel> get copyWith =>
      _$LodgingModelCopyWithImpl<LodgingModel>(
          this as LodgingModel, _$identity);

  /// Serializes this LodgingModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LodgingModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.dayPrice, dayPrice) ||
                other.dayPrice == dayPrice) &&
            (identical(other.hourPrice, hourPrice) ||
                other.hourPrice == hourPrice) &&
            (identical(other.area, area) || other.area == area) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.amenities, amenities) &&
            const DeepCollectionEquality().equals(other.rooms, rooms) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(other.reviews, reviews) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.uploadDate, uploadDate) ||
                other.uploadDate == uploadDate) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      dayPrice,
      hourPrice,
      area,
      const DeepCollectionEquality().hash(image),
      description,
      const DeepCollectionEquality().hash(amenities),
      const DeepCollectionEquality().hash(rooms),
      rating,
      const DeepCollectionEquality().hash(reviews),
      owner,
      uploadDate,
      lat,
      lng);

  @override
  String toString() {
    return 'LodgingModel(id: $id, name: $name, address: $address, dayPrice: $dayPrice, hourPrice: $hourPrice, area: $area, image: $image, description: $description, amenities: $amenities, rooms: $rooms, rating: $rating, reviews: $reviews, owner: $owner, uploadDate: $uploadDate, lat: $lat, lng: $lng)';
  }
}

/// @nodoc
abstract mixin class $LodgingModelCopyWith<$Res> {
  factory $LodgingModelCopyWith(
          LodgingModel value, $Res Function(LodgingModel) _then) =
      _$LodgingModelCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? address,
      double? dayPrice,
      double? hourPrice,
      double? area,
      List<String>? image,
      String? description,
      List<String>? amenities,
      List<RoomModel>? rooms,
      int? rating,
      List<ReviewModel>? reviews,
      UserModel? owner,
      num? uploadDate,
      num? lat,
      num? lng});

  $UserModelCopyWith<$Res>? get owner;
}

/// @nodoc
class _$LodgingModelCopyWithImpl<$Res> implements $LodgingModelCopyWith<$Res> {
  _$LodgingModelCopyWithImpl(this._self, this._then);

  final LodgingModel _self;
  final $Res Function(LodgingModel) _then;

  /// Create a copy of LodgingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? dayPrice = freezed,
    Object? hourPrice = freezed,
    Object? area = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? amenities = freezed,
    Object? rooms = freezed,
    Object? rating = freezed,
    Object? reviews = freezed,
    Object? owner = freezed,
    Object? uploadDate = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
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
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      dayPrice: freezed == dayPrice
          ? _self.dayPrice
          : dayPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      hourPrice: freezed == hourPrice
          ? _self.hourPrice
          : hourPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      area: freezed == area
          ? _self.area
          : area // ignore: cast_nullable_to_non_nullable
              as double?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amenities: freezed == amenities
          ? _self.amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      rooms: freezed == rooms
          ? _self.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<RoomModel>?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      reviews: freezed == reviews
          ? _self.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>?,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      uploadDate: freezed == uploadDate
          ? _self.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as num?,
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as num?,
      lng: freezed == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }

  /// Create a copy of LodgingModel
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
class _LodgingModel implements LodgingModel {
  _LodgingModel(
      {this.id,
      this.name,
      this.address,
      this.dayPrice,
      this.hourPrice,
      this.area,
      final List<String>? image,
      this.description,
      final List<String>? amenities,
      final List<RoomModel>? rooms,
      this.rating,
      final List<ReviewModel>? reviews,
      this.owner,
      this.uploadDate,
      this.lat,
      this.lng})
      : _image = image,
        _amenities = amenities,
        _rooms = rooms,
        _reviews = reviews;
  factory _LodgingModel.fromJson(Map<String, dynamic> json) =>
      _$LodgingModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final double? dayPrice;
  @override
  final double? hourPrice;
  @override
  final double? area;
  final List<String>? _image;
  @override
  List<String>? get image {
    final value = _image;
    if (value == null) return null;
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? description;
  final List<String>? _amenities;
  @override
  List<String>? get amenities {
    final value = _amenities;
    if (value == null) return null;
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
  final int? rating;
  final List<ReviewModel>? _reviews;
  @override
  List<ReviewModel>? get reviews {
    final value = _reviews;
    if (value == null) return null;
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserModel? owner;
  @override
  final num? uploadDate;
  @override
  final num? lat;
  @override
  final num? lng;

  /// Create a copy of LodgingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LodgingModelCopyWith<_LodgingModel> get copyWith =>
      __$LodgingModelCopyWithImpl<_LodgingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LodgingModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LodgingModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.dayPrice, dayPrice) ||
                other.dayPrice == dayPrice) &&
            (identical(other.hourPrice, hourPrice) ||
                other.hourPrice == hourPrice) &&
            (identical(other.area, area) || other.area == area) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._amenities, _amenities) &&
            const DeepCollectionEquality().equals(other._rooms, _rooms) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.uploadDate, uploadDate) ||
                other.uploadDate == uploadDate) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      dayPrice,
      hourPrice,
      area,
      const DeepCollectionEquality().hash(_image),
      description,
      const DeepCollectionEquality().hash(_amenities),
      const DeepCollectionEquality().hash(_rooms),
      rating,
      const DeepCollectionEquality().hash(_reviews),
      owner,
      uploadDate,
      lat,
      lng);

  @override
  String toString() {
    return 'LodgingModel(id: $id, name: $name, address: $address, dayPrice: $dayPrice, hourPrice: $hourPrice, area: $area, image: $image, description: $description, amenities: $amenities, rooms: $rooms, rating: $rating, reviews: $reviews, owner: $owner, uploadDate: $uploadDate, lat: $lat, lng: $lng)';
  }
}

/// @nodoc
abstract mixin class _$LodgingModelCopyWith<$Res>
    implements $LodgingModelCopyWith<$Res> {
  factory _$LodgingModelCopyWith(
          _LodgingModel value, $Res Function(_LodgingModel) _then) =
      __$LodgingModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? address,
      double? dayPrice,
      double? hourPrice,
      double? area,
      List<String>? image,
      String? description,
      List<String>? amenities,
      List<RoomModel>? rooms,
      int? rating,
      List<ReviewModel>? reviews,
      UserModel? owner,
      num? uploadDate,
      num? lat,
      num? lng});

  @override
  $UserModelCopyWith<$Res>? get owner;
}

/// @nodoc
class __$LodgingModelCopyWithImpl<$Res>
    implements _$LodgingModelCopyWith<$Res> {
  __$LodgingModelCopyWithImpl(this._self, this._then);

  final _LodgingModel _self;
  final $Res Function(_LodgingModel) _then;

  /// Create a copy of LodgingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? dayPrice = freezed,
    Object? hourPrice = freezed,
    Object? area = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? amenities = freezed,
    Object? rooms = freezed,
    Object? rating = freezed,
    Object? reviews = freezed,
    Object? owner = freezed,
    Object? uploadDate = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_LodgingModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      dayPrice: freezed == dayPrice
          ? _self.dayPrice
          : dayPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      hourPrice: freezed == hourPrice
          ? _self.hourPrice
          : hourPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      area: freezed == area
          ? _self.area
          : area // ignore: cast_nullable_to_non_nullable
              as double?,
      image: freezed == image
          ? _self._image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amenities: freezed == amenities
          ? _self._amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      rooms: freezed == rooms
          ? _self._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<RoomModel>?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      reviews: freezed == reviews
          ? _self._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>?,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      uploadDate: freezed == uploadDate
          ? _self.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as num?,
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as num?,
      lng: freezed == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }

  /// Create a copy of LodgingModel
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
