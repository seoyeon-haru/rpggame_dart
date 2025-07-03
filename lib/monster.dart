import 'dart:io';

class Monster {
  // 이름 (String)
  String name;
  // 체력(int)
  int hp;
  // 랜덤으로 지정할 공격력 범위 최대값 (int)
  int power;
  // 방어력 (int)
  int shield;
  Monster(this.name, this.hp, this.power, this.shield);

  static List<Monster> fromFileList() {
    File monstersfile = File('assets/monsters.txt');
    String monstersTxt = monstersfile.readAsStringSync();
    List<String> lines = monstersTxt.split('\n');
    List<Monster> monsters = [];
    for (var i = 0; i < lines.length; i++) {
      print("$i번째 몬스터 : ${lines[i]}");
    }
    return monsters;
  }
}