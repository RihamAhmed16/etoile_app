import 'dart:math';

int generateRandomOrderNumber() {
  final Random random = Random();
  return random.nextInt(999999); // You can adjust the range as needed
}

String capitalizeWords(String text) {
  List<String> words = text.split(' ');
  words = words.map((word) {
    if (word.isNotEmpty) {
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    } else {
      return '';
    }
  }).toList();
  return words.join(' ');
}
