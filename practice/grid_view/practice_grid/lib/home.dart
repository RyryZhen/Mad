import 'package:flutter/material.dart';
import 'package:practice_grid/display.dart';
import 'package:practice_grid/recipe.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<Dog> mylist = [Dog(name: 'Taylor', age: 1, color: Colors.grey)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
        ),
        itemCount: mylist.length,
        itemBuilder: (BuildContext context, int index) {
          final track = mylist[index];
          return Display(connect: track);
        },
      ),
    );
  }
}












// import 'package:flutter/material.dart';
// import 'package:practice_grid/display.dart';
// import 'package:practice_grid/recipe.dart';

// class Home extends StatelessWidget {
//   Home({super.key});

//   List<Recipe> myList = [
//     Recipe(id: 1, name: "Ilocano", color: Colors.blue),
//     Recipe(id: 2, name: 'Pangasinan', color: Colors.red),
  
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("This is Opening Screen")),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 8,
//           crossAxisSpacing: 8,
//           childAspectRatio: 3 / 2,
//         ),
//         itemCount: myList.length,
//         itemBuilder: (BuildContext context, int index) {
//           final recipe = myList[index];
//           return Display(recipe: recipe);
//         },
//       ),
//     );
//   }
// }
