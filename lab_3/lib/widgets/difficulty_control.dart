import 'package:flutter/material.dart';
import 'package:lab_3/app_theme.dart';
import 'package:lab_3/model/recipe_database/recipe_handler.dart';
import 'package:lab_3/util/difficulty.dart';
import 'package:provider/provider.dart';

class DifficultyControl extends StatefulWidget {
  const DifficultyControl({super.key});

  @override
  State<DifficultyControl> createState() => _DifficultyControlState();
}

class _DifficultyControlState extends State<DifficultyControl> {
  String _difficulty = Difficulty.labels[0];

  final labels = Difficulty.labels;
  final icons = Difficulty.icons;

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
    
    return RadioGroup<String>(
      groupValue: _difficulty,
      onChanged: (value) {
        setState(() {
          _difficulty = value!;
          recipeHandler.setDifficulty(_difficulty);
        });
      },
      child: Column(
        children: [
          for (int i = 0; i < labels.length; i++) 
            RadioListTile<String>(
              dense: true,
              title: i == 0 ? Row( children: [SizedBox(width: AppTheme.paddingMedium), Text(labels[i])]): Row( children: [icons[i]!, SizedBox(width: AppTheme.paddingMedium), Text(labels[i])]) ,
              value: labels[i],
            ),
        ],
      ),
    );
  }
}
