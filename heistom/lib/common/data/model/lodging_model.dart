import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heistom/common/data/model/review_model.dart';
import 'package:heistom/common/data/model/room_model.dart';
import 'package:heistom/common/data/model/user_model.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';

part 'lodging_model.freezed.dart';
part 'lodging_model.g.dart';

@freezed
sealed class LodgingModel with _$LodgingModel {
  @JsonSerializable()
  factory LodgingModel({
    String? id,
    String? name,
    String? address,
    double? dayPrice,
    double? hourPrice,
    double? area,
    List<String>? image,
    String? description,
    List<String>? amenities,
    List<RoomModel>? rooms,
    double? rating,
    List<ReviewModel>? reviews,
    UserModel? owner,
    num? uploadDate,
    num? lat,
    num? lng,
  }) = _LodgingModel;

  factory LodgingModel.fromJson(Map<String, dynamic> json) =>
      _$LodgingModelFromJson(json);
}

extension LodgingModelX on LodgingModel {
  LodgingEntity toEntity() => LodgingEntity(
        id: id,
        name: name,
        address: address,
        dayPrice: dayPrice,
        hourPrice: hourPrice,
        area: area,
        image: image,
        amenities: amenities,
        rating: rating,
        reviews: reviews?.map((review) => review.toEntity()).toList(),
        rooms: rooms?.map((room) => room.toEntity()).toList(),
        description: description,
        owner: owner?.toEntity(),
        uploadDate: uploadDate,
        lat: lat,
        lng: lng,
      );
}
