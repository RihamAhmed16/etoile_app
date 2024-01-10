import 'package:flutter/material.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.language_sharp,
              color: Colors.orangeAccent,
              size: 80,
            ),
            const SizedBox(height: 30),
            buildLangButton(
              "English",
              Colors.orangeAccent,
            ),
            const SizedBox(height: 20),
            buildLangButton(
              "Arabic",
              Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLangButton(String text, Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
/* >>>with clean code <<<
import 'package:flutter/material.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.language_sharp,
              size: 80,
            ),
            SizedBox(height: 30),
            buildLangButton("English", Colors.orangeAccent),
            SizedBox(height: 20),
            buildLangButton("Arabic", Colors.black),
          ],
        ),
      ),
    );
  }

  Widget buildLangButton(String text, Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
 */
