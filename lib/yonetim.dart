import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minikod_bys/kulekle.dart';
import 'package:minikod_bys/kulgoruntule.dart';

class YonetimMenu extends StatelessWidget {
  final User user;
  const YonetimMenu({super.key, required this.user});

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
            'Yönetim İşlemleri',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.userPlus),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => KullaniciEkle(user: user)),
                );
              },
              trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              title: const Text('Kullanıcı Ekle'),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.userTag),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => KullaniciGoruntule(user: user)),
                );
              },
              trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              title: const Text('Kullanıcı Görüntüle/Düzenle'),
            ),
          ],
        ));
  }
}
