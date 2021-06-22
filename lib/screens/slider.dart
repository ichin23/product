import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slider")),
      body: Center(
        child: Column(
          children: [
            CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(height: 200),
                items: [1, 2]
                    .map((e) => Container(
                          width: 200,
                          alignment: Alignment.center,
                          color: Colors.blue,
                          child: CarouselSlider(
                              options:
                                  CarouselOptions(enableInfiniteScroll: true),
                              items: [
                                Text(e.toString(),
                                    style: TextStyle(fontSize: 30)),
                              ]),
                        ))
                    .toList()),
            Row(
              children: [
                TextButton(
                  child: Text('revante'),
                  onPressed: () {
                    _controller.previousPage();
                  },
                ),
                TextButton(
                  child: Text('avante'),
                  onPressed: () {
                    _controller.nextPage();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
