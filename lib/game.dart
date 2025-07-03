import 'dart:io';
import 'dart:math';

import 'package:rpggame_dart/character.dart';
import 'package:rpggame_dart/monster.dart';

class Game {
  // 캐릭터 ('Character')
  Character character;
  // 몬스터 리스트 ('List<Monster>')
  List<Monster> monsters;
  // 물리친 몬스터 개수 ('int')
  int killCount = 0;
  // 몬스터 리스트의 개수보다 클 수 없다.
  int totalMonsters;

  Game(this.character, this.monsters) // 몬스터 리스트의 개수보다 클 수 없다.
      : totalMonsters = monsters.length;

  Monster getRandomMonster(List<Monster> monsters) {
    // 싸울 수 있는 몬스터들이 담긴 리스트
    Random random = Random(); //  랜덤 숫자를 만들 준비 완료
    int randomIndex =
        random.nextInt(monsters.length); // 랜덤으로 몇 번째 몬스터 뽑을지 번호 결정
    Monster pick = monsters[randomIndex]; // 랜덤 인덱스로 리스트에서 몬스터 하나 가져옴
    return pick; // 선택한 몬스터를 함수 밖으로 돌려줌
  }

  void startGame() {
    while (true) {
      if (character.hp <= 0) {
        // 캐릭터 피가 0 이하면
        print("캐릭터가 쓰러졌습니다..패배"); // 패배 출력
        return; // 게임 끝
      }
      if (killCount >= totalMonsters) {
        // 물리친 횟수가 몬스터 수보다 많으면
        print("모든 몬스터를 물리쳤습니다!!승리"); // 승리
        return; // 게임 끝
      }
      Monster monster = getRandomMonster(monsters); //랜덤 몬스터 하나 뽑기
      battle(monster); // 전투 시작
      monsters.remove(monster); // 전투 끝나면 몬스터 리스트에서 제거
      killCount++; // 물리친 몬스터 증가
      print("다음 몬스터와 싸우시겠습니까? (y/n)"); // 계속 싸울건지 질문
      String? answer = stdin.readLineSync();
      if (answer == 'n') {
        print("게임이 종료됩니다");
        return;
      }
    }
  }

  void battle(Monster monster) {
    while (monster.hp > 0 && character.hp > 0) {
      character.showStatus(); // 매턴 상태 출력
      monster.showStatus();
      print("행동을 선택하세요: 공격(1) / 방어(2)");
      String? input = stdin.readLineSync();
      if (input == '1') {
        character.attackMonster(monster);
      } else if (input == '2') {
        character.defend(monster);
      }
      if (monster.hp > 0) {
        monster.attackCharacter(character);
      }
      if (character.hp <= 0) {
        print("캐릭터가 쓰러졌습니다!");
        break;
      }
      if (monster.hp <= 0) {
        print("${monster.name}을(를) 물리쳤습니다!");
        break;
      }
    }
  }
}
