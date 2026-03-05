import 'package:flutter/material.dart';
import 'package:lab_2/model/recipe_database/recipe_handler.dart';
import 'package:lab_2/util/main_ingredient.dart';
import 'package:provider/provider.dart';

class IngredientControl extends StatelessWidget {
  const IngredientControl({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
    const labels = MainIngredient.labels;

    return DropdownMenu<String>(
      width: 164,
      enableFilter: false,
      requestFocusOnTap: false,
      initialSelection: labels[0],
      dropdownMenuEntries: [
        for (int i = 0; i < labels.length; i++)
          DropdownMenuEntry(value: labels[i], label: labels[i]),
      ],
      onSelected: (value){
        recipeHandler.setMainIngredient(value);
      },
    );
  }
}
