class WineItem {
  final String year;
  final String nameKr;
  final String nameEn;
  final String origin;
  final double rating;
  final String imageAsset;
  final String category;
  bool isFavorite;

  WineItem({
    required this.year,
    required this.nameKr,
    required this.nameEn,
    required this.origin,
    required this.rating,
    required this.imageAsset,
    required this.category,
    this.isFavorite = false,
  });
}

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
