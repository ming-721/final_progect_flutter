import 'package:flutter/material.dart';
import 'colors.dart';
import 'wine_data.dart';

class WineDetailScreen extends StatefulWidget {
  final WineItem wine;
  const WineDetailScreen({super.key, required this.wine});

  @override
  State<WineDetailScreen> createState() => _WineDetailScreenState();
}

class _WineDetailScreenState extends State<WineDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final wine = widget.wine;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  IconButton(
                    onPressed: () =>
                        setState(() => wine.isFavorite = !wine.isFavorite),
                    icon: Icon(
                      wine.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  wine.nameKr,
                                  style: const TextStyle(
                                    color: AppColors.textMain,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    height: 1.3,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  wine.nameEn,
                                  style: const TextStyle(
                                    color: AppColors.textSub,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  wine.origin,
                                  style: const TextStyle(
                                    color: AppColors.textSub,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  wine.year,
                                  style: const TextStyle(
                                    color: AppColors.textSub,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            wine.imageAsset,
                            height: 180,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      const Text(
                        '바디감',
                        style: TextStyle(
                          color: AppColors.textMain,
                          fontSize: 14,
                        ),
                      ),
                      Slider(
                        value: 0.7,
                        onChanged: (_) {},
                        activeColor: AppColors.primary,
                        inactiveColor: AppColors.surface,
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
                      const SizedBox(height: 16),
                      const Text(
                        '산도',
                        style: TextStyle(
                          color: AppColors.textMain,
                          fontSize: 14,
                        ),
                      ),
                      Slider(
                        value: 0.5,
                        onChanged: (_) {},
                        activeColor: AppColors.primary,
                        inactiveColor: AppColors.surface,
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
                      const Text(
                        '주요 맛 노트',
                        style: TextStyle(
                          color: AppColors.textMain,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          _FlavorNote(icon: Icons.eco, label: '블랙베리'),
                          _FlavorNote(
                            icon: Icons.icecream_outlined,
                            label: '바닐라',
                          ),
                          _FlavorNote(
                            icon: Icons.cookie_outlined,
                            label: '초콜릿',
                          ),
                          _FlavorNote(icon: Icons.park_outlined, label: '오크'),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            '와이너리',
                            style: TextStyle(
                              color: AppColors.textSub,
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Josh Cellars',
                                style: TextStyle(
                                  color: AppColors.textMain,
                                  fontSize: 13,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: AppColors.textSub,
                                size: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FlavorNote extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FlavorNote({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.surface,
          ),
          child: Icon(icon, color: AppColors.primary, size: 22),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(color: AppColors.textSub, fontSize: 11),
        ),
      ],
    );
  }
}
