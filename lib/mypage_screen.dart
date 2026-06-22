import 'package:flutter/material.dart';
import 'colors.dart';
import 'mood_screen.dart';
import 'recommend_screen.dart';
import 'archive_screen.dart';

class MypageScreen extends StatefulWidget {
  const MypageScreen({super.key});

  //AI(claude) 참조
  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  final int _navIndex = 3;
  int _selectedType = 0; // 레드 기본
  double _bodyValue = 0.6;
  double _acidValue = 0.4;
  int _selectedAgeIndex = 1; // 5~10년 기본
  final List<bool> _selectedFlavors = [true, false, true, false, false, false];

  final List<String> wineTypes = ['레드', '화이트', '로제', '스파클링'];
  final List<String> ages = ['3년 이하', '5~10년', '10년 이상'];
  final List<Map<String, dynamic>> flavors = [
    {'label': '블랙베리', 'icon': Icons.eco},
    {'label': '바닐라', 'icon': Icons.icecream_outlined},
    {'label': '초콜릿', 'icon': Icons.cookie_outlined},
    {'label': '오크', 'icon': Icons.park_outlined},
    {'label': '꽃향기', 'icon': Icons.local_florist_outlined},
    {'label': '시트러스', 'icon': Icons.sunny},
  ];

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
      case 2:
        target = const ArchiveScreen();
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
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                '나만의 취향',
                style: TextStyle(
                  color: AppColors.textMain,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                '당신의 취향을 알려주세요.\n더 정확한 추천을 할 수 있어요.',
                style: TextStyle(
                  color: AppColors.textSub,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 선호 와인 타입
                      _sectionTitle('선호하는 와인 타입'),
                      const SizedBox(height: 12),
                      Row(
                        children: List.generate(wineTypes.length, (index) {
                          final isSelected = index == _selectedType;
                          return GestureDetector(
                            onTap: () => setState(() => _selectedType = index),
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.surface,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.primary
                                      : Colors.transparent,
                                ),
                              ),
                              child: Text(
                                wineTypes[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : AppColors.textSub,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      //AI(claude) 참조
                      const SizedBox(height: 24),
                      _sectionTitle('선호하는 바디감'),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: AppColors.primary,
                          inactiveTrackColor: AppColors.surface,
                          thumbColor: AppColors.primary,
                          overlayColor: AppColors.primary.withValues(
                            alpha: 0.2,
                          ),
                          trackHeight: 3,
                        ),
                        child: Slider(
                          value: _bodyValue,
                          onChanged: (v) => setState(() => _bodyValue = v),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            '라이트',
                            style: TextStyle(
                              color: AppColors.textSub,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '풀 바디',
                            style: TextStyle(
                              color: AppColors.textSub,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _sectionTitle('선호하는 산도'),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: AppColors.primary,
                          inactiveTrackColor: AppColors.surface,
                          thumbColor: AppColors.primary,
                          overlayColor: AppColors.primary.withValues(
                            alpha: 0.2,
                          ),
                          trackHeight: 3,
                        ),
                        child: Slider(
                          value: _acidValue,
                          onChanged: (v) => setState(() => _acidValue = v),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            '낮은 산도',
                            style: TextStyle(
                              color: AppColors.textSub,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '높은 산도',
                            style: TextStyle(
                              color: AppColors.textSub,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _sectionTitle('선호하는 빈티지'),
                      const SizedBox(height: 12),
                      Row(
                        children: List.generate(ages.length, (index) {
                          final isSelected = index == _selectedAgeIndex;
                          return GestureDetector(
                            onTap: () =>
                                setState(() => _selectedAgeIndex = index),
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.surface,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                ages[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : AppColors.textSub,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 24),
                      _sectionTitle('선호하는 맛 노트'),
                      const SizedBox(height: 12),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: flavors.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 1.6,
                            ),
                        itemBuilder: (context, index) {
                          final isSelected = _selectedFlavors[index];
                          return GestureDetector(
                            onTap: () => setState(
                              () => _selectedFlavors[index] =
                                  !_selectedFlavors[index],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primaryDark.withValues(
                                        alpha: 0.3,
                                      )
                                    : AppColors.surface,
                                borderRadius: BorderRadius.circular(12),
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
                                    flavors[index]['icon'] as IconData,
                                    color: isSelected
                                        ? AppColors.primary
                                        : AppColors.textSub,
                                    size: 20,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    flavors[index]['label'] as String,
                                    style: TextStyle(
                                      color: isSelected
                                          ? AppColors.textMain
                                          : AppColors.textSub,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 28),
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('취향이 저장되었어요!'),
                                backgroundColor: AppColors.primary,
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: const Text(
                            '저장하기',
                            style: TextStyle(color: Colors.white, fontSize: 16),
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
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border(
            top: BorderSide(
              color: AppColors.textSub.withValues(alpha: 0.15),
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

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.textMain,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
