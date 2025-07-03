import 'dart:io';
import 'package:rpggame_dart/character.dart';
import 'package:rpggame_dart/game.dart';
import 'package:rpggame_dart/monster.dart';
import 'dart:math';


void main() {
String name = getCharacterName(); // 호출
Character stat = Character.fromfile(name); // 캐릭터 스탯 파일 호출
print("캐릭터 이름: ${stat.name}");
print("HP : ${stat.hp}");
print("공격력 : ${stat.power}");
print("방어력 : ${stat.shield}");

List<Monster> monsters = Monster.fromFileList(); // 몬스터 스탯 파일 호출
Game game = Game(stat, monsters);
game.startGame();
}





String getCharacterName() { // 이름 호출 입력 함수
while(true) {
  print("캐릭터 이름을 입력해주세요:");
  String? userInput = stdin.readLineSync(); // 사용자로부터 캐릭터 이름 입력 받기 기능
  RegExp nameReg = RegExp(r'^[a-zA-Z가-힣]+$'); // 정규 표현식
  if (userInput == null || !nameReg.hasMatch(userInput)) {
    // 캐릭터 이름 조건문
    print("올바른 이름이 아닙니다.");
   continue; //  올바른 이름 입력 할 때까지 반복
  } else {
    print("이름 OK : $userInput");
    return userInput; // 이름 확정
  }
  }
}