import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  bool show = false;
  final String mySpeech = '''
When I first entered Pangasinan State University, I had no idea that my life would take such a different path from what I originally imagined. I was a 1st year Mechanical Engineering student, driven by the idea of understanding machines, motion, and design. Back then, I thought my future was in engines and gears, the things that fascinated me when I was younger. But during my engineering days, I encountered a subject that unexpectedly changed my direction and it is programming. At first, it felt foreign; I was used to physical components, not lines of code. Yet the more I learned about how computers think and how software can solve real world problems, the more I felt connected to it. I started spending more time experimenting with basic programs and simple projects, realizing that I was more excited about debugging a line of code than calculating mind wrecking formulas. That curiosity slowly grew into a passion, and soon I made one of the biggest decisions of my life—to shift my course from Mechanical Engineering to Information Technology.

Outside of academics, there’s something else that keeps me balanced; riding a bicycle. It’s my favorite thing to do when I need to clear my mind. Some people might say I spend too much on bike parts, upgrades, and gear, and maybe they’re right. But for me, it’s more than just a hobby; it’s my way of finding peace, freedom, and good health. When I’m out on the road, feeling the wind hit my face and the rhythm of the pedals under my feet, I forget about stress, deadlines, and worries. That’s the moment I feel most alive. Even though it means I sometimes have less money left for other things, I believe it’s a good investment for my body, for my mind, and for my happiness. Riding has taught me discipline, patience, and endurance, lessons that I also apply when I’m studying or coding. Just like cycling, programming takes persistence. Sometimes you fall, sometimes the road gets rough, but if you keep pedaling, you always make progress.

Now, as a 22 year old IT student, I’m still figuring out what’s next. I’m not entirely sure what the future holds after graduation, and that uncertainty can be a little scary. But I try not to let it consume me. Instead, I focus on what I can do now, learn, practice, and improve. My dream is to develop systems or apps that can genuinely help people or make everyday life a little easier. Maybe it will be something that supports small businesses, assists students, or contributes to the community in a meaningful way. I know I still have a lot to learn, but I’m eager to explore what’s possible. Looking back, I’m grateful for the unexpected turns of switching courses, discovering new passions, and finding balance through biking. Life doesn’t always follow the plan you start with, but I’ve learned that’s okay. Sometimes the detours are exactly what lead you to where you’re meant to be.
''';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.red, // status bar background color
        statusBarIconBrightness: Brightness.light, // white icons for contrast
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('First App', style: TextStyle(fontSize: 23)),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      show = !show;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text(show ? 'HIDE MY BIO' : 'VIEW MY BIO'),
                ),
                SizedBox(height: 30),
                if (show)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      mySpeech,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 14, height: 1.5),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
