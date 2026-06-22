import 'package:flutter/material.dart';
import 'colors.dart';
import 'mood_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  //AI(claude) 참조
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withValues(alpha: 0.35),
                BlendMode.darken,
              ),
              child: Image.asset('assets/landing.png', fit: BoxFit.cover),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: const Icon(Icons.wine_bar, color: AppColors.primary),
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: 'Wine Mood Pairing\n',
                          style: const TextStyle(color: AppColors.textMain),
                        ),
                        TextSpan(
                          text: 'Curator',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '당신의 무드에 어울리는\n오늘의 와인',
                    style: TextStyle(
                      color: AppColors.textSub,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MoodScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        '시작하기',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
