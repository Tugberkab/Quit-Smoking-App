import 'package:quit_smoking_app/models/time.dart';

class Info {
  final int? id;
  final String? text;
  final String? timeType;
  final double? coefficient;

  Info({
    this.id,
    this.text,
    this.timeType,
    this.coefficient
  });
}

List<Info> info = [
  Info(
    id: 1,
    text: 'Kan Dolaşımında Düzelme',
    timeType: "Hour",
    coefficient: 12*7*24
  ),
  Info(
    id: 2,
    text: 'Öksürük Ve Nefes Darlığında Azalma',
    timeType: "Day",
    coefficient: 9*30
  ),
  Info(
    id: 3,
    text: 'Akciğer Fonksiyonlarının Yenilenmesi',
    timeType: "Month",
    coefficient: 9
  ),
  Info(
    id: 4,
    text: 'Kalp Krizi Riskinin Sıfırlanması',
    timeType: "Day",
    coefficient: 2*365
  ),
  Info(
    id: 5,
    text: 'KOAH Riskinin Sıfırlanması',
    timeType: "Month",
    coefficient: 5*12*2
  ),
  Info(
    id: 6,
    text: 'Sigara Kullanmayan Biri İle Aynı Olma',
    timeType: "Day",
    coefficient: 5*365
  )
];
