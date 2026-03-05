import 'package:flutter/material.dart';
import 'package:lab_2/model/recipe_database/recipe.dart';
import 'package:lab_2/ui_controller.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);
    return Center(
      child: Row(
        children: [ 
        //recipe.customImage(),
        SizedBox(width: 100, height: 100, child: recipe.image),
        SizedBox(width: 10,),
        Text(recipe.name),
        SizedBox(width: 10,),
        IconButton(
        onPressed: (){
          uiController.deselectRecipe();
        }, 
        icon: Icon(Icons.close),),
        ],
      ),
    );
  }
}