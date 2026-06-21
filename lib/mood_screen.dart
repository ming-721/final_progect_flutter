import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'recommend_screen.dart';
import 'archive_screen.dart';
import 'mypage_screen.dart';

class MoodItem {
  final String label;
  final IconData icon;
  MoodItem(this.label, this.icon);
}

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});

  //AI(claude) 참조
  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  int _selectedIndex = 0;
  int _navIndex = 0;

  final List<MoodItem> moods = [
    MoodItem('편안한', Icons.self_improvement),
    MoodItem('로맨틱한', Icons.favorite),
    MoodItem('활기찬', Icons.wb_sunny),
    MoodItem('차분한', Icons.spa),
    MoodItem('우울한', Icons.sentiment_dissatisfied),
    MoodItem('후끈한', Icons.local_fire_department),
  ];

  void _navigateTo(int index) {
    if (index == _navIndex) return;
    Widget target;
    switch (index) {
      case 1:
        target = const RecommendScreen();
        break;
      case 2:
        target = const ArchiveScreen();
        break;
      case 3:
        target = const MypageScreen();
        break;
      default:
        return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => target),
    );
  }

  //AI(claude) 참조
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.tune, color: AppColors.textSub, size: 24),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'How are you feeling\nToday?',
                style: GoogleFonts.playfairDisplay(
                  color: AppColors.textMain,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                '당신의 감정에 어울리는 와인을\n추천해 드릴게요.',
                style: TextStyle(color: AppColors.textSub, fontSize: 14),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: GridView.builder(
                  itemCount: moods.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.4,
                  ),
                  itemBuilder: (context, index) {
                    final mood = moods[index];
                    final isSelected = index == _selectedIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() => _selectedIndex = index);
                        if (mood.label == '로맨틱한') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RecommendScreen(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              mood.icon,
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textSub,
                              size: 28,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              mood.label,
                              style: TextStyle(
                                color: isSelected
                                    ? AppColors.textMain
                                    : AppColors.textSub,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      //AI(claude) 참조
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border(
            top: BorderSide(
              color: AppColors.textSub.withOpacity(0.15),
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          top: false,
          child: BottomNavigationBar(
            currentIndex: _navIndex,
            onTap: _navigateTo,
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.textSub,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.sentiment_satisfied_alt),
                label: '무드',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: '추천',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border),
                label: '아카이브',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: '마이',
              ),
            ],
          ),
        ),
      ),
    ); // Scaffold 닫기
  }
}
