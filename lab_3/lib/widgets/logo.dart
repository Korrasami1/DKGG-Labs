import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lab_3/constants/assets.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Image.asset(Assets.logo, height: 68),
        ),
        Stack(
          children: [
            Text(
              'RECEPT',
              style: TextStyle(
                color: const Color.fromARGB(255, 3, 28, 58),
                fontFamily: 'Monoton',
                fontSize: 48,
              ),
            ),
            Transform.rotate(
              angle: -20 * pi / 180,
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 115),
                child: Text(
                  'Sök',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 64,
                    color: Color(0xFFFFAC33),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
