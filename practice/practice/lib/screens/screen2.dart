import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Man Who Can't Be Moved")),
      body: SafeArea(
        child: Column(
          children: [
            // 🔵 Fixed CircleAvatar (stays visible)
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://picsum.photos/200/300',
              ), // optional
              backgroundColor: Colors.blueAccent,
            ),
            const SizedBox(height: 20),

            // 🧾 Scrollable long paragraph
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  "This is a very long paragraph that represents the song "
                  "'The Man Who Can't Be Moved'. The man sits at a corner, "
                  "hoping his lost love might find her way back. Day after day, "
                  "he stays there, waiting patiently, ignoring the world around him. "
                  "No matter how much time passes, he refuses to move because his "
                  "heart still believes that love will find its way. "
                  "\n\nHe becomes a symbol of loyalty and unwavering hope. "
                  "People pass by and wonder about his story, but he never leaves. "
                  "His heart remains anchored to the same spot, where it all began — "
                  "at the corner where he lost everything, yet found his purpose. "
                  "\n\nThe story continues endlessly... "
                  "waiting, hoping, believing that one day she’ll return. "
                  "Because he’s the man who can’t be moved. "
                  "This is a very long paragraph that represents the song "
                  "'The Man Who Can't Be Moved'. The man sits at a corner, "
                  "hoping his lost love might find her way back. Day after day, "
                  "he stays there, waiting patiently, ignoring the world around him. "
                  "No matter how much time passes, he refuses to move because his "
                  "heart still believes that love will find its way. "
                  "\n\nHe becomes a symbol of loyalty and unwavering hope. "
                  "People pass by and wonder about his story, but he never leaves. "
                  "His heart remains anchored to the same spot, where it all began — "
                  "at the corner where he lost everything, yet found his purpose. "
                  "\n\nThe story continues endlessly... "
                  "waiting, hoping, believing that one day she’ll return. "
                  "Because he’s the man who can’t be moved. ", // repeats to make it long
                  style: TextStyle(fontSize: 16, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
