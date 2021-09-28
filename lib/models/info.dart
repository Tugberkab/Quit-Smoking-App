class Info {
  final int? id;
  final double? increase;
  final String? text;

  Info({
    this.id,
    this.text,
    this.increase,
  });
}

List<Info> info = [
  Info(
    id: 1,
    text: '2 ila 12 hafta içinde kan dolaşımı düzelmeye başlar.',
    increase: 10.0,
  ),
  Info(
    id: 2,
    text: '9 ay içerisinde öksürük ve nefes darlığı azalır.',
    increase: 10.0,
  ),
  Info(
    id: 3,
    text: '9 ay içerisinde Akciğer fonksiyonları yüzde 5 artar.',
    increase: 10.0,
  ),
  Info(
    id: 4,
    text: '1 yıl sonra kalp krizi riski yarı yarıya azalır',
    increase: 10.0,
  ),
  Info(
    id: 5,
    text: '5 yıl sonra KOAH riski yarı yarıya azalır.',
    increase: 10.0,
  ),
  Info(
    id: 6,
    text: '5 yıl sonra sigara kullanmayan biri ile aynı olursunuz.',
    increase: 10.0,
  )
];
