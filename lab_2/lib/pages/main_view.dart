import 'package:flutter/material.dart';
import 'package:lab_2/widgets/difficulty_control.dart';
import 'package:lab_2/widgets/ingredient_control.dart';
import 'package:lab_2/widgets/kitchen_control.dart';
import 'package:lab_2/widgets/price_control.dart';
import 'package:lab_2/widgets/time_control.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _controlPanel(context),
          _recipeArea(context),
        ],
      ),
    );
  }

  Widget _controlPanel(context, {double width = 320}) {
    return Container(
      width: width,
      color: const Color.fromARGB(255, 193, 210, 218),
      child: Column(
        children: [
          Padding(padding: EdgeInsetsGeometry.all(10)),
          const Text('Recipesök'),
          const Text('Hitta ett recept som passar genom att ändra inställingarna nedanför'),
          SizedBox(height: 16,),
          Row( children: [const Text('Ingrediens: '), IngredientControl()],),
          SizedBox(height: 5,),
          Row( children: [const Text('Kök: '), KitchenControl()],),
          SizedBox(height: 10,),
          const Text('Difficulty: '),
          DifficultyControl(),
          SizedBox(height: 10,),
          const Text('MaxPris: '),
          PriceControl(),
          SizedBox(height: 10,),
          const Text('Maxtid: '),
          TimeControl(),
        ],
      )
    );
  }

  Widget _recipeArea(context) {
    return Expanded(
      child: Container(color: const Color.fromARGB(255, 204, 216, 176)),
      );
  }
}
