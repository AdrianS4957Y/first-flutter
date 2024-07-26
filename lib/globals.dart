import 'dart:ui';

String text = "Введите ПИН-код для входа в приложение";
String pinCode = '';
String password = "4957";
int maxLength = 4;
final Map<String, Color> colors = {
  "grey": Color(0xFFD6D6D6),
  "blue": Color(0xFF1CACCC),
  "red": Color(0xFFFC3F1D),
  "green": Color.fromARGB(255, 61, 199, 65),
  "lightGrey": Color(0xCCD6D6D6),
};
bool correct = false;
Color? getColor(int length) {
  print(pinCode);
  if (pinCode.length == maxLength)
    return correct ? colors["green"] : colors["red"];
  return pinCode.length - length <= 0 ? colors["grey"] : colors["blue"];
}

Map ButtonSize = {
  "height": 78,
  "width": 80,
};
