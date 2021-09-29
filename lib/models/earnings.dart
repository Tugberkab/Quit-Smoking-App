class Earnings {
  final int? id, increase;
  final String? name;

  Earnings({
    this.id,
    this.name,
    this.increase,
  });
}

List<Earnings> earnings = [
  Earnings(
    id: 1,
    name: 'Kazanç',
    increase: 40,
  ),
  Earnings(
    id: 2,
    name: 'Akciğer\nYenilenmesi',
    increase: 2,
  ),
  Earnings(
    id: 3,
    name: 'İçilmeyen\nSigara Sayısı',
    increase: 20,
  ),
  Earnings(
    id: 4,
    name: 'Kazanılan\nZaman',
    increase: 5,
  ),
];
