import 'package:flutter/material.dart';
import 'colors.dart';
import 'wine_data.dart';
import 'wine_detail_screen.dart';
import 'mood_screen.dart';
import 'recommend_screen.dart';
import 'mypage_screen.dart';

class ArchiveScreen extends StatefulWidget {
  const ArchiveScreen({super.key});

  //AI(claude) 참조
  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  int _navIndex = 2;

  void _navigateTo(int index) {
    if (index == _navIndex) return;
    Widget target;
    switch (index) {
      case 0:
        target = const MoodScreen();
        break;
      case 1:
        target = const RecommendScreen();
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

  @override
  Widget build(BuildContext context) {
    final favorites = wines.where((w) => w.isFavorite).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '나의 와인',
                style: TextStyle(
                  color: AppColors.textMain,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: favorites.isEmpty
                    ? const Center(
                        child: Text(
                          '아직 저장한 와인이 없어요',
                          style: TextStyle(color: AppColors.textSub),
                        ),
                      )
                    : ListView.separated(
                        itemCount: favorites.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final wine = favorites[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      WineDetailScreen(wine: wine),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      wine.imageAsset,
                                      width: 56,
                                      height: 56,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          wine.nameKr.replaceAll('\n', ' '),
                                          style: const TextStyle(
                                            color: AppColors.textMain,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '${wine.year} · ${wine.origin}',
                                          style: const TextStyle(
                                            color: AppColors.textSub,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: AppColors.gold,
                                        size: 14,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        '${wine.rating}',
                                        style: const TextStyle(
                                          color: AppColors.textMain,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
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
    );
  }
}
