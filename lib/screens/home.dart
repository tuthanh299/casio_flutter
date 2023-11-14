import 'package:flutter/material.dart';

import '../components/product.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //banner
                        const Image(
                          image: AssetImage('assets/imgs/topbanner.png'),
                        ),
                        //end banner
                        //sp noi bat
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'SẢN PHẨM NỔI BẬT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //components
                                Product(
                                  src: 'assets/imgs/ga-2140re-1a.jpg',
                                  price: '3.999.000đ',
                                  name: 'CASIO GA-2140RE-1A',
                                  sale: '0',
                                ),
                                //end components
                                //components
                                Product(
                                  src: 'assets/imgs/ga-2140re-1a.jpg',
                                  price: '3.999.000đ',
                                  name: 'CASIO GA-2140RE-1A',
                                  sale: '0',
                                ),
                                //end components
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //components
                                Product(
                                  src: 'assets/imgs/ga-2140re-1a.jpg',
                                  price: '3.999.000đ',
                                  name: 'CASIO GA-2140RE-1A',
                                  sale: '0',
                                ),
                                //end components
                                //components
                                Product(
                                  src: 'assets/imgs/ga-2140re-1a.jpg',
                                  price: '3.999.000đ',
                                  name: 'CASIO GA-2140RE-1A',
                                  sale: '0',
                                ),
                                //end components
                              ],
                            ),
                          ],
                        ),
                        //end sp noi bat
                        //nam
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'ĐỒNG HỒ NAM',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //components
                                Product(
                                  src: 'assets/imgs/ga-2140re-1a.jpg',
                                  price: '3.999.000đ',
                                  name: 'CASIO GA-2140RE-1A',
                                  sale: '0',
                                ),
                                //end components
                                //components
                                Product(
                                  src: 'assets/imgs/ga-2140re-1a.jpg',
                                  price: '3.999.000đ',
                                  name: 'CASIO GA-2140RE-1A',
                                  sale: '0',
                                ),
                                //end components
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //components
                                Product(
                                  src: 'assets/imgs/ga-2140re-1a.jpg',
                                  price: '3.999.000đ',
                                  name: 'CASIO GA-2140RE-1A',
                                  sale: '0',
                                ),
                                //end components
                                //components
                                Product(
                                  src: 'assets/imgs/ga-2140re-1a.jpg',
                                  price: '3.999.000đ',
                                  name: 'CASIO GA-2140RE-1A',
                                  sale: '0',
                                ),
                                //end components
                              ],
                            ),
                          ],
                        ),
                        //end nam
                        //nu
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'ĐỒNG HỒ NỮ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //components
                                Product(
                                  src: 'assets/imgs/ga-2140re-1a.jpg',
                                  price: '3.999.000đ',
                                  name: 'CASIO GA-2140RE-1A',
                                  sale: '0',
                                ),
                                //end components
                                //components
                                Product(
                                  src: 'assets/imgs/ga-2140re-1a.jpg',
                                  price: '3.999.000đ',
                                  name: 'CASIO GA-2140RE-1A',
                                  sale: '0',
                                ),
                                //end components
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //components
                                Product(
                                  src: 'assets/imgs/ga-2140re-1a.jpg',
                                  price: '3.999.000đ',
                                  name: 'CASIO GA-2140RE-1A',
                                  sale: '0',
                                ),
                                //end components
                                //components
                                Product(
                                  src: 'assets/imgs/ga-2140re-1a.jpg',
                                  price: '3.999.000đ',
                                  name: 'CASIO GA-2140RE-1A',
                                  sale: '0',
                                ),
                                //end components
                              ],
                            ),
                          ],
                        ),
                        //end nu
                        //tre em
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'ĐỒNG HỒ TRẺ EM',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //components
                                Product(
                                  src: 'assets/imgs/ga-2140re-1a.jpg',
                                  price: '3.999.000đ',
                                  name: 'CASIO GA-2140RE-1A',
                                  sale: '0',
                                ),
                                //end components
                                //components
                                Product(
                                  src: 'assets/imgs/ga-2140re-1a.jpg',
                                  price: '3.999.000đ',
                                  name: 'CASIO GA-2140RE-1A',
                                  sale: '0',
                                ),
                                //end components
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //components
                                Product(
                                  src: 'assets/imgs/ga-2140re-1a.jpg',
                                  price: '3.999.000đ',
                                  name: 'CASIO GA-2140RE-1A',
                                  sale: '0',
                                ),
                                //end components
                                //components
                                Product(
                                  src: 'assets/imgs/ga-2140re-1a.jpg',
                                  price: '5.010.000đ',
                                  name: 'CASIO GA-2140RE-1A',
                                  sale: '3.999.000đ',
                                ),
                                //end components
                              ],
                            ),
                          ],
                        ),
                        //end tre em
                        //banner cuoi
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, MediaQuery.of(context).size.height / 20),
                          child: Image(
                            image: const AssetImage('assets/imgs/bottombanner.jpg'),
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        //end banner cuoi
                      ],
                    ),
                  ],
                )
            ),
          ],
        )
      ),
    );
  }
}
