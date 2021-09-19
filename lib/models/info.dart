class Info {
  final int? id, increase;
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
    text:
        '2 ila 12 hafta içinde kan dolaşımı düzelmeye başlar öksürük şikayeti varsa azalır. Bağışıklık sistemi güçlenmeye başlar.',
    increase: 10,
  ),
  Info(
    id: 2,
    text:
        '9 ay içerisinde öksürük ve nefes darlığı azalır enfeksiyon riski düşmeye başlar. ',
    increase: 10,
  ),
  Info(
    id: 3,
    text: '9 ay içerisinde Akciğer fonksiyonları yüzde 5-10 arasında artar.',
    increase: 10,
  ),
  Info(
    id: 4,
    text:
        '1 yıl sonra kalp hastalığına yakalanma ve kalp krizi riski yarı yarıya azalır',
    increase: 10,
  ),
  Info(
    id: 5,
    text:
        '5 yıl sonra KOAH riski yarı yarıya azalır, felç riski sigara içmeyenlerle aynı seviyeye gelir.',
    increase: 10,
  ),
  Info(
    id: 6,
    text:
        '5 yıl sigara içmedikten sonra, felç, akciğer kanseri ve kalp hastalığı riskiniz, hiç sigara içmeyen insanlarla yaklaşık aynı olacaktır.',
    increase: 10,
  )
];
