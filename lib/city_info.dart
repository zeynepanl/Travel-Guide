class CityInfo {
  final String cityName;
  final String cityImage;
  final String cityInfo;
  final List<String> placesToVisit;
  final List<String> placeImages;
  final List<String> popularRestaurants;
  final List<String> famousFoods;

  CityInfo({
    required this.cityName,
    required this.cityImage,
    required this.cityInfo,
    required this.placesToVisit,
    required this.placeImages,
    required this.popularRestaurants,
    required this.famousFoods,
  });
}

final CityInfo istanbulInfo = CityInfo(
  cityName: 'İstanbul',
  cityImage: 'assets/istanbul.jpeg',
  cityInfo: 'İstanbul, M.Ö. 667 yılında Antik Yunanlılar tarafından Byzantion adıyla kurulmuştur. Şehir, stratejik konumu nedeniyle hızla önem kazanmıştır. M.S. 330 yılında Roma İmparatoru I. Konstantin, Byzantion\'u Doğu Roma İmparatorluğu\'nun başkenti yapmış ve adını Konstantinopolis olarak değiştirmiştir. Ayasofya, Theodosius Surları ve Hipodrom bu dönemde inşa edilmiştir.\n\n'
      '1453 yılında Osmanlı Sultanı II. Mehmet (Fatih Sultan Mehmet) tarafından fethedilen İstanbul, Osmanlı İmparatorluğu\'nun başkenti olmuştur. Topkapı Sarayı, Süleymaniye Camii ve Kapalıçarşı bu dönemde inşa edilmiştir.\n\n'
      'İstanbul\'un tarihi önemi, hem Doğu hem de Batı dünyası için büyük bir merkez olması, çeşitli medeniyetlerin izlerini taşıması ve kültürel çeşitliliği ile birleşmektedir. Tarih boyunca birçok imparatorluğa ev sahipliği yapmış olan İstanbul, bugün de kültürel ve ekonomik anlamda büyük bir öneme sahiptir.',
  placesToVisit: ['Ayasofya', 'Topkapı Sarayı', 'Yerebatan Sarnıcı', 'Beylerbeyi Sarayı', 'Dolmabahçe Sarayı', 'Kuzguncuk'],
  placeImages: ['assets/ayasofya.png', 'assets/topkapisarayi.png', 'assets/yerebatan.jpeg', 'assets/beylerbeyi.jpeg', 'assets/dolmabahçesarayi.png', 'assets/kuzguncuk.jpeg'],
  popularRestaurants: ['Adella Seafood Restorant', 'Lotiz Lounge & Hookah', 'Mivan Restaurant Cafe'],
  famousFoods: ['Sultanahmet Köftesi', 'Balık Ekmek', 'Islak Hamburger'],
);

