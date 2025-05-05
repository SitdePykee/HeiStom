import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heistom/common/amenities.dart';
import 'package:heistom/renter/presentation/controllers/search_controller.dart';

class ChooseAmenitiesDialog extends StatelessWidget {
  final SearchHouseController controller = Get.find();

  ChooseAmenitiesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Amenities> tempSelected = controller.selectedAmenities.toList();

    void toggleAmenity(Amenities amenity) {
      if (tempSelected.contains(amenity)) {
        tempSelected.remove(amenity);
      } else {
        tempSelected.add(amenity);
      }
    }

    return Dialog(
      child: StatefulBuilder(
        builder: (context, setState) {
          return SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Chọn tiện nghi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: Amenities.values.map((amenity) {
                        final isSelected = tempSelected.contains(amenity);
                        return FilterChip(
                          label: Text(
                            amenity.displayName,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          avatar: Icon(
                            amenity.icon,
                            size: 20,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                          backgroundColor: Colors.white,
                          selected: isSelected,
                          onSelected: (_) {
                            setState(() => toggleAmenity(amenity));
                          },
                          selectedColor: Colors.blue,
                          checkmarkColor: Colors.white,
                          showCheckmark: false,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(height: 1),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () => Get.back(),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        child: const Text('Apply'),
                        onPressed: () {
                          controller.selectedAmenities.value = tempSelected;
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
