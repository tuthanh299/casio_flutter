import 'package:flutter/material.dart';

import '../components/product.dart';

class Child extends StatefulWidget {
  const Child({Key? key}) : super(key: key);

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 40,),
          Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      'TRẺ EM',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 10.0),
                              blurRadius: 2.0,
                              color: Colors.black26,
                            )
                          ]
                      ),
                    ),
                  ),
                ],
              )
          ),
          //sp

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
          //end nam
          //end sp
        ],
      ),
    );
  }
}
