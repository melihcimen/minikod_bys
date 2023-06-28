import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minikod_bys/kullaniciayarlari.dart';
import 'package:minikod_bys/uygulamaayarlari.dart';

class Ayarlar extends StatelessWidget {
  final User user;
  const Ayarlar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFf5eefa),
        appBar: AppBar(
          backgroundColor: const Color(0xFF93278F),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          title: const Text(
            'Ayarlar',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.userGear),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => KullaniciAyar(user: user)),
                );
              },
              trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              title: const Text('Kullanıcı Ayarları'),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.gear),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UygulamaAyar(user: user)),
                );
              },
              trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              title: const Text('Uygulama Ayarları'),
            ),
          ],
        ));
  }
}
