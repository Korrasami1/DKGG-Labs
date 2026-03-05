import 'package:flutter/material.dart';
import 'package:lab_3/app_theme.dart';
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
      child: Padding(
        padding: const EdgeInsets.only(left: AppTheme.paddingMediumSmall),
        child: Column(
          children: [
            Padding(padding: EdgeInsetsGeometry.all(AppTheme.paddingMediumSmall)),
            Logo(),
            const Text('Hitta ett recept som passar genom att ändra inställingarna nedanför \n'),
            IngredientControl(),
            KitchenControl(),
            SizedBox(height: AppTheme.paddingMediumSmall,),
            Row(
              children: [
                const Text('Difficulty: ', style: AppTheme.smallHeading,),
              ],
            ),
            DifficultyControl(),
            SizedBox(height: AppTheme.paddingMediumSmall,),
            PriceControl(),
            SizedBox(height: AppTheme.paddingMediumSmall,),
            TimeControl(),
          ],
        ),
      )
    );
  }
}