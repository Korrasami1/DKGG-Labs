import 'package:flutter/material.dart';
import 'package:lab_3/app_theme.dart';
import 'package:lab_3/model/recipe_database/ingredient.dart';
import 'package:lab_3/model/recipe_database/recipe.dart';
import 'package:lab_3/ui_controller.dart';
import 'package:lab_3/util/cuisine.dart';
import 'package:lab_3/util/difficulty.dart';
import 'package:lab_3/util/main_ingredient.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final ingredients = recipe.ingredients;
    var uiController = Provider.of<UIController>(context, listen: false);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 800,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: AppTheme.paddingMediumSmall),
                  child: IconButton(
                    onPressed: () {
                      uiController.deselectRecipe();
                    },
                    icon: Icon(Icons.close),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: AppTheme.paddingMedium),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: AppTheme.paddingLarge,),
                        _image(recipe),
                        SizedBox(height: AppTheme.paddingMediumSmall,),
                        Text('Ingredienser:', style: AppTheme.smallHeading),
                        Text('${recipe.servings} portioner'),
                        SizedBox(height: AppTheme.paddingMediumSmall,),
                        for (Ingredient ingredient in ingredients)
                          Padding(
                            padding: const EdgeInsets.only(left: AppTheme.paddingMedium),
                            child: Text(ingredient.toString()),
                          ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(AppTheme.paddingMedium),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(recipe.name, style: AppTheme.largeHeading),
                            SizedBox(height: AppTheme.paddingMedium),
                            Row(
                              children: [
                                MainIngredient.icon(
                                  recipe.mainIngredient,
                                  width: 20,
                                )!,
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
                            SizedBox(height: AppTheme.paddingMedium),
                            Text(
                              recipe.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(height: AppTheme.paddingMedium),
                            Text('Tillagning:', style: AppTheme.smallHeading),
                            SizedBox(height: AppTheme.paddingMedium),
                            Text(recipe.instruction),
                          ],
                        ),
                      ),
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
        width: 240, // Square width
        height: 240, // Square height
        child: FittedBox(fit: BoxFit.cover, child: recipe.image),
      ),
    );
    var flagImage = Cuisine.flag(recipe.cuisine, width: 60.0);

    return Stack(
      children: [
        square,
        Positioned(bottom: 8, right: 8, child: flagImage!),
      ],
    );
  }
}
