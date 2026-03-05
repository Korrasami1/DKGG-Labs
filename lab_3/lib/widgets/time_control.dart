import 'package:flutter/material.dart';
import 'package:lab_3/app_theme.dart';
import 'package:lab_3/constants/assets.dart';
import 'package:lab_3/model/recipe_database/recipe_handler.dart';
import 'package:provider/provider.dart';

class TimeControl extends StatefulWidget {
  const TimeControl({super.key});

  @override
  State<TimeControl> createState() => _TimeControlState();
}

class _TimeControlState extends State<TimeControl> {

  double _time = 30;

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

    return Column(
      children: [
        const Text('Maxtid: '),
        Slider(
          value: _time,
          divisions: 10,
          max: 150,
          onChanged: (double value) {
            setState(() {
              _time = value;
              recipeHandler.setMaxTime(_time.round());
            });  
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(Assets.timeIcon, height: 16),
            Padding(
            padding: const EdgeInsets.only(right: AppTheme.paddingLarge, left: AppTheme.paddingTiny),
            child: Text('${_time.round()} minuter'),
          )],
        ),
      ],
    );
  }
}