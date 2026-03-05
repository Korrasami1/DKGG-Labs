import 'package:flutter/material.dart';
import 'package:lab_3/app_theme.dart';
import 'package:lab_3/model/recipe_database/recipe.dart';
import 'package:lab_3/util/cuisine.dart';
import 'package:lab_3/util/difficulty.dart';
import 'package:lab_3/util/main_ingredient.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 128,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: _image(recipe),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(recipe.name, style: AppTheme.mediumHeading),
                    Text(
                      recipe.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        MainIngredient.icon(recipe.mainIngredient, width: 20)!,
                        Difficulty.icon(recipe.difficulty, width: 48)!,
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('${recipe.time} minuter'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('${recipe.price} kr'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _image(Recipe recipe) {
    var square = ClipRect(
      child: Container(
        width: 104, // Square width
        height: 104, // Square height
        child: FittedBox(
          fit: BoxFit.cover,
          child: recipe.image,
        ),
      ),
    );
    var flagImage = Cuisine.flag(recipe.cuisine, width: 24.0);

    return Stack(
      children: [
        square,
        Positioned(bottom: 8, right: 8, child: flagImage!),
      ],
    );
  }
}
