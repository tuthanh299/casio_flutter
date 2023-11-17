import 'package:flutter/material.dart';
import 'package:casio_flutter/screens/hold.dart';
import 'package:casio_flutter/screens/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool cpass = true;
  TextEditingController txtMail = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            )),
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
                  ]),
            ),
            //end chữ đăng nhập
            //Ô nhập mail
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tài khoản:',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
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
                        hintText: 'Nhập tài khoản',
                        hintStyle:
                            TextStyle(color: Colors.black, fontSize: 12)),
                  ),
                )
              ],
            ),
            //end ô nhập mail
            const SizedBox(
              height: 25,
            ),
            //ô nhập pass
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mật khẩu:',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.black26),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    controller: txtPass,
                    obscureText: false,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 10, top: 15),
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
                        hintStyle:
                            const TextStyle(color: Colors.black, fontSize: 12)),
                  ),
                )
              ],
            ),
            //end ô nhập pass
            SizedBox(height: MediaQuery.of(context).size.height / 10),
            //nút đăng nhập
            ElevatedButton(
              onPressed: () {
                 Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Hold()),
                  );
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  backgroundColor: Colors.lightGreenAccent),
              child: const Text(
                'ĐĂNG NHẬP',
                style: TextStyle(color: Colors.black),
              ),
            ),
            //end nút đăng nhập
            //nút chuyển trang
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Bạn chưa có tài khoản?,'),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const Register()),
                        (route) => route.isFirst);
                  },
                  child: const Text('Đăng ký ngay!',
                      style: TextStyle(color: Colors.blue)),
                )
              ],
            ),
            //end nút chuyển trang
          ],
        ),
      ),
    ));
  }
}
