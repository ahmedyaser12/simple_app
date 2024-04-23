import 'package:flutter/material.dart';
import 'package:simply_app/screens/home/data/get_gallery/gallery_model.dart';

class DisplayGallery extends StatelessWidget {
  final GalleryModel model;

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
      itemCount: model.data!.images!.length,
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child:
                  Image.network(model.data!.images![index], fit: BoxFit.fill),
            ),
          ),
        );
      },
    );
  }
}
