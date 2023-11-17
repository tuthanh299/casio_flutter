import 'package:flutter/material.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({Key? key}) : super(key: key);

  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  TextEditingController txtFullname = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtAdd = TextEditingController();
  double cochu = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView(
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
                              'THÔNG TIN NGƯỜI DÙNG',
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
                  const SizedBox(height: 40,),
                  //sửa thông tin
                  //Ô nhập họ tên
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Họ tên:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.black26,
                          ),
                          width: MediaQuery.of(context).size.width / 1,
                          child: TextField(
                            controller: txtFullname,
                            obscureText: false,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              border: InputBorder.none,
                              hintText: 'Nhập họ tên',
                              hintStyle: TextStyle(color: Colors.black, fontSize: 15)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //end ô họ tên
                  //Ô sđt
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Số điện thoại:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.black26,
                          ),
                          width: MediaQuery.of(context).size.width / 1,
                          child: TextField(
                            controller: txtPhone,
                            obscureText: false,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                border: InputBorder.none,
                                hintText: 'Nhập số điện thoại',
                                hintStyle: TextStyle(color: Colors.black, fontSize: 15)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //end ô số điện thoạt
                  //Ô nhập mail
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.black26,
                          ),
                          width: MediaQuery.of(context).size.width / 1,
                          child: TextField(
                            controller: txtEmail,
                            obscureText: false,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                border: InputBorder.none,
                                hintText: 'Nhập email',
                                hintStyle: TextStyle(color: Colors.black, fontSize: 15)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //end ô nhập mail
                  //Ô nhập địa chỉ
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Địa chỉ:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.black26,
                          ),
                          width: MediaQuery.of(context).size.width / 1,
                          child: TextField(
                            controller: txtAdd,
                            obscureText: false,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                                border: InputBorder.none,
                                hintText: 'Nhập địa chỉ',
                                hintStyle: TextStyle(color: Colors.black, fontSize: 15)
                            ),
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                  //end ô nhập địa chỉ
                  //end sửa thông tin
                  //nút lưu
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          color: Colors.lightGreenAccent
                      ),
                      child: const Center(child: Text('Lưu', style: TextStyle(fontSize: 20),),),
                    ),
                  ),
                ],
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
    );
  }
}
