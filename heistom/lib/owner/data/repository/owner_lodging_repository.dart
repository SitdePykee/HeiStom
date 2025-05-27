import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:heistom/common/data/model/lodging_model.dart';

import '../../../common/data/model/user_model.dart';
import '../../../common/domain/entity/lodging_entity.dart';
import '../../../common/global_controller.dart';
import '../model/lodging_booking_detail_model.dart';
import '../model/lodging_booking_model.dart';
import '../model/room_status_model.dart';

class OwnerLodgingRepository {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:8080/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  Future<List<LodgingEntity>> getOwnerLodgings(
      {required String ownerId}) async {
    final response = await dio.get(
      'v1/lodging/my',
      queryParameters: {
        'ownerId': ownerId,
      },
    );

    return response.data['data']
        .map((e) => LodgingModel.fromJson(e).toEntity())
        .toList()
        .cast<LodgingEntity>();
  }

  Future<List<LodgingBookingModel>> getOwnerLodgingBookings(
      {required String ownerId}) async {
    final response = await dio.get(
      'v1/lodging/book-list',
      queryParameters: {
        'ownerId': ownerId,
      },
    );

    return response.data['data']
        .map((e) => LodgingBookingModel.fromJson(e))
        .toList()
        .cast<LodgingBookingModel>();
  }

  Future<LodgingBookingDetailModel> getBookingDetail(
      {required String bookingId}) async {
    final response = await dio.get(
      'v1/lodging/book',
      queryParameters: {
        'bookingId': bookingId,
      },
    );
    return LodgingBookingDetailModel.fromJson(response.data['data']);
  }

  Future<List<RoomStatusModel>> getRoomStatus(
      {required String lodgingId}) async {
    final response = await dio.get(
      'v1/room/status',
      queryParameters: {
        'lodgingId': lodgingId,
      },
    );

    return response.data['data']
        .map((e) => RoomStatusModel.fromJson(e))
        .toList()
        .cast<RoomStatusModel>();
  }

  Future<Map<String, dynamic>> getLodgingStatistics({
    required String lodgingId,
    required String type,
    required num startDate,
  }) async {
    final response = await dio.post(
      'v1/lodging/statistics',
      data: {
        'lodgingId': lodgingId,
        'type': type,
        'startDate': startDate,
      },
    );

    return response.data['data'];
  }

  Future<void> createLodging(Map<String, dynamic> data) async {
    print(jsonEncode(data));
    final response = await dio.post('v1/lodging', data: data);
    return response.data['data'];
  }

  Future<UserModel> updateUser(Map<String, dynamic> data) async {
    final userId = Get.find<GlobalController>().user.id;
    final response = await dio.put(
      'v1/user/update',
      queryParameters: {
        'userId': userId,
      },
      data: data,
    );
    return UserModel.fromJson(response.data['data']);
  }
}
