import 'package:flutter/material.dart';
import 'package:heistom/common/domain/entity/lodging_entity.dart';

class LodgingImagesView extends StatelessWidget {
  final LodgingEntity lodging;
  const LodgingImagesView({super.key, required this.lodging});

  @override
  Widget build(BuildContext context) {
    int imagesPerRow = 3;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: ((lodging.image?.length ?? 0) / imagesPerRow).ceil(),
        itemBuilder: (context, rowIndex) {
          int startIndex = rowIndex * imagesPerRow;
          int endIndex =
              (startIndex + imagesPerRow).clamp(0, lodging.image!.length);
          List<String> imagesToShow =
              lodging.image!.sublist(startIndex, endIndex);

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: imagesToShow.map((image) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
