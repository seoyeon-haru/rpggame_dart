import 'dart:io';
import 'dart:math';

import 'package:rpggame_dart/character.dart';

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
  void attackCharacter(Character character) { // 몬스터가 캐릭터에게 공격하는 함수
    Random random = Random();
    int attackValue = random.nextInt(this.power) + 1; // 몬스터 공격력 최댓값
    int damage = attackValue - character.shield; // 실제 피해량 계산
    if (damage < 0) damage = 0;
    character.hp -= damage;
    if (character.hp < 0) character.hp = 0;
    print("${this.name}이(가) ${character.name}에게 ${damage}의 데미지를 입혔습니다!");
  }
  void showStatus() {
    print("=== ${this.name} ===");
    print("HP: ${this.hp}");
    print("최대 공격력: ${this.power}");
  }
}