import 'package:flutter/material.dart';
import 'package:lab_3/app_theme.dart';
import 'package:lab_3/model/recipe_database/recipe_handler.dart';
import 'package:lab_3/util/cuisine.dart';
import 'package:provider/provider.dart';

class KitchenControl extends StatelessWidget {
  const KitchenControl({super.key});

  @override
  Widget build(BuildContext context) {
    const labels = Cuisine.labels;
    final icons = Cuisine.flags;
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Kök: '),
        SizedBox(width: AppTheme.paddingSmall),
        DropdownMenu<String>(
          width: 164,
          enableFilter: false,
          requestFocusOnTap: false,
          initialSelection: labels[0],
          dropdownMenuEntries: [
            for (int i = 0; i < labels.length; i++)
              DropdownMenuEntry(leadingIcon: icons[i],value: labels[i], label: labels[i]),
          ],
          onSelected: (value){
            recipeHandler.setCuisine(value);
          },
        ),
      ],
    );
  }
}