import 'package:bike_buddy2/home.dart';
import 'package:flutter/material.dart';

//lib\onboarding.dart
class OnboardingBase extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final double progress;

  const OnboardingBase({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.buttonText,
    required this.onButtonPressed,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              color: Colors.blue[800],
              minHeight: 6,
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.15),
                    blurRadius: 30,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  imagePath,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 300,
                    color: Colors.grey[100],
                    child: const Icon(
                      Icons.directions_bike,
                      size: 80,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingBase(
      title: "GEAR UP",
      description: "Welcome to Bike Buddy. We're here to guide you on track!",
      imagePath: "assets/guide.png",
      buttonText: "CONTINUE",
      progress: 0.33,
      onButtonPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingTwo()),
        );
      },
    );
  }
}

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingBase(
      title: "INFORMATIVE TIPS",
      description: "Improve your riding experience with our guide and tips!",
      imagePath: "assets/tips.png",
      buttonText: "CONTINUE",
      progress: 0.66,
      onButtonPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingThree()),
        );
      },
    );
  }
}

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingBase(
      title: "PRO TIPS",
      description: "Be one of the pro!",
      imagePath: "assets/pro.png",
      buttonText: "START RIDING",
      progress: 1.0,
      onButtonPressed: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => HomeScreen()));
      },
    );
  }
}
