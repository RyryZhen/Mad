import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  double boxSize = 10;

  void grow() {
    setState(() {
      if (boxSize < 500) {
        boxSize += 20;
      }
    });
  }

  void shrink() {
    setState(() {
      if (boxSize > 50) {
        boxSize -= 20;
      }
    });
  }

  bool trueColor = true;

  void change() {
    setState(() {
      trueColor = !trueColor;
    });
  }

  final String longText = '''
Flutter is an open-source UI software development kit created by Google. It allows developers to build beautiful and fast applications for mobile, web, and desktop from a single codebase. With Flutter, you can create highly responsive apps with smooth animations and customizable widgets that adapt to different screen sizes and platforms.

The framework uses the Dart programming language, which is object-oriented and optimized for client-side development. Dart makes it easy to manage state, handle asynchronous operations, and structure applications in a clear and maintainable way. Flutter's widget tree allows developers to compose complex UIs from simple building blocks, making development more intuitive and expressive.

One of the key advantages of Flutter is its hot reload feature, which lets you see changes immediately in the running application. This greatly speeds up development and testing, allowing for experimentation and iteration without losing the current state of the app. Flutter also provides a rich set of pre-designed Material and Cupertino widgets, enabling apps to feel native on both Android and iOS devices.

Additionally, Flutter supports advanced graphics, gestures, and animations. You can build custom widgets or extend existing ones to create unique visual experiences. The community around Flutter is growing rapidly, contributing plugins, packages, and tutorials to make development easier for everyone. With its strong ecosystem, cross-platform capabilities, and powerful rendering engine, Flutter has become one of the most popular frameworks for modern app development.

Whether you are building a simple personal project or a complex enterprise application, Flutter gives you the tools and flexibility to deliver high-quality user experiences efficiently. Learning Flutter and Dart together will empower you to become a versatile developer capable of targeting multiple platforms with a single codebase. As technology evolves, mastering Flutter will ensure you stay ahead in the world of cross-platform app development.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rasputin',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.frSStDz_eYPjkPMFbuTOogHaGE?w=227&h=186&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(height: 100, width: 100, color: Colors.black),
                    Container(height: 100, width: 100, color: Colors.red),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Container(
                      height: boxSize,
                      width: boxSize,
                      color: trueColor ? Colors.yellow : Colors.pink,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: grow,
                          child: Text('Click Me +'),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: shrink,
                          child: Text('Click Me -'),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: change,
                      child: Text('Change Color'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(height: 100, width: 100, color: Colors.blue),
                    Container(height: 100, width: 100, color: Colors.green),
                  ],
                ),
                SizedBox(height: 20),
                // Scrollable long paragraph
                Text(
                  longText,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
