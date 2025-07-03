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

  void startGame() {
    while (true) {
      if (character.hp <= 0) { // 캐릭터 피가 0 이하면
        print("패배"); // 패배 출력
        return; // 게임 끝
      }
      if (killCount >= totalMonsters) { // 물리친 횟수가 몬스터 수보다 많으면
        print("승리"); // 승리
        return; // 게임 끝
      }
    }
  }
}
