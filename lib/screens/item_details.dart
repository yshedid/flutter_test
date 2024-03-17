import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ItemDetails extends StatefulWidget {
  ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  List imges = [
    "assets/images/download.jpeg",
    "assets/images/chair2.jpeg",
    "assets/images/chair3.jpeg"
  ];
  int activeIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ch1 Details"),
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: 250,
              width: 340,
              child: CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: imges.length,
                  itemBuilder: (ctx, idx, realIdx) {
                    final imageAddress = imges[idx];
                    return imageBuilder(imageAddress);
                  },
                  options: CarouselOptions(
                      height: 300,
                      onPageChanged: (idx, res) {
                        setState(() {
                          activeIndex = idx;
                        });
                      })),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      carouselController.previousPage();
                    });
                  },
                  icon: Icon(Icons.arrow_back)),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: imges.length,
                effect: ExpandingDotsEffect(dotWidth: 10, dotHeight: 10),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      carouselController.nextPage();
                    });
                  },
                  icon: Icon(Icons.arrow_forward)),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("ch1",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                const Text("5 Stars",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
              ],
            ),
          ),
          const Center(
            child: Text(
              "DocsDocsDocsDocsDocsDocs",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          build_items_button(color:Colors.yellow,text:"Add to cart"),
          build_items_button(color:Colors.orange,text:"Buy Now"),
        ],
      ),
    );
  }

  Padding build_items_button({required color, required text}) {
    return Padding(
          padding: const EdgeInsets.only(top: 8,left: 16,right:
          16),
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ),
              child:  Text(
                text,
                style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
        );
  }

  Widget imageBuilder(imageAddress) {
    return (SizedBox(
      width: 200,
      height: 300,
      child: Image.asset(imageAddress),
    ));
  }
}
