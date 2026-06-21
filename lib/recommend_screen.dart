import 'package:flutter/material.dart';
import 'colors.dart';
import 'mood_screen.dart';
import 'archive_screen.dart';
import 'mypage_screen.dart';

//AI(claude) 참조
class WineItem {
  final String year;
  final String nameKr;
  final String nameEn;
  final String origin;
  final double rating;
  final String imageAsset;
  final String category;

  WineItem({
    required this.year,
    required this.nameKr,
    required this.nameEn,
    required this.origin,
    required this.rating,
    required this.imageAsset,
    required this.category,
  });
}

class RecommendScreen extends StatefulWidget {
  const RecommendScreen({super.key});

  //AI(claude) 참조
  @override
  State<RecommendScreen> createState() => _RecommendScreenState();
}

class _RecommendScreenState extends State<RecommendScreen> {
  int _navIndex = 1; // 추천 탭이 현재 화면
  int _filterIndex = 1; // 레드 기본 선택

  final List<String> filters = ['전체', '레드', '화이트', '로제', '스파클링'];

  final List<WineItem> wines = [
    WineItem(
      year: '2021',
      nameKr: '조쉬 셀러 선정 리저브\n카베르네 소비뇽',
      nameEn: 'Josh Cellars Reserve Cabernet Sauvignon',
      origin: '미국 · 캘리포니아',
      rating: 4.3,
      imageAsset: 'assets/redwine1.png',
      category: '레드',
    ),
    WineItem(
      year: '2022',
      nameKr: '아포씩 레드',
      nameEn: 'Apothic Red',
      origin: '미국 · 캘리포니아',
      rating: 4.2,
      imageAsset: 'assets/redwine2.png',
      category: '레드',
    ),
    WineItem(
      year: '2021',
      nameKr: '보글 메를로',
      nameEn: 'Bogle Merlot',
      origin: '미국 · 캘리포니아',
      rating: 4.1,
      imageAsset: 'assets/redwine3.png',
      category: '레드',
    ),
  ];

  void _navigateTo(int index) {
    if (index == _navIndex) return;
    Widget target;
    switch (index) {
      case 0:
        target = const MoodScreen();
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.textMain,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.tune, color: AppColors.textSub),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.sort, color: AppColors.textSub),
                      ),
                    ],
                  ),
                ],
              ),
              const Text(
                '추천 와인',
                style: TextStyle(
                  color: AppColors.textMain,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 36,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final isSelected = index == _filterIndex;
                    return GestureDetector(
                      onTap: () => setState(() => _filterIndex = index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.surface,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          filters[index],
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : AppColors.textSub,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: wines.length,
                  itemBuilder: (context, index) {
                    final wine = wines[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                wine.imageAsset,
                                height: 260,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              const Positioned(
                                top: 12,
                                right: 12,
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  wine.year,
                                  style: const TextStyle(
                                    color: AppColors.textSub,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  wine.nameKr,
                                  style: const TextStyle(
                                    color: AppColors.textMain,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    height: 1.3,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  wine.nameEn,
                                  style: const TextStyle(
                                    color: AppColors.textSub,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                          color: AppColors.textSub,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          wine.origin,
                                          style: const TextStyle(
                                            color: AppColors.textSub,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: AppColors.gold,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          wine.rating.toString(),
                                          style: const TextStyle(
                                            color: AppColors.textMain,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
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
