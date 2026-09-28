import 'package:a8_recipe_app/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecipeViewScreen extends StatefulWidget {
  const RecipeViewScreen({
    super.key,
    required this.recipe,
    required this.categoryColor,
  });

  final Recipe recipe;
  final Color categoryColor;

  @override
  State<RecipeViewScreen> createState() => _RecipeViewScreenState();
}

class _RecipeViewScreenState extends State<RecipeViewScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 26, fontWeight: FontWeight.w500);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.name, style: TextStyle(color: Colors.white)),
        backgroundColor: widget.categoryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: widget.recipe.imageUrl != null
                ? Image.network(widget.recipe.imageUrl!, fit: BoxFit.cover)
                : Text('No available image'),
          ),

          Gap(8),

          TabBar(
            controller: controller,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(icon: Icon(Icons.restaurant_menu), text: "Ingredients"),
              Tab(icon: Icon(Icons.directions), text: "Steps"),
            ],
          ),

          Gap(4),

          Expanded(
            child: controller.index == 0 ? _buildIngredients() : _buildSteps(),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredients() {
    return ListView.builder(
      itemCount: widget.recipe.ingredients.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              title: Text(
                widget.recipe.ingredients[index],
                style: TextStyle(fontSize: 13),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSteps() {
    return ListView.builder(
      itemCount: widget.recipe.steps.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(widget.recipe.steps[index]),
          ),
        );
      },
    );
  }
}
//recipe_view_screen.dart