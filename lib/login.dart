import 'package:flutter/material.dart';
import 'package:minikod_bys/anamenu.dart';
import 'package:minikod_bys/services/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final DatabaseReference _ref = FirebaseDatabase.instance.ref('veridabani');
  final AuthService _auth = AuthService();
  final TextEditingController _kuladiConroller = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF7931E),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          children: <Widget>[
            const SizedBox(height: 30.0),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/minikod_logo.png'),
              radius: 100,
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Minikod&Akademi Öğrenci Yönetim Sistemi',
              style: TextStyle(
                letterSpacing: 1,
                wordSpacing: 0,
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30.0),
            TextField(
              controller: _kuladiConroller,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Kullanıcı Adı',
                hintStyle: TextStyle(color: Color.fromARGB(255, 129, 129, 129)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _sifreController,
              obscureText: true,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Şifre',
                hintStyle: TextStyle(color: Color.fromARGB(255, 129, 129, 129)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF93278F),
                  fixedSize: const Size(20, 50),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600)),
              onPressed: () {
                // Login işlemleri burada gerçekleştirilebilir.
                _auth.giris(_kuladiConroller.text, _sifreController.text).then(
                    (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnaMenu(user: value))));
              },
              child: const Text('Giriş Yap'),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
