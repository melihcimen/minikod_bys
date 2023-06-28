import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minikod_bys/ayarlar.dart';
import 'package:minikod_bys/dersprogrami.dart';
import 'package:minikod_bys/ogr.dart';
import 'package:minikod_bys/yoklama.dart';
import 'package:minikod_bys/services/services.dart';
import 'package:minikod_bys/yonetim.dart';

class AnaMenu extends StatefulWidget {
  final User user;
  const AnaMenu({super.key, required this.user});

  @override
  // ignore: no_logic_in_create_state
  State<AnaMenu> createState() => _AnaMenuState(user: user);
}

class _AnaMenuState extends State<AnaMenu> {
  late final User user;
  final AuthService _auth = AuthService();
  _AnaMenuState({required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7931E),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text.rich(TextSpan(
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 18,
            ), //apply style to all
            children: [
              TextSpan(
                  text: 'Hoşgeldin,',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                  text: ' Melih Çimen',
                  style: TextStyle(fontWeight: FontWeight.w700))
            ])),
        backgroundColor: const Color(0xFF93278F),
        actions: [
          // Padding(
          //     padding: const EdgeInsets.only(right: 100),
          //     child: GestureDetector(
          //       onTap: () {},
          //       child: const Text(
          //         "Melih Çimen",
          //         style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 16,
          //             fontWeight: FontWeight.w500),
          //       ),
          //     )),
          Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: GestureDetector(
                  onTap: () {},
                  child: const SizedBox(
                    height: 45,
                    width: 45,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/minikod_logo.png'),
                      radius: 1000,
                    ),
                  ))),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          MenuItem(
            icon: Icons.manage_accounts_rounded,
            text: 'Yönetim',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => YonetimMenu(user: user)),
              );
            },
          ),
          MenuItem(
            icon: Icons.person_search_rounded,
            text: 'Öğrenci Ekle/Düzenle',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OgrenciMenu(user: user)),
              );
            },
          ),
          MenuItem(
            icon: Icons.edit_note_rounded,
            text: 'Yoklama Gir',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YoklamaGir(user: user)),
              );
            },
          ),
          MenuItem(
            icon: Icons.calendar_month_rounded,
            text: 'Ders Programı',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DersProgrami(user: user)),
              );
            },
          ),
          MenuItem(
            icon: Icons.chat_rounded,
            text: 'Chat Uygulamasını Aç',
            onPressed: () {
              //chat uygulamasının açılacağı kısım
            },
          ),
          MenuItem(
            icon: Icons.settings,
            text: 'Ayarlar',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ayarlar(user: user)),
              );
            },
          ),
          MenuItem(
            icon: Icons.logout_rounded,
            text: 'Çıkış Yap',
            onPressed: () {
              //çıkış yapılacak kısım
              _auth.cikis();
            },
          ),
          // Diğer menü öğeleri buraya eklenir
        ].map((menuItem) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: menuItem,
          );
        }).toList(),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 50,
                color: const Color(0xFF93278F),
              ),
              const SizedBox(height: 10),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF93278F),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
