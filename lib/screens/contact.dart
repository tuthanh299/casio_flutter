import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
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
                      'LIÊN HỆ',
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
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05, bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 40,),
                Text('Hotline 1: 012.345.6789', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 40,),
                Text('Hotline 2: 012.345.6789', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 40,),
                Text('Hotline 3: 012.345.6789', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 40,),
                Text('Email: demo@gmailcom', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            )
          )
        ],
      ),
    );
  }
}
