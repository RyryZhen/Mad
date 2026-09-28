import 'package:flutter/material.dart';
import 'package:letter_quest/home.dart';

class OnboardingBase extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const OnboardingBase({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.black54),
              ),

              const Spacer(),

              Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.orange.withOpacity(0.5),
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(26),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.image_rounded,
                          size: 100,
                          color: Colors.orange,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
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
      title: "Welcome!",
      description: "Ready to explore the magical world of the alphabet?",
      imagePath: "assets/onboarding/home.png",
      buttonText: "CONTINUE",
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
      title: "4-Pics-1-Letter Game",
      description:
          "Identify the correct image that matches the displayed letter!",
      imagePath: "assets/onboarding/4-Pics-1-Letter Game.png",
      buttonText: "CONTINUE",
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
      title: "Shuffle Gallery",
      description:
          "Discover all the letters in our interactive and fun shuffle gallery.",
      imagePath: "assets/onboarding/shuffle_gallery.png",
      buttonText: "CONTINUE",
      onButtonPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingFour()),
        );
      },
    );
  }
}

class OnboardingFour extends StatelessWidget {
  const OnboardingFour({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingBase(
      title: "Your Favorites",
      description:
          "Save the items you love the most to view them anytime you want!",
      imagePath: "assets/onboarding/favorite.png",
      buttonText: "START",
      onButtonPressed: () {
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => const Home()));
      },
    );
  }
}
