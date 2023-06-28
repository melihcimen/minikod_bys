import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.reference();

  Future<User> giris(String email, String parola) async {
    var user =
        await _auth.signInWithEmailAndPassword(email: email, password: parola);
    //var userid = user.user!.uid;
    return user.user!;
  }

  String inputData() {
    final User user = _auth.currentUser!;
    final userid = user.uid;
    return userid;
    // here you write the codes to input the data into firestore
  }
  // Future<User> girisyapildi() async {
  //   var user =
  //       await _auth.signInWithEmailAndPassword(email: email, password: parola);
  //   var userid = user.user!.uid;
  //   return user.user!;
  // }

  Future cikis() async {
    return await _auth.signOut();
  }

  void ogrenciekle() {
    // Map<String, String> ekle = {"veri": "${messageController.text}"};
    // if (user.uid != null) {
    //   _ref.child('${user.uid}/message').push().set(ekle);
    // }
  }

  Future<User> kullanicikaydet(String ka, String sif, String ad, String soyad,
      String email, String telefon) async {
    var user =
        await _auth.createUserWithEmailAndPassword(email: email, password: sif);
    Map<String, String> kul = {
      'Kullaniciadi': ka,
      'Email': email,
      'Sifre': sif,
      'Ad': ad,
      'Soyad': soyad,
      'Telefon': telefon
    };
    databaseReference.child('kullanicilar').set(kul);
    // await _ref.set({

    //   'Kullaniciadi': ka,
    //   'Email': email,
    //   'Sifre': sif,
    //   'Ad': ad,
    //   'Soyad': soyad,
    //   'Telefon': telefon
    // });
    return user.user!;
  }
}
