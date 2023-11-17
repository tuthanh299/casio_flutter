import 'package:flutter/material.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  TextEditingController txtOldPass = TextEditingController();
  TextEditingController txtNewPass = TextEditingController();
  TextEditingController txtRePass = TextEditingController();
  TextEditingController txtAdd = TextEditingController();
  double cochu = 18;
  bool oldPass = true;
  bool newPass = true;
  bool rePass = true;

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
                              'ĐỔI MẬT KHẨU',
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
                  //Ô nhập mk cũ
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mật khẩu cũ:',
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
                            controller: txtOldPass,
                            obscureText: oldPass,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                border: InputBorder.none,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      oldPass = !oldPass;
                                    });
                                  },
                                  child: Icon(
                                    oldPass ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: 'Nhập mật khẩu cũ',
                                hintStyle: TextStyle(color: Colors.black, fontSize: 15)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //end ô mk cũ
                  //Ô nhập mk mới
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mật khẩu mới:',
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
                            controller: txtNewPass,
                            obscureText: newPass,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                border: InputBorder.none,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      newPass = !newPass;
                                    });
                                  },
                                  child: Icon(
                                    newPass ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: 'Nhập mật khẩu mới',
                                hintStyle: const TextStyle(color: Colors.black, fontSize: 15)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //end ô mk mới
                  //Ô nhập lại mk mới
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nhập lại mật khẩu mới:',
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
                            controller: txtRePass,
                            obscureText: rePass,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                border: InputBorder.none,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      rePass = !rePass;
                                    });
                                  },
                                  child: Icon(
                                    rePass ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: 'Nhập lại mật khẩu mới',
                                hintStyle: const TextStyle(color: Colors.black, fontSize: 15)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //end ô nhập lại mật khẩu
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
    );
  }
}
