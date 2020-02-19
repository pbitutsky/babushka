import 'dart:math';

final buttonTexts = [
  "hachoo",
  "*cough*",
  "hapchooo",
  "*sneeze*"
];

var phrases = [
  "It's because you walk around without your slippers.",
  "It's because you don't dry your hair when you go outside.",
  "It's because you drink cold water with your dinner!",
  "It's because you don't wear your jacket when it's cold!",
  "It's because you sleep with wet hair!",
  "It's because you never listen to your grandma!"
];

var buttonText = "hachoo";
void chooseRandomButtonText() {
  final _random = new Random();
  int randomIndex = _random.nextInt(buttonTexts.length);
  buttonText = buttonTexts[randomIndex];
}