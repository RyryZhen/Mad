import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login + Search Demo',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

// ------------------ LOGIN SCREEN ------------------

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameCtrl = TextEditingController();
  final lastCtrl = TextEditingController();

  void login() {
    final name = nameCtrl.text.trim();
    final lastname = lastCtrl.text.trim();

    if (name.isEmpty || lastname.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both fields')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(
          username: '$name $lastname',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: lastCtrl,
              decoration: const InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------ SEARCH SCREEN ------------------

class SearchScreen extends StatefulWidget {
  final String username;
  const SearchScreen({super.key, required this.username});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchCtrl = TextEditingController();

  // Sample list of names
  final List<String> names = [
    'Ryan',
    'Maria',
    'John',
    'Michael',
    'Ella',
    'Jokoy',
    'Anne',
    'Lucas',
    'Liam',
    'Chloe',
    'Sophia',
    'Nathan'
  ];

  List<String> filteredNames = [];

  @override
  void initState() {
    super.initState();
    filteredNames = List.from(names);
  }

  void searchName(String query) {
    final results = names
        .where((name) => name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredNames = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${widget.username}!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchCtrl,
              decoration: const InputDecoration(
                labelText: 'Search Name',
                border: OutlineInputBorder(),
              ),
              onChanged: searchName,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(filteredNames[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
