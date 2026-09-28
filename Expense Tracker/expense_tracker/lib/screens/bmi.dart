import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final heightCtrl = TextEditingController();
  final weightCtrl = TextEditingController();
  double? bmi; // nullable so it starts empty
  String result = '';

  void calculateBMI() {
    final height = double.tryParse(heightCtrl.text);
    final weight = double.tryParse(weightCtrl.text);

    if (height == null || weight == null || height <= 0) {
      setState(() {
        result = 'Please enter valid numbers.';
        bmi = null;
      });
      return;
    }

    // BMI formula: weight (kg) / (height (m) ^ 2)
    final calculatedBMI = weight / (height * height);

    String status;
    if (calculatedBMI < 18.5) {
      status = 'Underweight';
    } else if (calculatedBMI < 25) {
      status = 'Normal weight';
    } else if (calculatedBMI < 30) {
      status = 'Overweight';
    } else {
      status = 'Obese';
    }

    setState(() {
      bmi = calculatedBMI;
      result = 'BMI: ${calculatedBMI.toStringAsFixed(2)} ($status)';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: heightCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height (meters)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: weightCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateBMI,
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class ShoppingListPage extends StatefulWidget {
//   const ShoppingListPage({super.key});

//   @override
//   State<ShoppingListPage> createState() => _ShoppingListPageState();
// }

// class _ShoppingListPageState extends State<ShoppingListPage> {
//   final TextEditingController _controller = TextEditingController();
//   List<Map<String, dynamic>> items = [];
//   bool showAddField = false;

//   void _addItem() {
//     if (_controller.text.isNotEmpty) {
//       setState(() {
//         items.add({"name": _controller.text, "checked": false});
//         _controller.clear();
//         showAddField = false;
//       });
//     }
//   }

//   void _toggleSelectAll() {
//     bool allChecked = items.every((item) => item["checked"]);
//     setState(() {
//       for (var item in items) {
//         item["checked"] = !allChecked;
//       }
//     });
//   }

//   void _deleteSelected() {
//     setState(() {
//       items.removeWhere((item) => item["checked"]);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool hasChecked = items.any((item) => item["checked"]);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ShoppingList'),
//         leading: IconButton(
//           icon: const Icon(Icons.check_circle),
//           onPressed: _toggleSelectAll,
//         ),
//         actions: [
//           if (!showAddField)
//             IconButton(
//               icon: const Icon(Icons.add),
//               onPressed: () {
//                 setState(() {
//                   showAddField = true;
//                 });
//               },
//             ),
//           if (hasChecked)
//             IconButton(
//               icon: const Icon(Icons.delete),
//               onPressed: _deleteSelected,
//             ),
//         ],
//       ),
//       body: Column(
//         children: [
//           if (showAddField)
//             Container(
//               padding: const EdgeInsets.all(10),
//               color: Colors.grey.shade200,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _controller,
//                       decoration: const InputDecoration(
//                         hintText: "Enter item...",
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(onPressed: _addItem, child: const Text("Add")),
//                 ],
//               ),
//             ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 return CheckboxListTile(
//                   title: Text(
//                     items[index]["name"],
//                     style: TextStyle(
//                       decoration: items[index]["checked"]
//                           ? TextDecoration.lineThrough
//                           : TextDecoration.none,
//                       decorationColor: Colors.red,
//                       decorationThickness: 2,
//                     ),
//                   ),
//                   value: items[index]["checked"],
//                   onChanged: (val) {
//                     setState(() {
//                       items[index]["checked"] = val!;
//                     });
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
