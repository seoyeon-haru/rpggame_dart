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
}