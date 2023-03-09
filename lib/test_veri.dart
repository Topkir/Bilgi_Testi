import 'package:bilgi_testi/soru.dart';

class TestVeri {
  int _soruIndex = 0;

  /// yazılımda 1 2 3 diye değil 0 1 2... diye gider ilk sorudan başlasın diye 0 verdik

  final List<Soru> _soruBankasi = [
    Soru(
        soruMetni: 'Titanic gelmiş geçmiş en büyük gemidir', soruYaniti: false),
    Soru(
        soruMetni: 'Dünyadaki tavuk sayısı insan sayısından fazladır',
        soruYaniti: true),
    Soru(soruMetni: 'Kelebeklerin ömrü bir gündür', soruYaniti: false),
    Soru(soruMetni: 'Dünya düzdür', soruYaniti: false),
    Soru(
        soruMetni: 'Kaju fıstığı aslında bir meyvenin sapıdır',
        soruYaniti: true),
    Soru(
        soruMetni: 'Fatih Sultan Mehmet hiç patates yememiştir',
        soruYaniti: true),
    Soru(soruMetni: 'Fransızlar 80 demek için, 4 - 20 der', soruYaniti: true),
  ];
  /// Soru Sistemimiz
  /// İstediğimiz kadar soru ekleyebiliriz.

  String getSoruMetni() {
    return _soruBankasi[_soruIndex].soruMetni;
  }
  /// String (harf) - getSoruMetni sorular için KULLANICI İZNİ OLUŞTURUYOR
  /// int (tam sayı) - soruIndex'i kaçıncı soruda olduğunu takip ediyor

  bool getSoruYaniti() {
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  void sonrakiSoru() {
    if (_soruIndex + 1 < _soruBankasi.length) {
      _soruIndex++;
    }
  }
  /// bool (true - false)  - getSoruYaniti cevaplar için KULLANICI İZNİ OLUŞTURUYOR
  ///  int (tam sayı) - soruIndex'i kaçıncı soruda olduğunu takip ediyor

  bool testBittiMi() {
    if (_soruIndex + 1 >= _soruBankasi.length) {
      return true;
    } else {
      return false;
    }
  }
  /// (main.dart) dosyasında butonFonksiyonu nun içinde testin bitip bitmediğini kontrol ediyor.

  void testiSifirla() {
    _soruIndex = 0;
  }
  ///

}

///          -KOD AÇIK KAPATMA-
/// 1. Kod açığını kapatmak için soru - cevap KULLANICI İZNİ OLUŞTUR.
/// 2. class a isim ver (TestVeri)
/// 3. class içinde List oluştur
/// 4. List 'e verilen ismin başına alt tire(_) koy
/// 5. TestVeri class'ını ''TestVeri test_1 = TestVeri();'' test_1 ismine atadık.
/// 6. test_1.getSoruMetni(soruIndex) ----> test_1 soru paket(test_veri.dart) --- getSoruMetni SoruMetni için İZİN İSTİYOR. --- soruIndex 'i de kaçıncı soruda old. takip ediyor.
