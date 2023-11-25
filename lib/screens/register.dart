import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/provider.dart';
import '../models/user.dart';
import '../screens/login.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool cpass = true;
  bool crepass = true;
  List<User1> alluser = [];
  TextEditingController txtMail = TextEditingController();
  TextEditingController txtFullName = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtrePass = TextEditingController();

  bool checkUser = false;
  bool checkMail = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  fetch() async {
    var records = await FirebaseFirestore.instance.collection('users').get();
    getAllUser(records);
  }

  getAllUser(QuerySnapshot<Map<String, dynamic>> records) {
    var list = records.docs.map((e) => User1(
      fullname: e['fullname'],
      email: e['email'],
    )).toList();
    alluser = list;
  }

  @override
  void initState() {
    // TODO: implement initState
    fetch();
    super.initState();
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void dispose() {
    txtFullName.dispose();
    txtPass.dispose();
    txtrePass.dispose();
    txtMail.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Future register() async {
      String temp1 = txtMail.text;
      String temp2 = txtFullName.text;
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: txtMail.text.trim(),
          password: txtPass.text.trim(),
        ).then((value){
          final user = User1(
            uid: FirebaseAuth.instance.currentUser?.uid,
            email: temp1,
            fullname: temp2,
            address: '',
            number: '',
          );
          createUser(user, value.user!.uid);
        });
      } on FirebaseAuthException catch (e) {
        switch(e.code) {
          case 'email-already-in-use': {
            ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(const SnackBar(content: Text('Email đã được sử dụng')));
            break;
          }
          case 'invalid-email': {
            ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(const SnackBar(content: Text('Email không hợp lệ')));
            break;
          }
          case 'weak-password': {
            ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(const SnackBar(content: Text('Mật khẩu không đủ 8 kí tự')));
            break;
          }
        }
      }
    }

    return Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //logo
                Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage('assets/imgs/logo.png'),
                          width: 100,
                          height: 100,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'G-SHOCK',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              '40th Anniversary',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                ),
                //end logo
                SizedBox(height: MediaQuery.of(context).size.height / 25),
                //chữ đăng kí
                const Text(
                  'ĐĂNG KÝ',
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
                //end chữ đăng kí
                //Ô nhập mail
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            checkMail = false;
                          });
                        },
                        controller: txtMail,
                        obscureText: false,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Nhập email',
                            hintStyle: TextStyle(color: Colors.black, fontSize: 12)
                        ),
                      ),
                    )
                  ],
                ),
                //end ô nhập mail
                const SizedBox(height: 20,),
                //ô nhập pass
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mật khẩu:',
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
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                        controller: txtPass,
                        obscureText: cpass,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  cpass = !cpass;
                                });
                              },
                              child: Icon(
                                cpass ? Icons.visibility : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                            hintText: 'Nhập mật khẩu',
                            hintStyle: const TextStyle(color: Colors.black, fontSize: 12)
                        ),
                      ),
                    )
                  ],
                ),
                //end ô nhập pass
                const SizedBox(height: 20,),
                //ô nhập repass
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Xác nhận mật khẩu:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.black26,
                      ),
                      child: TextField(
                        controller: txtrePass,
                        obscureText: crepass,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                crepass = !crepass;
                              });
                            },
                            child: Icon(
                              crepass ? Icons.visibility : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          hintText: 'Nhập lại mật khẩu',
                          hintStyle: const TextStyle(color: Colors.black, fontSize: 12)
                        ),
                      ),
                    )
                  ],
                ),
                //end ô nhập repass
                //Ô nhập họ tên
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                        controller: txtFullName,
                        obscureText: false,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Nhập họ tên',
                            hintStyle: TextStyle(color: Colors.black, fontSize: 12)
                        ),
                      ),
                    )
                  ],
                ),
                //end ô nhập họ tên
                SizedBox(height: MediaQuery.of(context).size.height / 8),
                //nút đăng kí
                ElevatedButton(
                  onPressed: () async {
                    for(var list in alluser) {
                      if (list.email.toString() == txtMail.text){
                        setState(() {
                          checkMail = true;
                        });
                        break;
                      }
                    }
                    if (txtFullName.text.isEmpty
                        || txtMail.text.isEmpty
                        || txtPass.text.isEmpty
                        || txtrePass.text.isEmpty) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                          Text('Vui lòng nhập đầy đủ các trường dữ liệu')));
                    }
                    else if (txtPass.text.length < 8) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Password không trên 8 kí tự')));
                    }
                    else if (txtPass.text != txtrePass.text) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Password không trùng khớp')));
                    }
                     
                    else if (checkMail){
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Email đã được dùng'))
                      );
                    }
                    else {
                      register();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const Login()),
                              (route) => false
                      ).then((value) {
                        if(FirebaseAuth.instance.currentUser != null) {
                          ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(const SnackBar(content: Text('Đăng kí thành công')));
                        }
                      });

                      txtFullName.text = '';
                      txtMail.text = '';
                      txtPass.text = '';
                      txtrePass.text = '';
                      signOut();
                    }

                    /*Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const Login()),
                            (route) => route.isFirst
                    );*/
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    backgroundColor: Colors.lightGreenAccent
                  ),
                  child: const Text('ĐĂNG KÝ',style: TextStyle(color: Colors.black),),
                ),
                //end nút đăng nhập
                //nút chuyển trang
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Text('Bạn đã có tài khoản?, '),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => const Login()),
                                (route) => route.isFirst
                        );
                      },
                      child:  const Text(
                          'Đăng nhập ngay!',
                          style: TextStyle(color: Colors.blue)
                      ),
                    )
                  ],
                ),
                //end nút chuyển trang
              ],
            ),
          ),
        )
    );
  }
}

