import 'package:flutter/material.dart';
import 'package:lab_2/model/recipe_database/recipe_handler.dart';
import 'package:lab_2/widgets/recipe_list_item.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeHandler = context.watch<RecipeHandler>();
    var recipes = recipeHandler.bestMatches;

    return ListView(
      children: [
        for (var recipe in recipes)
          RecipeListItem(recipe, onTap:() {
            
          }),
        ],
    );
  }
}