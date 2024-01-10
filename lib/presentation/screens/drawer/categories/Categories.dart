import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 22),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 33),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: GridTile(
              footer: GridTileBar(
// backgroundColor: Color.fromARGB(66, 73, 127, 110),
                trailing: IconButton(
                  icon: const Icon(Icons.add_to_drive),
                  color: const Color.fromARGB(255, 62, 94, 70),
                  onPressed: () {},
                ),
              ),
              child: Stack(children: [
                Positioned(
                  top: -3,
                  bottom: -9,
                  right: 0,
                  left: 0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(55),
                      child: Image.asset(" ")),
                ),
              ]),
            ),
          );
        },
      ),
    ));
  }
}
