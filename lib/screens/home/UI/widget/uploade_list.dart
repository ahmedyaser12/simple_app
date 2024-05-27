import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DisplayGallery extends StatefulWidget {
  final List<String> galleryList;

  const DisplayGallery({super.key, required this.galleryList});

  @override
  State<DisplayGallery> createState() => _DisplayGalleryState();
}

class _DisplayGalleryState extends State<DisplayGallery>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> topOfWeekAnimations;
  bool isAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1700),
      vsync: this,
    );
    _setupAnimations();
  }

  void _setupAnimations() {
    topOfWeekAnimations =
        List<Animation<Offset>>.generate(widget.galleryList.length, (index) {
      return Tween<Offset>(
        begin: Offset(index % 3 == 0 ? -index.toDouble() + -1 : index.toDouble(), -1),
        end: const Offset(0.0, 0.0),
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    });
    _controller.forward();
    setState(() {
      isAnimated = true;
    });
  }

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
      itemCount: widget.galleryList.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 100,
          width: 100,
          child: SlideTransition(
            position: topOfWeekAnimations[index],
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
                imageUrl: widget.galleryList[index],
                // URL of the image
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}
