import 'package:html/dom.dart' as html_dom;
import '../models/news_article.dart';

class NewsService {
  static const String baseUrl = 'https://www.kigalitoday.com';

  // Headers to mimic a browser request
  static const Map<String, String> headers = {
    'User-Agent':
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
    'Accept':
        'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
    'Accept-Language': 'en-US,en;q=0.5',
    'Accept-Encoding': 'gzip, deflate',
    'Connection': 'keep-alive',
    'Upgrade-Insecure-Requests': '1',
  };

  // Fetch latest news from homepage
  static Future<List<NewsArticle>> fetchLatestNews() async {
    // Return dummy data directly without network requests
    return _getDummyNewsData();
  }

  // Fetch news by category
  static Future<List<NewsArticle>> fetchNewsByCategory(
    String categoryUrl,
  ) async {
    // Return dummy data filtered by category
    final allNews = _getDummyNewsData();
    return allNews
        .where(
          (article) => article.category.toLowerCase().contains(
            categoryUrl.toLowerCase().replaceAll('/', ''),
          ),
        )
        .toList();
  }

  // Extract articles from known content structure
  static List<NewsArticle> _extractArticlesFromKnownContent(
    html_dom.Document? document,
  ) {
    final List<NewsArticle> articles = [];

    // Real news articles from Kigali Today website
    final realArticles = [
      {
        'title':
            'Minisitiri Nduhungirehe yagaragaje ko Tshisekedi yatambamiye isinywa ry\'amasezerano ya Washington',
        'content':
            'Minisitiri w\'Intebe, Dr Nsengiyumva Justin yagaragaje ko Perezida wa DRC Tshisekedi yatambamiye isinywa ry\'amasezerano ya Washington. Ibi byagaragajwe mu kiganiro yakoze n\'abanyamakuru ku wa 4 Ukwakira 2025.',
        'category': 'Mu Rwanda',
        'imageUrl':
            'https://images.unsplash.com/photo-1582213782179-e0d53f98f2ca?w=400&h=300&fit=crop',
        'url': '$baseUrl/news/tshisekedi-washington-agreement',
        'timeAgo': '2 hours ago',
        'isBreaking': true,
      },
      {
        'title':
            'Bamfashije byose, ndabashimira - Uwabyaye umwana akamwitirira UCI',
        'content':
            'Umubyeyi witwa Abimpaye Gentille, yise umwana we w\'umukobwa Ange UCI Noella, kubera ko yamubyaye yagiye gufana Shampiyona y\'Isi y\'Amagare. Umwana w\'imyaka 8 yegukanye umudari wa feza mu mikino y\'amagare.',
        'category': 'Amagare',
        'imageUrl':
            'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?w=400&h=300&fit=crop',
        'url': '$baseUrl/sports/uci-championship',
        'timeAgo': '2 hours ago',
        'isBreaking': false,
      },
      {
        'title':
            'Mwogo: Basuye Ku Mulindi w\'Intwari biyemeza kwimakaza Ubumwe n\'Ubudaheranwa',
        'content':
            'Abasuye ku Mulindi w\'Intwari biyemeza kwimakaza ubumwe n\'ubudaheranwa mu Rwanda. Ibi byavuzwe mu nama y\'abayobozi b\'intara y\'i Mwogo.',
        'category': 'Mu Rwanda',
        'imageUrl':
            'https://images.unsplash.com/photo-1521737711867-e3b97375f902?w=400&h=300&fit=crop',
        'url': '$baseUrl/news/unity-reconciliation',
        'timeAgo': '3 hours ago',
        'isBreaking': false,
      },
      {
        'title':
            'Urwego rw\'Ikoranabuhanga rwatanze akazi ku bagera ku 1990 mu mezi 9 gusa',
        'content':
            'Urwego rw\'Ikoranabuhanga rwatanze akazi ku bagera ku 1990 mu mezi 9 gusa mu Rwanda. Ibi byagaragajwe na Minisitiri w\'Ikoranabuhanga.',
        'category': 'Iterambere',
        'imageUrl':
            'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=400&h=300&fit=crop',
        'url': '$baseUrl/technology/tech-jobs-1990',
        'timeAgo': '3 hours ago',
        'isBreaking': false,
      },
      {
        'title':
            'Abarokokeye i Tumba bemeza ko kujurira kwa Dr Munyemana ari ukwigiza nkana',
        'content':
            'Abarokokeye i Tumba bemeza ko kujurira kwa Dr Munyemana ari ukwigiza nkana. Ibi byavuzwe n\'abayobozi b\'akarere ka Tumba.',
        'category': 'Mu Rwanda',
        'imageUrl':
            'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=400&h=300&fit=crop',
        'url': '$baseUrl/news/dr-munyemana-tumba',
        'timeAgo': '3 hours ago',
        'isBreaking': false,
      },
      {
        'title':
            '#WCQ2026: Imanishimwe Emmanuel yongerewe mu Mavubi yitegura Benin na Afurika y\'Epfo',
        'content':
            'Myugariro w\'ibumoso Imanishimwe Emmanuel yongerewe mu bakinnyi b\'Amavubi yitegura imikino ya Benin na Afurika y\'Epfo mu gushaka itike yo kwinjira mu mikino y\'Isi.',
        'category': 'Football',
        'imageUrl':
            'https://images.unsplash.com/photo-1431324155629-1a6deb1dec8d?w=400&h=300&fit=crop',
        'url': '$baseUrl/sports/wcq2026-emanuel',
        'timeAgo': '7 hours ago',
        'isBreaking': false,
      },
      {
        'title':
            'Muhanga: Umugabo ukekwaho gushinga umutwe w\'abagizi ba nabi yafashwe',
        'content':
            'Umugabo ukekwaho gushinga umutwe w\'abagizi ba nabi yafashwe mu karere ka Muhanga. Ibi byagaragajwe na Polisi y\'u Rwanda.',
        'category': 'Mu Rwanda',
        'imageUrl':
            'https://images.unsplash.com/photo-1582213782179-e0d53f98f2ca?w=400&h=300&fit=crop',
        'url': '$baseUrl/news/muhanga-arrest',
        'timeAgo': '8 hours ago',
        'isBreaking': false,
      },
      {
        'title':
            '\'Rwanda Smart Education\', igisubizo ku bibazo bya Internet mu mashuri',
        'content':
            'Urwego rw\'Uburezi rwatanze igisubizo ku bibazo bya Internet mu mashuri y\'u Rwanda. Iki gikorwa cyitwa "Rwanda Smart Education".',
        'category': 'Amashuri',
        'imageUrl':
            'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=400&h=300&fit=crop',
        'url': '$baseUrl/education/smart-education',
        'timeAgo': '10 hours ago',
        'isBreaking': false,
      },
      {
        'title': 'RDC yanze gusinyana n\'u Rwanda amasezerano y\'ubukungu',
        'content':
            'Repubulika Iharanira Demokarasi ya Kongo yanze gusinyana n\'u Rwanda amasezerano y\'ubukungu. Ibi byagaragajwe na Minisitiri w\'Ubukungu.',
        'category': 'Mu Rwanda',
        'imageUrl':
            'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=400&h=300&fit=crop',
        'url': '$baseUrl/economy/rdc-rwanda-agreement',
        'timeAgo': '10 hours ago',
        'isBreaking': false,
      },
      {
        'title': 'Perezida Kagame yazamuye mu ntera ba Ofisiye bato 632',
        'content':
            'Perezida Paul Kagame yazamuye mu ntera ba Ofisiye bato 632 bo mu Ngabo z\'Ubutabazi z\'u Rwanda (RDF). Iki gikorwa cyabereye ku wa 4 Ukwakira 2025.',
        'category': 'Mu Rwanda',
        'imageUrl':
            'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400&h=300&fit=crop',
        'url': '$baseUrl/news/kagame-officers-promotion',
        'timeAgo': '1 day ago',
        'isBreaking': false,
      },
      {
        'title':
            'Basketball: Tigers BBC itsinze REG BBC yegukana igikombe cya mbere mu mateka',
        'content':
            'Ikipe ya Tigers Basketball club izahagararira U Rwanda nyuma yo kwegukana igikombe cya Rwanda cup bwa mbere mu mateka yayo. Iki gikorwa cyabereye ku wa 4 Ukwakira 2025.',
        'category': 'Basketball',
        'imageUrl':
            'https://images.unsplash.com/photo-1546519638-68e109498ffc?w=400&h=300&fit=crop',
        'url': '$baseUrl/sports/tigers-basketball-championship',
        'timeAgo': '1 day ago',
        'isBreaking': false,
      },
      {
        'title':
            'Kwinjira muri RDF bitanga umusanzu mu Iterambere ry\'u Rwanda- Perezida Kagame',
        'content':
            'Perezida Paul Kagame yavuze ko kwinjira muri RDF bitanga umusanzu mu Iterambere ry\'u Rwanda. Ibi byavuzwe mu kiganiro yakoze n\'abanyeshuri.',
        'category': 'Mu Rwanda',
        'imageUrl':
            'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400&h=300&fit=crop',
        'url': '$baseUrl/news/kagame-rdf-development',
        'timeAgo': '1 day ago',
        'isBreaking': false,
      },
      // Economy Articles
      {
        'title':
            'Ubukungu bw\'u Rwanda burakomeje kwiyongera mu mezi 6 y\'nyuma',
        'content':
            'Ubukungu bw\'u Rwanda burakomeje kwiyongera mu mezi 6 y\'nyuma. Ibi byagaragajwe na Banki Nkuru y\'u Rwanda mu raporo y\'ubukungu.',
        'category': 'Ubukungu',
        'imageUrl':
            'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=400&h=300&fit=crop',
        'url': '$baseUrl/economy/rwanda-economic-growth',
        'timeAgo': '4 hours ago',
        'isBreaking': false,
      },
      {
        'title': 'Amashini y\'ubucuruzi y\'u Rwanda yongeye kwiyongera ku 15%',
        'content':
            'Amashini y\'ubucuruzi y\'u Rwanda yongeye kwiyongera ku 15% mu mwaka w\'ubucuruzi. Ibi byagaragajwe na Minisitiri w\'Ubucuruzi.',
        'category': 'Ubukungu',
        'imageUrl':
            'https://images.unsplash.com/photo-1554224155-6726b3ff858f?w=400&h=300&fit=crop',
        'url': '$baseUrl/economy/rwanda-trade-increase',
        'timeAgo': '6 hours ago',
        'isBreaking': false,
      },
      {
        'title':
            'Banki y\'u Rwanda yatanze amafaranga 50 miliyoni USD ku bucuruzi',
        'content':
            'Banki y\'u Rwanda yatanze amafaranga 50 miliyoni USD ku bucuruzi bw\'abantu bato. Iki gikorwa cyagufashije abantu benshi.',
        'category': 'Ubukungu',
        'imageUrl':
            'https://images.unsplash.com/photo-1559526324-4b87b5e36e44?w=400&h=300&fit=crop',
        'url': '$baseUrl/economy/rwanda-bank-loans',
        'timeAgo': '8 hours ago',
        'isBreaking': false,
      },
      // Sports Articles
      {
        'title':
            'Amavubi y\'u Rwanda yatsinze Burundi 2-0 mu gikombe cy\'Afurika',
        'content':
            'Ikipe y\'Amavubi y\'u Rwanda yatsinze Burundi 2-0 mu gikombe cy\'Afurika. Iki gikorwa cyabereye mu kibuga cy\'Amahoro.',
        'category': 'Imikino',
        'imageUrl':
            'https://images.unsplash.com/photo-1431324155629-1a6deb1dec8d?w=400&h=300&fit=crop',
        'url': '$baseUrl/sports/rwanda-beats-burundi',
        'timeAgo': '5 hours ago',
        'isBreaking': true,
      },
      {
        'title': 'Umukinnyi w\'amagare w\'u Rwanda yegukanye umudari wa zahabu',
        'content':
            'Umukinnyi w\'amagare w\'u Rwanda yegukanye umudari wa zahabu mu mikino y\'amagare y\'Afurika. Iki gikorwa cyabereye i Cairo.',
        'category': 'Imikino',
        'imageUrl':
            'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?w=400&h=300&fit=crop',
        'url': '$baseUrl/sports/rwanda-cycling-gold',
        'timeAgo': '7 hours ago',
        'isBreaking': false,
      },
      {
        'title': 'Basketball: REG BBC yatsinze Patriots BBC 85-78',
        'content':
            'Ikipe ya REG Basketball Club yatsinze Patriots BBC 85-78 mu gikombe cya Basketball y\'u Rwanda. Iki gikorwa cyabereye mu kibuga cy\'Amahoro.',
        'category': 'Imikino',
        'imageUrl':
            'https://images.unsplash.com/photo-1546519638-68e109498ffc?w=400&h=300&fit=crop',
        'url': '$baseUrl/sports/reg-beats-patriots',
        'timeAgo': '9 hours ago',
        'isBreaking': false,
      },
      // Technology Articles
      {
        'title': 'Rwanda yatangije serivisi ya 5G mu mijyi mikuru',
        'content':
            'Rwanda yatangije serivisi ya 5G mu mijyi mikuru nka Kigali, Huye na Musanze. Iki gikorwa cyagufashije abantu benshi.',
        'category': 'Ikoranabuhanga',
        'imageUrl':
            'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=400&h=300&fit=crop',
        'url': '$baseUrl/technology/rwanda-5g-launch',
        'timeAgo': '3 hours ago',
        'isBreaking': false,
      },
      {
        'title': 'KLab yatangije ikigo cy\'ubwoba cy\'ikoranabuhanga',
        'content':
            'KLab yatangije ikigo cy\'ubwoba cy\'ikoranabuhanga mu Rwanda. Iki gikorwa cyagufashije abantu benshi mu kwiga ikoranabuhanga.',
        'category': 'Ikoranabuhanga',
        'imageUrl':
            'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=400&h=300&fit=crop',
        'url': '$baseUrl/technology/klab-innovation-center',
        'timeAgo': '5 hours ago',
        'isBreaking': false,
      },
      // Health Articles
      {
        'title': 'Rwanda yongeye kwiyongera mu kurwanya indwara z\'umutima',
        'content':
            'Rwanda yongeye kwiyongera mu kurwanya indwara z\'umutima. Iki gikorwa cyagufashije abantu benshi mu kurwanya indwara.',
        'category': 'Ubuzima',
        'imageUrl':
            'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=400&h=300&fit=crop',
        'url': '$baseUrl/health/rwanda-heart-disease',
        'timeAgo': '4 hours ago',
        'isBreaking': false,
      },
      {
        'title': 'Kliniki y\'u Rwanda yatangije serivisi ya telemedicine',
        'content':
            'Kliniki y\'u Rwanda yatangije serivisi ya telemedicine. Iki gikorwa cyagufashije abantu benshi mu kubona ubuvuzi.',
        'category': 'Ubuzima',
        'imageUrl':
            'https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?w=400&h=300&fit=crop',
        'url': '$baseUrl/health/rwanda-telemedicine',
        'timeAgo': '6 hours ago',
        'isBreaking': false,
      },
      // Education Articles
      {
        'title': 'Rwanda yongeye kwiyongera mu kwiga kw\'abana bato',
        'content':
            'Rwanda yongeye kwiyongera mu kwiga kw\'abana bato. Iki gikorwa cyagufashije abana benshi mu kwiga.',
        'category': 'Uburezi',
        'imageUrl':
            'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=400&h=300&fit=crop',
        'url': '$baseUrl/education/rwanda-early-learning',
        'timeAgo': '5 hours ago',
        'isBreaking': false,
      },
      {
        'title': 'Ishuri ry\'u Rwanda ryatangije kwiga kw\'ikoranabuhanga',
        'content':
            'Ishuri ry\'u Rwanda ryatangije kwiga kw\'ikoranabuhanga. Iki gikorwa cyagufashije abana benshi mu kwiga ikoranabuhanga.',
        'category': 'Uburezi',
        'imageUrl':
            'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=400&h=300&fit=crop',
        'url': '$baseUrl/education/rwanda-tech-education',
        'timeAgo': '7 hours ago',
        'isBreaking': false,
      },
      // Development Articles
      {
        'title': 'Rwanda yatangije gahunda y\'iterambere ry\'imijyi',
        'content':
            'Rwanda yatangije gahunda y\'iterambere ry\'imijyi. Iki gikorwa cyagufashije imijyi y\'u Rwanda kwiyongera.',
        'category': 'Iterambere',
        'imageUrl':
            'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400&h=300&fit=crop',
        'url': '$baseUrl/development/rwanda-urban-development',
        'timeAgo': '6 hours ago',
        'isBreaking': false,
      },
      {
        'title': 'Gahunda y\'iterambere ry\'ubwoba yatangijwe mu Rwanda',
        'content':
            'Gahunda y\'iterambere ry\'ubwoba yatangijwe mu Rwanda. Iki gikorwa cyagufashije abantu benshi mu kwiyongera.',
        'category': 'Iterambere',
        'imageUrl':
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=300&fit=crop',
        'url': '$baseUrl/development/rwanda-innovation-program',
        'timeAgo': '8 hours ago',
        'isBreaking': false,
      },
      // Business Articles
      {
        'title': 'Ubucuruzi bw\'u Rwanda burakomeje kwiyongera',
        'content':
            'Ubucuruzi bw\'u Rwanda burakomeje kwiyongera. Ibi byagaragajwe na Minisitiri w\'Ubucuruzi.',
        'category': 'Ubucuruzi',
        'imageUrl':
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=300&fit=crop',
        'url': '$baseUrl/business/rwanda-business-growth',
        'timeAgo': '5 hours ago',
        'isBreaking': false,
      },
      {
        'title': 'Abacuruzi b\'u Rwanda bavuze ko ubucuruzi burakomeje',
        'content':
            'Abacuruzi b\'u Rwanda bavuze ko ubucuruzi burakomeje. Ibi byavuzwe mu nama y\'abacuruzi.',
        'category': 'Ubucuruzi',
        'imageUrl':
            'https://images.unsplash.com/photo-1554224155-6726b3ff858f?w=400&h=300&fit=crop',
        'url': '$baseUrl/business/rwanda-traders-meeting',
        'timeAgo': '7 hours ago',
        'isBreaking': false,
      },
      // Agriculture Articles
      {
        'title': 'Ubuhinzi bw\'u Rwanda burakomeje kwiyongera',
        'content':
            'Ubuhinzi bw\'u Rwanda burakomeje kwiyongera. Ibi byagaragajwe na Minisitiri w\'Ubuhinzi.',
        'category': 'Ubuhinzi',
        'imageUrl':
            'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=400&h=300&fit=crop',
        'url': '$baseUrl/agriculture/rwanda-agriculture-growth',
        'timeAgo': '4 hours ago',
        'isBreaking': false,
      },
      {
        'title': 'Abahinzi b\'u Rwanda bavuze ko ubuhinzi burakomeje',
        'content':
            'Abahinzi b\'u Rwanda bavuze ko ubuhinzi burakomeje. Ibi byavuzwe mu nama y\'abahinzi.',
        'category': 'Ubuhinzi',
        'imageUrl':
            'https://images.unsplash.com/photo-1574943320219-553eb213f72d?w=400&h=300&fit=crop',
        'url': '$baseUrl/agriculture/rwanda-farmers-meeting',
        'timeAgo': '6 hours ago',
        'isBreaking': false,
      },
    ];

    for (int i = 0; i < realArticles.length; i++) {
      final articleData = realArticles[i];
      final hoursAgo = i < 3 ? i + 2 : (i < 6 ? i + 5 : i + 8);
      articles.add(
        NewsArticle(
          id: 'real_$i',
          title: articleData['title'] as String,
          content: articleData['content'] as String,
          excerpt:
              (articleData['content'] as String).length > 150
                  ? '${(articleData['content'] as String).substring(0, 150)}...'
                  : articleData['content'] as String,
          imageUrl: articleData['imageUrl'] as String,
          category: articleData['category'] as String,
          author: 'Kigali Today',
          publishedDate: DateTime.now().subtract(Duration(hours: hoursAgo)),
          url: articleData['url'] as String,
          isBreaking: articleData['isBreaking'] as bool,
        ),
      );
    }

    return articles;
  }

  // Search for articles
  static Future<List<NewsArticle>> searchNews(String query) async {
    // Search through dummy data
    final allNews = _getDummyNewsData();
    return allNews
        .where(
          (article) =>
              article.title.toLowerCase().contains(query.toLowerCase()) ||
              article.content.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  // Get dummy news data
  static List<NewsArticle> _getDummyNewsData() {
    return _extractArticlesFromKnownContent(null);
  }
}
