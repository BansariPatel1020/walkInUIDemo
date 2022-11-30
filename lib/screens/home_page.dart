import 'package:flutter/material.dart';
import '../index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showSafetyGuildLines = true;
  late List<Widget> imageSliders;
  final List<String> imgList = [
    ImagePath.offer,
    ImagePath.offer,
    ImagePath.offer,
  ];

  List<Choice> choices = const <Choice>[
    Choice(title: 'Saloon', icon: ImagePath.saloon),
    Choice(title: 'Retail', icon: ImagePath.retail),
    Choice(title: 'Malls', icon: ImagePath.malls),
    Choice(title: 'GYM', icon: ImagePath.gym),
    Choice(title: 'Restaurant', icon: ImagePath.restaurant),
    Choice(title: 'Grocery', icon: ImagePath.grocery),
    Choice(title: 'Saloon', icon: ImagePath.saloon),
    Choice(title: 'Retail', icon: ImagePath.retail),
    Choice(title: 'Malls', icon: ImagePath.malls),
  ];

  @override
  void initState() {
    super.initState();
    imageSliders = imgList
        .map((item) => Container(
              margin: const EdgeInsets.all(10.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                  )),
            ))
        .toList();
  }

  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          imgSlider(),
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(choices.length, (index) {
              return Center(
                child: SelectCard(choice: choices[index]),
              );
            }),
          ),
          safetyGuildLineCard(),
          const SizedBox(height: 80)
        ],
      ),
    );
  }

  Widget imgSlider() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget safetyGuildLineCard() {
    return Visibility(
      visible: showSafetyGuildLines,
      child: Container(
        width: double.infinity,
        height: 200,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blue.shade50,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children:  [
                  Align(
                    alignment: Alignment.center,
                    child: Text('Stay Safe',style: staySafeTextStyle(),),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: ()  =>setState(() {
                        showSafetyGuildLines=false;
                      }),
                      child: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  safetyCard(ImagePath.wearMaskImg, 'Always wear a mask'),
                  safetyCard(ImagePath.washHandsImg, 'Wash Hands'),
                  safetyCard(ImagePath.keepDistanceImg, 'Keep distance from other people')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget safetyCard(String img, String title) {
    return Container(
        height:150,
        width: 100,
        alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 80,child: Image.asset(img)),
          const SizedBox(height: 5),
          Text(
            title,
            style: safetyGuidlineTextStyle(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
