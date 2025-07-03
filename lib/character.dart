import 'dart:io';

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
}
