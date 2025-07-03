import 'dart:io';
import 'package:rpggame_dart/character.dart';
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
Monster pick = getRandomMonster(monsters);

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

Monster getRandomMonster(List<Monster> monsters) { // 싸울 수 있는 몬스터들이 담긴 리스트
Random random = Random(); //  랜덤 숫자를 만들 준비 완료
int randomIndex = random.nextInt(monsters.length); // 랜덤으로 몇 번째 몬스터 뽑을지 번호 결정
Monster pick = monsters[randomIndex]; // 랜덤 인덱스로 리스트에서 몬스터 하나 가져옴
  return pick; // 선택한 몬스터를 함수 밖으로 돌려줌
}

// Game game = Game() {
//   while(true) {
//     print("게임을 시작합니다!!!!!");
//     print("당신의 목표 : 모든 몬스터를 물리치세요!");


//   }
// }




//Character character = Character(getCharacterName()), hp, power, shield);





  // Character character = Character(userInput!, 100, 100, 100);
  // // TODO 몬스터 파일 불러와서 객체로 만들어주기
  // Game game = Game(character, []);
  // while (true) {
  //   if (character.hp <= 0) { // 캐릭터 체력 0 이하면
  //     print('패배'); // 패배 출력
  //     break;
  //   } else if (game.killCount >= game.totalMonsters) { // 물리친 몬스터 수가 목표보다 이상이면
  //     print('승리'); // 승리 출력
  //     break;
  //   }
  // }


//Monster getRandomMonster(List<Monster> monsters) { // 싸울 몬스터 랜덤으로 가져오기
//randomIndex = totalMonsters;
//}
