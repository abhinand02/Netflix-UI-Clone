import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/strings.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.imageUrl});
  final int index;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Container(
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image:  DecorationImage(
                      image: NetworkImage(
                          '$imageAppendUrl$imageUrl'),
                      fit: BoxFit.fill)),
            ),
          ],
        ),
        Positioned(
            left: -5,
            bottom: -30,
            child: BorderedText(
                strokeColor: whiteClr,
                strokeWidth: 4,
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(fontSize: 150, color: blackClr),
                ))),
      ],
    );
  }
}
