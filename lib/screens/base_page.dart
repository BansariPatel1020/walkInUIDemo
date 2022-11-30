import 'package:flutter/material.dart';

import '../index.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pageController = PageController(initialPage: 2);

  int maxCount = 5;

  /// widget list
  final List<Widget> bottomBarPages = [
    const MyBookingsPage(),
    const ScanQRPage(),
    const HomePage(),
    const MyQRPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImagePath.locationIcon,
                height: 20,
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  'NY 11434, USA',
                  style: appBarLocationTextStyle(),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        title: Image.asset(
          ImagePath.appBarIcon,
          height: 45,
        ),
        actions: [
          // const Icon(Icons.filter),
          Image.asset(
            ImagePath.searchIcon,
            scale: 3,
          ),
          Image.asset(
            ImagePath.notificationIcon,
            scale: 3,
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              pageController: _pageController,
              color: Colors.white,
              notchColor: Colors.blue,
              bottomBarItems: [
                BottomBarItem(
                  inActiveItem: Image.asset(ImagePath.ticketIcon),
                  activeItem: Image.asset(
                    ImagePath.ticketIcon,
                    color: Colors.white,
                  ),
                  itemLabel: 'My Bookingss',
                ),
                BottomBarItem(
                  inActiveItem: Image.asset(ImagePath.scanIcon),
                  activeItem: Image.asset(
                    ImagePath.scanIcon,
                    color: Colors.white,
                  ),
                  itemLabel: 'Scan QR',
                ),
                BottomBarItem(
                  inActiveItem: Image.asset(ImagePath.homeIcon),
                  activeItem: Image.asset(
                    ImagePath.homeIcon,
                    color: Colors.white,
                  ),
                  itemLabel: 'Home',
                ),
                BottomBarItem(
                  inActiveItem: Image.asset(ImagePath.qrIcon),
                  activeItem: Image.asset(
                    ImagePath.qrIcon,
                    color: Colors.white,
                  ),
                  itemLabel: 'My QR',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person_outline_rounded,
                    color: Colors.grey,
                  ),
                  activeItem: Icon(
                    Icons.person_outline_rounded,
                    color: Colors.white,
                  ),
                  itemLabel: 'Profile',
                ),
              ],
              onTap: (index) {
                /// control your animation using page controller
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            )
          : null,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
