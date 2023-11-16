import 'package:casio_flutter/screens/aboutme.dart';
import 'package:casio_flutter/screens/category.dart';
import 'package:casio_flutter/screens/contact.dart';
import 'package:casio_flutter/screens/invoice.dart';
import 'package:casio_flutter/screens/policy.dart';
import 'package:flutter/material.dart';

class AppInfo extends StatefulWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  State<AppInfo> createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
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
                      //về chúng tôi
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const AboutMe())
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
                                const Text('Về chúng tôi', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                                SizedBox(width: MediaQuery.of(context).size.width / 2.8),
                                const Icon(Icons.arrow_forward_ios, color: Colors.white,)
                              ],
                            )
                        ),
                      ),
                      //end về chúng tôi
                      //Danh mục sp
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const Category())
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
                                const Text('Danh mục sản phẩm', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                                SizedBox(width: MediaQuery.of(context).size.width / 6),
                                const Icon(Icons.arrow_forward_ios, color: Colors.white,)
                              ],
                            )
                        ),
                      ),
                      //end Danh mục sp
                      //liên hệ
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const Contact())
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
                                const Text('Liên hệ', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                                SizedBox(width: MediaQuery.of(context).size.width / 2.18),
                                const Icon(Icons.arrow_forward_ios, color: Colors.white,)
                              ],
                            )
                        ),
                        ),
                      //end liên hệ
                      //các chính sách
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const Policy())
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
                                const Text('Các chính sách', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                                SizedBox(width: MediaQuery.of(context).size.width / 3.65),
                                const Icon(Icons.arrow_forward_ios, color: Colors.white,)
                              ],
                            )
                        ),
                      ),
                      //end các chính sách
                      //ls mua hàng
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const Invoice())
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
                                const Text('Lịch sử mua hàng', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                                SizedBox(width: MediaQuery.of(context).size.width / 4.75),
                                const Icon(Icons.arrow_forward_ios, color: Colors.white,)
                              ],
                            )
                        ),
                      )
                      //end ls mua hàng
                    ],
                  ),
                )
            ),
            //navbar
            /*
            NavigationBar(
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
            )
             */
            //end navbar
          ],
        ),
      )
    );
  }
}
