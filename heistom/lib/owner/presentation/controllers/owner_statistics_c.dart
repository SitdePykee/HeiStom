import 'package:get/get.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';
import 'package:heistom/owner/data/repository/owner_lodging_repository.dart';

import '../../../common/global_controller.dart';

class TotalStats {
  final num bookings;
  final double revenue;

  TotalStats({
    required this.bookings,
    required this.revenue,
  });
}

class DailyStats {
  final num bookings;
  final double revenue;

  DailyStats({
    required this.bookings,
    required this.revenue,
  });
}

class WeeklyStats {
  final num bookings;
  final Map<String, double> revenue;

  WeeklyStats({
    required this.bookings,
    required this.revenue,
  });
}

class OwnerStatisticsController extends GetxController {
  final lodgingId = RxString('');

  final globalController = Get.find<GlobalController>();

  final stats = RxMap<String, dynamic>();

  final isLoading = RxBool(false);

  final selectedLocation = Rxn<LodgingEntity>();
  final selectedTimeFilter = RxString('Theo ngày');

  final selectedDate = Rx<DateTime>(DateTime(2025, 4, 20));
  final selectedWeekStartDate = Rx<DateTime>(DateTime(2025, 4, 20));

  final locations = RxList<LodgingEntity>([]);
  final timeFilters = RxList<String>(['1 tháng', 'Theo ngày', 'Theo tuần']);

  final totalStats = Rxn<TotalStats>();
  final dailyStats = Rxn<DailyStats>();
  final weeklyStats = Rxn<WeeklyStats>();

  @override
  void onInit() async {
    super.onInit();
    await getLocations();
    await getStats(
        type: 'DAY', startDate: DateTime.now().millisecondsSinceEpoch);
  }

  Future<void> getLocations() async {
    isLoading.value = true;
    final response = await OwnerLodgingRepository()
        .getOwnerLodgings(ownerId: globalController.user.id ?? '');
    locations.value = response;
    selectedLocation.value = locations.first;
  }

  Future<void> getStats({required String type, required num startDate}) async {
    isLoading.value = true;
    final response = await OwnerLodgingRepository().getLodgingStatistics(
      lodgingId: selectedLocation.value?.id ?? '',
      type: type,
      startDate: startDate,
    );

    switch (type) {
      case 'TOTAL':
        totalStats.value = TotalStats(
          bookings: response['bookings'],
          revenue: response['revenue'],
        );
        break;
      case 'DAY':
        dailyStats.value = DailyStats(
          bookings: response['bookings'],
          revenue: response['value'],
        );
        break;
      case 'WEEK':
        weeklyStats.value = WeeklyStats(
          bookings: response['bookings'],
          revenue: Map<String, double>.from(
              response['revenue'] as Map<String, dynamic>),
        );
        print((response));
        break;
    }

    isLoading.value = false;
  }
}
