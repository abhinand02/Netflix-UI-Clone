import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.fill)),
      ),
    );
  }
}
