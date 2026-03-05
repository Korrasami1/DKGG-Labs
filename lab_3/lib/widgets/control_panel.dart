import 'package:flutter/material.dart';
import 'package:lab_3/widgets/difficulty_control.dart';
import 'package:lab_3/widgets/ingredient_control.dart';
import 'package:lab_3/widgets/kitchen_control.dart';
import 'package:lab_3/widgets/logo.dart';
import 'package:lab_3/widgets/price_control.dart';
import 'package:lab_3/widgets/time_control.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      color: const Color.fromARGB(255, 193, 210, 218),
      child: Column(
        children: [
          Padding(padding: EdgeInsetsGeometry.all(10)),
          Logo(),
          const Text('Hitta ett recept som passar genom att ändra inställingarna nedanför'),
          IngredientControl(),
          KitchenControl(),
          SizedBox(height: 10,),
          const Text('Difficulty: '),
          DifficultyControl(),
          SizedBox(height: 10,),
          PriceControl(),
          SizedBox(height: 10,),
          TimeControl(),
        ],
      )
    );
  }
}