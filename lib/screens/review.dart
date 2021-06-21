import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ReviewPage extends StatefulWidget {
  ReviewPage({Key? key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  CarouselController controllerCarousel = CarouselController();
  int atualPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                carouselController: controllerCarousel,
                options: CarouselOptions(
                  onPageChanged: (i, carousel) {
                    setState(() {
                      atualPage = i;
                    });
                  },
                  height: 400.0,
                  enableInfiniteScroll: false,
                ),
                items: [1, 2].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.red),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 200.0,
                            enableInfiniteScroll: false,
                          ),
                          items: [
                            "https://firebasestorage.googleapis.com/v0/b/testeflutter-4d2cf.appspot.com/o/images%2FSksQlVEJ6MY448TIjX295K5AYX52%2Fimage_picker7360288336131424461.jpg?alt=media&token=550afabd-e57f-43db-9744-b067a688a0b6",
                            "https://firebasestorage.googleapis.com/v0/b/testeflutter-4d2cf.appspot.com/o/images%2FSksQlVEJ6MY448TIjX295K5AYX52%2Fimage_picker7360288336131424461.jpg?alt=media&token=550afabd-e57f-43db-9744-b067a688a0b6"
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: Image.network(i));
                              },
                            );
                          }).toList(),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon((atualPage == 0)
                        ? Icons.circle
                        : Icons.circle_outlined),
                    onPressed: () {
                      controllerCarousel.animateToPage(0);
                    },
                  ),
                  IconButton(
                    icon: Icon((atualPage == 1)
                        ? Icons.circle
                        : Icons.circle_outlined),
                    onPressed: () {
                      controllerCarousel.animateToPage(1);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
