import 'package:bilgi_testi/test_veri.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                   child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  /// true false döndürüyor.
  /// secimler listesini tanımladık.boş.

  TestVeri test_1 = TestVeri();
  /// test_1 soru dosyası - TestVeri soru class 'ının ismi (test_veri.dart) 'ta / soruları buradan çekiyoruz.
  /// TestVeri class 'ı (test_veri.dart dosyasında) -- test_1 biz verdik.


  void butonFonksiyonu(bool secilenButon) {
    if (test_1.testBittiMi() == true) {
      /// test_1 in bitip bitmediğini satır 69 da secilen butonun if else koşulunu yapar 146. - 162. satırlarındaki kodların cevabına göre dogru ya da yanlş tik koyar.

      showDialog(
        context: context,
        builder: (BuildContext context) {

          return AlertDialog(
            /// AlertDialog testi bitirdiğimizde uyarı kutucuğu çıkarır.

            title: new Text("Tebrikler testi bitirdiniz."),
            ///Testi bitirdiğimizde karşımıza uyarı kutucuğu metni
            actions: <Widget>[
              new TextButton(
                child: new Text(
                  "Başa dön",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  ///pop sayfanın üstüne başka sayfa yapıştırır --- sayfanın üstündeki başka sayfayı kaldırır.
                  ///son soruyu cevapladığımızda uyarı kutucuğunun gelmesi --- Başa dön e tıkladığımızda ise uyarı kutucuğunun kalkması.

                  setState(() {
                    test_1.testiSifirla();
                    secimler = [];
                    ///secimler sorunun d/y olup olmadığını kontrol eder eğer test_1 de soru bittiyse testi sıfırlar ve ilk soruya döner.
                  });
                },
              ),
            ],
            backgroundColor: Colors.white,
          );
        },
      );
    } else {
      setState(() {
        test_1.getSoruYaniti() == secilenButon
            ? secimler.add(kDogruIcon)
            /// ( ? = if ) - secimler dogru yanlış satırı (27) - add (ekle) / (kDogruIcon) k harfi const(sabit) ten geliyor

            : secimler.add(kYanlisIcon);
            /// ( : = else ) - secimler dogru yanlış satırı (27) - add (ekle) / (kYanlisIcon) k harfi const(sabit) ten geliyor

        test_1.sonrakiSoru();

        ///               (DART DİLİNDE İF ELSE KULLANIMI)
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      /// main Axis Alignment = Ana Eksen Hizalaması -- space between = boşluk arasına

      crossAxisAlignment: CrossAxisAlignment.stretch,
      /// cross Axis Alignmet = Çapraz Eksen Hizalaması -- stretch = germek

      children: <Widget>[
        Expanded(
          flex: 4,
          /// flex 5 parçaya bölündü 4 ü buraya kullanıldı. -- flex = esnek

          child: Padding(
            padding: EdgeInsets.all(10.0),
            /// padding = dolgu / Edge Insets = Kenar Eklentileri

            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                /// test_1 = test_veri.dart ---> class a verdiğimiz ismi main.dart'ta TestVeri = test_1 TestVeri() 'e atadık. ayrıntısı yukarıda.
                /// getSoruMetni = kullanıcı izni alınarak kullanılan soru metinleri

                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          ///horizontal yatayda ıconları döndürür. (vertical dikeyde döndürür) (Wrap - sarmak) (direction = yön) (Axis = eksen)

          spacing: 3,
          runSpacing: 3,
          alignment: WrapAlignment.start,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          /// flex 5 parçaya bölündü 1 ini buraya kullanıldı. -- flex = esnek

          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        butonFonksiyonu(false);
                      },
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: Icon(
                            Icons.thumb_up,
                            size: 30,
                          ),
                          onPressed: () {
                            butonFonksiyonu(true);
                          },
                        ))),
              ])),
        ),
      ],
    );
  }
}