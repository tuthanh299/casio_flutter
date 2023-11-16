import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController txtSearch = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50,),
          TextField(
            controller: txtSearch,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              prefixIcon: Icon(Icons.search_outlined),
              hintText: 'Nhập tên sản phẩm'
            ),
          ),
          const SizedBox(height: 30,),
          const Text('SẢN PHẨM TÌM KIẾM', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
          Expanded(
              child: ListView(
                children: [
                  Placeholder(),
                ],
              ),
          ),
          //navbar
          /*NavigationBar(
            height: 30,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined, color: Colors.white,),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.search_outlined, color: Colors.white,),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.menu_outlined, color: Colors.white,),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.white,),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline_outlined, color: Colors.white,),
                label: '',
              ),
            ],
            backgroundColor: Colors.black,
          ),*/
          //end navbar
        ],
      ),
    );
  }
}
