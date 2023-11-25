
import 'package:casio_flutter/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool cpass = true;
  TextEditingController txtMail = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future login() async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        //email: snap.docs[0]['email'],
        email: txtMail.text.trim(),
        password: txtPass.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'wrong-password': {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Nhập sai mật khẩu')));
          break;
        }
        case 'invalid-email': {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Nhập sai email')));
          break;
        }
        case 'user-not-found': {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Không tìm thấy email/user')));
          break;
        }
      }
      return e;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //logo
              const Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/imgs/logo.png'),
                      width: 100,
                      height: 100,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
              //chữ đăng nhập
              const Text(
                'ĐĂNG NHẬP',
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
              //end chữ đăng nhập
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
                      controller: txtMail,
                      obscureText: false,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        hintText: 'Nhập email',
                        hintStyle: TextStyle(color: Colors.black, fontSize: 12)
                      ),
                    ),
                  )
                ],
              ),
              //end ô nhập mail
              const SizedBox(height: 25,),
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
                      color: Colors.black26
                    ),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      controller: txtPass,
                      obscureText: cpass,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10, top: 15),
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
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              //nút đăng nhập
              ElevatedButton(
                onPressed: () async {
                  if(txtMail.text.isEmpty || txtPass.text.isEmpty) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Vui lòng nhập đầy đủ các trường dữ liệu')));
                  } else
                  {
                    login();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const Auth()),
                            (route) => false
                    ).then((value) {
                      if(FirebaseAuth.instance.currentUser != null) {
                        ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(const SnackBar(content: Text('Đăng nhập thành công')));
                      }
                    });
                  }
                  txtPass.text = '';
                  txtMail.text = '';
                  /*Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Hold()),
                  );*/
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  backgroundColor: Colors.lightGreenAccent
                ),
                child: const Text('ĐĂNG NHẬP',style: TextStyle(color: Colors.black),),
              ),
              //end nút đăng nhập
              //nút chuyển trang
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text('Bạn chưa có tài khoản?,'),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const Register()),
                              (route) => route.isFirst
                      );
                    },
                    child: const Text(
                        'Đăng ký ngay!',
                        style: TextStyle(color: Colors.blue)
                    ),
                  )
                                  ],
              ),
              //end nút chuyển trang
             Column(
               crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Mọi thông tin cần hỗ trợ vui lòng liên hệ ',style: TextStyle(fontSize:16),),
                Text('qua email: gshock.support@gmail.com để được hỗ trợ!',style: TextStyle(fontSize:16),)
                ],
             )
            ],
          ),
        ),
      )
    );
  }
}

