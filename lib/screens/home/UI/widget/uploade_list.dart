import 'package:flutter/material.dart';

class UploadPhotos extends StatelessWidget {
  const UploadPhotos({super.key});

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
      itemCount: 30,
      itemBuilder: (context, index) {
        return Column(
          children: [
            buildCard(),
          ],
        );
      },
    );
  }
}

buildCard() {
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
            Image.asset('assets/images/2.0x/background.png', fit: BoxFit.fill),
      ),
    ),
  );
}
