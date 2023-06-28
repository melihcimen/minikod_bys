import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minikod_bys/login.dart';

class KullaniciAyar extends StatefulWidget {
  final User user;
  const KullaniciAyar({super.key, required this.user});

  @override
  State<KullaniciAyar> createState() => _KullaniciAyarState();
}

class _KullaniciAyarState extends State<KullaniciAyar> {
  final TextEditingController _kaController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _soyadController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefonController = TextEditingController();
  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Geçerli bir e-posta adresi girin'
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7931E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF93278F),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        title: const Text(
          'Kullanıcı Ayarları',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Kullanıcı Bilgileri',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _kaController,
                decoration: const InputDecoration(
                  labelText: 'Kullanıcı Adı',
                  icon: FaIcon(FontAwesomeIcons.idCard),
                ),
              ),
              TextField(
                controller: _sifreController,
                decoration: const InputDecoration(
                  labelText: 'Şifre',
                  icon: FaIcon(FontAwesomeIcons.key),
                ),
              ),
              TextField(
                controller: _adController,
                decoration: const InputDecoration(
                  labelText: 'Ad',
                  icon: FaIcon(FontAwesomeIcons.user),
                ),
              ),
              TextField(
                textCapitalization: TextCapitalization.words,
                controller: _soyadController,
                decoration: const InputDecoration(
                  labelText: 'Soyad',
                  icon: FaIcon(FontAwesomeIcons.user,
                      color: Color.fromARGB(0, 0, 0, 0)),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'İletişim Bilgileri',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  validator: validateEmail,
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-Mail',
                    icon: FaIcon(FontAwesomeIcons.envelope),
                  ),
                ),
              ),
              TextField(
                controller: _telefonController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  _telefonController.text.length == 10
                      ? MaskedInputFormatter("(000) 000-0000")
                      : MaskedInputFormatter("(000) 000-0000")
                ],
                decoration: const InputDecoration(
                  labelText: 'Telefon',
                  icon: FaIcon(FontAwesomeIcons.phone),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Form verilerini kaydetmek için burada bir işlem yapabilirsiniz
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text(
                  'Kaydet',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
