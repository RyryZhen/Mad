import 'package:flutter/material.dart';
import 'package:practice_grid/recipe.dart';
import 'package:practice_grid/recipeView.dart';

class Display extends StatelessWidget {
  Display({super.key, required this.connect});

  Dog connect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => SecondScreen())),

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: connect.color,
        ),

        child: Center(
          child: Text(
            '${connect.name}\n${connect.age}',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:practice_grid/recipe.dart';
// import 'package:practice_grid/recipeView.dart';

// class Display extends StatelessWidget {
//   const Display({super.key, required this.recipe});

//   final Recipe recipe;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Navigator.of(
//         context,
//       ).push(MaterialPageRoute(builder: (_) => RecipeView())),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           //color: recipe.color,
//           //color: Colors.blue,
//           decoration: BoxDecoration(
//             color: recipe.color,
//             borderRadius: BorderRadius.circular(4),
//           ),
//           child: Center(child: (Text(recipe.name))),
//         ),
//       ),
//     );
//   }
// }
