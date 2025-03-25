import 'package:flutter/material.dart';
import 'package:anbd/data/dto/response/share_post_response.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TopImage extends StatefulWidget {
  final SharePostResponse product;

  const TopImage({super.key, required this.product});

  @override
  State<TopImage> createState() => _TopImageState();
}

class _TopImageState extends State<TopImage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = widget.product.images.isNotEmpty
        ? widget.product.images
        : ["assets/images/placeholder.png"];

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 390,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final imageUrl = imageUrls[index];
              return imageUrl.startsWith("http")
                  ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/placeholder.png",
                    fit: BoxFit.cover,
                  );
                },
              )
                  : Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: SmoothPageIndicator(
            controller: _pageController,
            count: imageUrls.length,
            effect: WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: Colors.white,
              dotColor: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
