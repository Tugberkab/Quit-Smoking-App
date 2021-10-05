class Earnings {
  final double? id, increase;
  final String? name;
  final String? text_right;

  Earnings({
    this.id,
    this.name,
    this.increase,
    this.text_right,
  });
}

List<Earnings> earnings = [
  Earnings(
    id: 1,
    name: 'Kazanç',
    increase: 20,
    text_right: "TL",
  ),
  Earnings(
    id: 2,
    name: 'Akciğer\nYenilenmesi',
    increase: 1/(15*365),
    text_right: "%"
  ),
  Earnings(
    id: 3,
    name: 'İçilmeyen\nSigara Sayısı',
    increase: 20,
    text_right: "Adet",
  ),
  Earnings(
    id: 4,
    name: 'Kazanılan\nZaman',
    increase: 1,
    text_right: "Saat",
  ),
];
