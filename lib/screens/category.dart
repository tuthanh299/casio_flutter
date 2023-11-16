import 'package:casio_flutter/screens/child.dart';
import 'package:casio_flutter/screens/women.dart';
import 'package:flutter/material.dart';

import 'men.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black26,
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ListView(
                  children: [
                    //nam
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const Men())
                        );
                      },
                      child: Container(
                          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width /10, MediaQuery.of(context).size.height / 5, MediaQuery.of(context).size.width /10, 0),
                          height: 60,
                          width: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black54
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              color: Colors.black54
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 20,),
                              const Text('NAM', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                              SizedBox(width: MediaQuery.of(context).size.width / 1.95),
                              const Icon(Icons.arrow_forward_ios, color: Colors.white,)
                            ],
                          )
                      ),
                    ),
                    //end nam
                    //nu
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const Women())
                        );
                      },
                      child: Container(
                          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width /10, MediaQuery.of(context).size.height / 30, MediaQuery.of(context).size.width /10, 0),
                          height: 60,
                          width: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black54
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              color: Colors.black54
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 20,),
                              const Text('NỮ', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                              SizedBox(width: MediaQuery.of(context).size.width / 1.81),
                              const Icon(Icons.arrow_forward_ios, color: Colors.white,)
                            ],
                          )
                      ),
                    ),
                    //end nữ
                    //tre em
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const Child())
                        );
                      },
                      child: Container(
                          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width /10, MediaQuery.of(context).size.height / 30, MediaQuery.of(context).size.width /10, 0),
                          height: 60,
                          width: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black54
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              color: Colors.black54
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 20,),
                              const Text('TRẺ EM', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                              SizedBox(width: MediaQuery.of(context).size.width / 2.26),
                              const Icon(Icons.arrow_forward_ios, color: Colors.white,)
                            ],
                          )
                      ),
                    ),
                    //end tre em
                    //back
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width /10, MediaQuery.of(context).size.height / 30, MediaQuery.of(context).size.width /10, 0),
                          height: 60,
                          width: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black54
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              color: Colors.black54
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 20,),
                              const Icon(Icons.arrow_back_ios, color: Colors.white,),
                              SizedBox(width: MediaQuery.of(context).size.width / 5.8),
                              const Text('QUAY LẠI', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                            ],
                          )
                      ),
                    ),
                    //end back
                  ],
                ),
              )
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
            )*/
            //end navbar
          ],
        ),
      )
    );
  }
}
