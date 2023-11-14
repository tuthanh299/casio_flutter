
import 'package:flutter/material.dart';


import 'home.dart';

class Hold extends StatefulWidget {
  const Hold({Key? key}) : super(key: key);

  @override
  State<Hold> createState() => _HoldState();
}

class _HoldState extends State<Hold> {
  int onPage = 0;
  List<Widget> list = const [
    Home(),
    Placeholder(), //search
    Placeholder(), //appinfo
    Placeholder(), //cart
    Placeholder(),//info
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 50,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            label: 'Trang chủ',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.menu_outlined,
              color: Colors.white,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline_outlined,
              color: Colors.white,
            ),
            label: '',
          ),
        ],
        backgroundColor: Colors.black,
        selectedIndex: onPage,
        onDestinationSelected: (int index) {
          setState(() {
            onPage = index;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
      body: list[onPage],
    );
  }
}
