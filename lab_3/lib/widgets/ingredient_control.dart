import 'package:flutter/material.dart';
import 'package:lab_3/app_theme.dart';
import 'package:lab_3/model/recipe_database/recipe_handler.dart';
import 'package:lab_3/util/main_ingredient.dart';
import 'package:provider/provider.dart';

class IngredientControl extends StatelessWidget {
  const IngredientControl({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
    const labels = MainIngredient.labels;
    final icons = MainIngredient.icons;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Ingredient: '),
        SizedBox(width: AppTheme.paddingSmall),
      DropdownMenu<String>(
        width: 164,
        enableFilter: false,
        requestFocusOnTap: false,
        initialSelection: labels[0],
        dropdownMenuEntries: [
          for (int i = 0; i < labels.length; i++)
            DropdownMenuEntry(leadingIcon: icons[i], value: labels[i], label: labels[i]),
        ],
        onSelected: (value){
          recipeHandler.setMainIngredient(value);
        },
      ),
      ],
    );
  }
}