final List<CityInfo> citiesInfo = [
  istanbulInfo,
  CityInfo(
    cityName: 'İzmir',
    cityImage: 'assets/izmir.jpeg',
    cityInfo: 'İzmir, Ege Bölgesi\'nde yer alan büyük bir şehir olup Türkiye\'nin üçüncü büyük metropolüdür. Tarihi boyunca birçok medeniyete ev sahipliği yapmıştır.',
    placesToVisit: ['Efes Antik Kenti', 'Saat Kulesi', 'Kordon', 'Kadifekale', 'Asansör'],
    placeImages: ['assets/efes.jpeg', 'assets/saatkulesi.jpeg', 'assets/kordon.jpeg', 'assets/kadifekale.jpeg', 'assets/asansor.jpeg'],
    popularRestaurants: ['Deniz Restaurant', 'Sakız Restaurant', 'Topçu Restoran'],
    famousFoods: ['Boyoz', 'Kumru', 'İzmir Köfte'],
  ),
  CityInfo(
    cityName: 'Antalya',
    cityImage: 'assets/antalya.jpeg',
    cityInfo: 'Antalya, Türkiye\'nin en önemli turistik şehirlerinden biridir. Akdeniz kıyısında yer alır ve muhteşem plajlarıyla ünlüdür.',
    placesToVisit: ['Kaleiçi', 'Hadrian Kapısı', 'Düden Şelalesi', 'Konyaaltı Plajı', 'Aspendos Tiyatrosu'],
    placeImages: ['assets/kaleici.jpeg', 'assets/hadrian.jpeg', 'assets/duden.jpeg', 'assets/konyaalti.jpeg', 'assets/aspendos.jpeg'],
    popularRestaurants: ['7 Mehmet', 'Seraser Fine Dining', 'Vanilla Lounge'],
    famousFoods: ['Piyaz', 'Tandır Kebabı', 'Citrus Salata'],
  ),
  CityInfo(
    cityName: 'Muğla',
    cityImage: 'assets/mugla.jpeg',
    cityInfo: 'Muğla, Türkiye\'nin Ege Bölgesi\'nde yer alan ve turistik ilçeleriyle ünlü bir ildir. Bodrum, Marmaris, Fethiye gibi turistik beldelere sahiptir.',
    placesToVisit: ['Ölüdeniz', 'Bodrum Kalesi', 'Marmaris Kalesi', 'Kelebekler Vadisi', 'Saklıkent Kanyonu'],
    placeImages: ['assets/oludeniz.jpeg', 'assets/bodrumkalesi.jpeg', 'assets/marmariskalesi.jpeg', 'assets/kelebeklervadisi.jpeg', 'assets/saklikent.jpeg'],
    popularRestaurants: ['Memedof', 'Oasis', 'Arsipel'],
    famousFoods: ['Çökertme Kebabı', 'Kabak Çiçeği Dolması', 'Bodrum Mandalinası'],
  ),
  CityInfo(
    cityName: 'Bursa',
    cityImage: 'assets/bursa.jpeg',
    cityInfo: 'Bursa, Türkiye\'nin Marmara Bölgesi\'nde yer alan ve Osmanlı İmparatorluğu\'nun ilk başkenti olan bir şehirdir. Yeşil doğası ve tarihi dokusuyla ünlüdür.',
    placesToVisit: ['Uludağ', 'Yeşil Türbe', 'Koza Han', 'Cumalıkızık', 'Tophane'],
    placeImages: ['assets/uludag.jpeg', 'assets/yesilturbe.jpeg', 'assets/kozahan.jpeg', 'assets/cumalikizlik.jpeg', 'assets/tophane.jpeg'],
    popularRestaurants: ['İskender Kebap', 'Uludağ Kebapçısı', 'Tarihi Çınaraltı'],
    famousFoods: ['İskender Kebap', 'Kemalpaşa Tatlısı', 'Cantık'],
  ),
  CityInfo(
    cityName: 'Aydın',
    cityImage: 'assets/aydin.jpeg',
    cityInfo: 'Aydın, Ege Bölgesi\'nde yer alan ve tarihi antik çağlara kadar uzanan bir şehirdir. Doğal güzellikleri ve tarihi zenginlikleriyle ünlüdür.',
    placesToVisit: ['Aphrodisias', 'Didim', 'Milet', 'Kuşadası', 'Priene'],
    placeImages: ['assets/aphrodisias.jpeg', 'assets/didim.jpeg', 'assets/milet.jpeg', 'assets/kusadasi.jpeg', 'assets/priene.jpeg'],
    popularRestaurants: ['Kazım Usta', 'Şirin Restoran', 'Kısmet Lokantası'],
    famousFoods: ['Çine Köftesi', 'Keşkek', 'Kuyu Tandır'],
  ),
  CityInfo(
    cityName: 'Çanakkale',
    cityImage: 'assets/canakkale.jpeg',
    cityInfo: 'Çanakkale, Türkiye\'nin kuzeybatısında, Marmara Bölgesi\'nde yer alan bir ildir. Tarihi Gelibolu Yarımadası ve Truva Antik Kenti ile ünlüdür.',
    placesToVisit: ['Truva Antik Kenti', 'Gelibolu Yarımadası', 'Çimenlik Kalesi', 'Aynalı Çarşı', 'Assos'],
    placeImages: ['assets/truva.jpeg', 'assets/gelibolu.jpeg', 'assets/cimenlikkalesi.jpeg', 'assets/aynalicarsi.jpeg', 'assets/assos.jpeg'],
    popularRestaurants: ['Yalova Restoran', 'Liman Lokantası', 'Sardalye'],
    famousFoods: ['Balık Ekmek', 'Peynir Helvası', 'Ezine Peyniri'],
  ),
  CityInfo(
    cityName: 'Ankara',
    cityImage: 'assets/ankara.jpeg',
    cityInfo: 'Ankara, Türkiye\'nin başkenti ve ikinci büyük şehridir. Tarihi dokusu ve modern yaşamı bir arada barındırır.',
    placesToVisit: ['Anıtkabir', 'Ankara Kalesi', 'Atatürk Orman Çiftliği', 'Hamamönü', 'Kocatepe Camii'],
    placeImages: ['assets/anitkabir.jpeg', 'assets/ankarakalesi.jpeg', 'assets/ataturkormanciftligi.jpeg', 'assets/hamamonu.jpeg', 'assets/kocatepecamii.jpeg'],
    popularRestaurants: ['Trilye', 'Göksu Lokantası', 'Nusr-Et Steakhouse'],
    famousFoods: ['Ankara Tava', 'Beypazarı Kurusu', 'Aspava'],
  ),
  CityInfo(
    cityName: 'Nevşehir',
    cityImage: 'assets/nevsehir.jpeg',
    cityInfo: 'Nevşehir, Türkiye\'nin Kapadokya bölgesinde yer alır ve peri bacalarıyla ünlüdür. Tarihi ve doğal güzellikleriyle turistlerin ilgisini çeker.',
    placesToVisit: ['Göreme Açık Hava Müzesi', 'Uçhisar Kalesi', 'Derinkuyu Yeraltı Şehri', 'Paşabağları', 'Ihlara Vadisi'],
    placeImages: ['assets/goreme.jpeg', 'assets/uchisar.jpeg', 'assets/derinkuyu.jpeg', 'assets/pasabagi.jpeg', 'assets/ihlara.jpeg'],
    popularRestaurants: ['Dibek Restaurant', 'Seyyah Han', 'Topdeck Cave Restaurant'],
    famousFoods: ['Testi Kebabı', 'Nevşehir Mantısı', 'Düğün Çorbası'],
  ),
  CityInfo(
    cityName: 'Ordu',
    cityImage: 'assets/ordu.jpeg',
    cityInfo: 'Ordu, Karadeniz Bölgesi\'nde yer alan ve doğal güzellikleriyle bilinen bir şehirdir. Fındık üretimiyle de ünlüdür.',
    placesToVisit: ['Boztepe', 'Perşembe Yaylası', 'Yason Burnu', 'Gölköy', 'Ulugöl'],
    placeImages: ['assets/boztepe.jpeg', 'assets/persembe.jpeg', 'assets/yasonburnu.jpeg', 'assets/golkoy.jpeg', 'assets/ulugol.jpeg'],
    popularRestaurants: ['Derin Balık', 'Meşhur Pide', 'Vonalı Celal'],
    famousFoods: ['Mıhlama', 'Lahana Sarması', 'Pide'],
  ),
];