class WineItem {
  final String year;
  final String nameKr;
  final String nameEn;
  final String origin;
  final double rating;
  final String imageAsset;
  final String category;
  final String mood;
  final String pairing;
  bool isFavorite;

  WineItem({
    required this.year,
    required this.nameKr,
    required this.nameEn,
    required this.origin,
    required this.rating,
    required this.imageAsset,
    required this.category,
    required this.mood,
    required this.pairing,
    this.isFavorite = false,
  });
}

//AI(claude) 참조
final List<WineItem> wines = [
  // 레드
  WineItem(
    year: '2021',
    nameKr: '조쉬 셀러 선정 리저브\n카베르네 소비뇽',
    nameEn: 'Josh Cellars Reserve Cabernet Sauvignon',
    origin: '미국 · 캘리포니아',
    rating: 4.3,
    imageAsset: 'assets/redwine1.png',
    category: '레드',
    mood: '편안한 저녁',
    pairing: '스테이크, 치즈',
  ),
  WineItem(
    year: '2022',
    nameKr: '아포씩 레드',
    nameEn: 'Apothic Red',
    origin: '미국 · 캘리포니아',
    rating: 4.2,
    imageAsset: 'assets/redwine2.png',
    category: '레드',
    mood: '로맨틱한 밤',
    pairing: '파스타, 피자',
  ),
  WineItem(
    year: '2021',
    nameKr: '보글 메를로',
    nameEn: 'Bogle Merlot',
    origin: '미국 · 캘리포니아',
    rating: 4.1,
    imageAsset: 'assets/redwine3.png',
    category: '레드',
    mood: '차분한 휴식',
    pairing: '구운 채소, 양고기',
  ),
  // 화이트
  WineItem(
    year: '2022',
    nameKr: '클라우디 베이\n소비뇽 블랑',
    nameEn: 'Cloudy Bay Sauvignon Blanc',
    origin: '뉴질랜드 · 말버러',
    rating: 4.5,
    imageAsset: 'assets/whitewine1.png',
    category: '화이트',
    mood: '상쾌한 아침',
    pairing: '해산물, 샐러드',
  ),
  WineItem(
    year: '2023',
    nameKr: '베어풋 모스카토',
    nameEn: 'Barefoot Moscato',
    origin: '미국 · 캘리포니아',
    rating: 4.1,
    imageAsset: 'assets/whitewine2.png',
    category: '화이트',
    mood: '달달한 데이트',
    pairing: '케이크, 과일',
  ),
  // 로제
  WineItem(
    year: '2022',
    nameKr: '위스퍼링 엔젤 로제',
    nameEn: 'Whispering Angel Rosé',
    origin: '프랑스 · 프로방스',
    rating: 4.4,
    imageAsset: 'assets/rosewine1.png',
    category: '로제',
    mood: '피크닉',
    pairing: '샐러드, 새우',
  ),
  WineItem(
    year: '2023',
    nameKr: '마테우스 로제',
    nameEn: 'Mateus Rosé',
    origin: '포르투갈',
    rating: 4.0,
    imageAsset: 'assets/rosewine2.png',
    category: '로제',
    mood: '봄날 감성',
    pairing: '과일, 치즈',
  ),
  // 스파클링
  WineItem(
    year: 'N.V.',
    nameKr: '모엣 샹동\n임페리얼 브뤼',
    nameEn: 'Moët & Chandon Impérial',
    origin: '프랑스 · 샹파뉴',
    rating: 4.6,
    imageAsset: 'assets/spaklingwine1.png',
    category: '스파클링',
    mood: '축하',
    pairing: '디저트, 캐비아',
  ),
  WineItem(
    year: 'N.V.',
    nameKr: '마르티니 아스티',
    nameEn: 'Martini Asti',
    origin: '이탈리아 · 피에몬테',
    rating: 4.2,
    imageAsset: 'assets/spaklingwine2.png',
    category: '스파클링',
    mood: '달콤한 파티',
    pairing: '케이크, 과일',
  ),
];
