import 'dart:io';
import 'dart:math';

import 'package:rpggame_dart/monster.dart';

class Character {
  // 이름 (String)
  String name;
  // 체력 (int)
  int hp;
  // 공격력 (int)
  int power;
  // 방어력 (int)
  int shield;

  Character(this.name, this.hp, this.power, this.shield);

  static Character fromfile(String name) { // 함수 설정?
    File file = File('assets/character.txt'); // 파일 경로 지정
    String characterTxt = file.readAsStringSync(); // 문자열로 가지고 올 수 있게 하는 메서드
    List<String> stat = characterTxt.split(','); // 쉼표를 기준으로 끊기
    print(stat); // 중간 확인용
    int hp = int.tryParse(stat[0]) ?? 0; // 글자가 이상하면 0으로 대체
    int power = int.tryParse(stat[1]) ?? 0;
    int shield = int.tryParse(stat[2]) ?? 0;
    return Character(name, hp, power, shield); // 준비된 값들을 모아 `Character` 객체 생성
  }
  void attackMonster(Monster monster) { // 캐릭터가 몬스터 하나를 공격하는 함수
    monster.hp -= this.power; // 캐릭터 공격만큼 몬스터 체력 뺌
    if (monster.hp < 0) {
      monster.hp = 0;
    }
    print("${monster.name}에게 ${this.power}의 데미지를 입혔습니다!");
  }
  void defend(Monster monster) { // 캐릭터가 몬스터의 공격을 방어하는 함수
    Random random = Random(); // 랜덤 숫자를 만들 도구
    int monsterAttack = random.nextInt(monster.power) + 1; // 몬스터 공격력 최대치 중 랜덤값
    int heal = monsterAttack - this.shield; // 방어 계산 로직
    if (heal < 0) heal = 0;
      this.hp += heal;
      print("방어! ${monster.name}의 공격력 ${monsterAttack}, 방어력 ${this.shield}");
      print("방어로 체력 ${heal} 회복! 현재 HP: ${this.hp}"); 
  }
  void showStatus() { // 캐릭터의 현재 상태를 보여주는 함수
    print("=== ${this.name} ===");
    print("HP: ${this.hp}");
    print("공격력: ${this.power}");
    print("방어력: ${this.shield}");
  }
}