import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DisplayGallery extends StatelessWidget {
  final List<String> model;

  const DisplayGallery({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth < 600
        ? 3
        : screenWidth < 900
            ? 4
            : 5;
    double aspectRatio = screenWidth < 400 ? 1 : 0.75;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: aspectRatio,
        mainAxisSpacing: .06,
        crossAxisSpacing: .7,
      ),
      itemCount: model.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 100,
          width: 100,
          child: Card(
            //margin:   EdgeInsets.all(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: CachedNetworkImage(
              imageBuilder: (
                context,
                ImageProvider imageProvider,
              ) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(image: imageProvider, fit: BoxFit.fill),
                );
              },
              imageUrl: model[index],
              // URL of the image
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }
}
