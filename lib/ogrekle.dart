import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:minikod_bys/services/services.dart';

class OgrEkle extends StatefulWidget {
  final User user;
  const OgrEkle({super.key, required this.user});

  @override
  State<OgrEkle> createState() => _OgrEkleState();
}

class _OgrEkleState extends State<OgrEkle> {
  _OgrEkleState() {
    _cinsiyetVal = _cinsiyetList[0];
    _kangrupVal = _kangrupList[0];
  }
  final TextEditingController _tcController = TextEditingController();
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _soyadController = TextEditingController();
  // final TextEditingController _cinsiyetController = TextEditingController();
  final TextEditingController _okulController = TextEditingController();
  // final TextEditingController _kangrupController = TextEditingController();
  final TextEditingController _dogumyeriController = TextEditingController();
  final TextEditingController _dogumtarihController = TextEditingController();
  final TextEditingController _saglikdurumController = TextEditingController();
  final TextEditingController _telefonController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _adresController = TextEditingController();
  final TextEditingController _veliadsoyadController = TextEditingController();
  final TextEditingController _velitelefonController = TextEditingController();
  final TextEditingController _veliemailController = TextEditingController();
  final TextEditingController _velimeslekController = TextEditingController();
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

// static List<String> _rahatsizliklarList = null;
  final _cinsiyetList = ["Seçiniz", "Erkek", "Kız"];
  final _kangrupList = [
    "Seçiniz",
    "A Rh+",
    "A Rh-",
    "B Rh+",
    "B Rh-",
    "AB Rh+",
    "AB Rh-",
    "0 Rh+",
    "0 Rh-"
  ];
  String? _cinsiyetVal = "";
  String? _kangrupVal = "";
  final AuthService _auth = AuthService();
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
          'Öğrenci Ekleme Formu',
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
                'Öğrenci Bilgileri',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _tcController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  _tcController.text.length == 11
                      ? MaskedInputFormatter("00000000000")
                      : MaskedInputFormatter("00000000000")
                ],
                decoration: const InputDecoration(
                  labelText: 'Kimlik No',
                  icon: FaIcon(FontAwesomeIcons.idCard),
                ),
              ),
              TextField(
                textCapitalization: TextCapitalization.words,
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
              DropdownButtonFormField(
                value: _cinsiyetVal,
                items: _cinsiyetList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _cinsiyetVal = val as String;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Cinsiyet',
                  icon: FaIcon(FontAwesomeIcons.personHalfDress),
                ),
              ),
              // TextField(
              //   controller: _cinsiyetController,
              //   decoration: const InputDecoration(
              //     labelText: 'Cinsiyet',
              //     icon: FaIcon(FontAwesomeIcons.personHalfDress),
              //   ),
              // ),
              TextField(
                textCapitalization: TextCapitalization.words,
                controller: _okulController,
                decoration: const InputDecoration(
                  labelText: 'Okulu',
                  icon: FaIcon(FontAwesomeIcons.school),
                ),
              ),
              DropdownButtonFormField(
                value: _kangrupVal,
                items: _kangrupList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _kangrupVal = val as String;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Kan Grubu',
                  icon: FaIcon(FontAwesomeIcons.droplet),
                ),
              ),
              // TextField(
              //   controller: _kangrupController,
              //   decoration: const InputDecoration(
              //     labelText: 'Kan Grubu',
              //     icon: FaIcon(FontAwesomeIcons.droplet),
              //   ),
              // ),
              TextField(
                textCapitalization: TextCapitalization.words,
                controller: _dogumyeriController,
                decoration: const InputDecoration(
                  labelText: 'Doğum Yeri',
                  icon: FaIcon(FontAwesomeIcons.building),
                ),
              ),
              TextField(
                controller: _dogumtarihController,
                decoration: const InputDecoration(
                  labelText: 'Doğum Tarihi',
                  icon: FaIcon(FontAwesomeIcons.calendarDays),
                ),
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      locale: const Locale('tr', 'TR'),
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          1960), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime.now());

                  if (pickedDate != null) {
                    // print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                    // String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                    // print(formattedDate); //formatted date output using intl package =>  2021-03-16
                    //   //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      _dogumtarihController.text = DateFormat('dd/MM/yyyy')
                          .format(
                              pickedDate); //set output date to TextField value.
                    });
                  } else {
                    print("Doğum tarihi seçilmedi");
                  }
                },
              ),
              TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: _saglikdurumController,
                decoration: const InputDecoration(
                  labelText: 'Rahatsızlıklar',
                  icon: FaIcon(FontAwesomeIcons.notesMedical),
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
                textCapitalization: TextCapitalization.words,
                controller: _adresController,
                decoration: const InputDecoration(
                  labelText: 'Ev Adresi',
                  icon: FaIcon(FontAwesomeIcons.addressBook),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Veli Bilgileri',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextField(
                textCapitalization: TextCapitalization.words,
                controller: _veliadsoyadController,
                decoration: const InputDecoration(
                  labelText: 'Ad Soyad',
                  icon: FaIcon(FontAwesomeIcons.user),
                ),
              ),
              TextField(
                controller: _velitelefonController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  _velitelefonController.text.length == 10
                      ? MaskedInputFormatter("(000) 000-0000")
                      : MaskedInputFormatter("(000) 000-0000")
                ],
                decoration: const InputDecoration(
                  labelText: 'Telefon',
                  icon: FaIcon(FontAwesomeIcons.phone),
                ),
              ),
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  validator: validateEmail,
                  controller: _veliemailController,
                  decoration: const InputDecoration(
                    labelText: 'E-Mail',
                    icon: FaIcon(FontAwesomeIcons.envelope),
                  ),
                ),
              ),
              TextField(
                textCapitalization: TextCapitalization.words,
                controller: _velimeslekController,
                decoration: const InputDecoration(
                  labelText: 'Meslek',
                  icon: FaIcon(FontAwesomeIcons.userTie),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Form verilerini kaydetmek için burada bir işlem yapabilirsiniz
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const AnaMenu()));
                  _auth.ogrenciekle();
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
