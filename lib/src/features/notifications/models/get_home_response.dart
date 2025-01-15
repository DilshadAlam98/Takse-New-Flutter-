class GetHomeRes {
  List<Testimonials>? testimonials;
  List<Faq>? faq;
  List<Null>? audioAds;
  String? inviteMessage;
  String? assetBaseUrl;
  Settings? settings;

  GetHomeRes({this.testimonials, this.faq, this.audioAds, this.inviteMessage, this.assetBaseUrl, this.settings});

  GetHomeRes.fromJson(Map<String, dynamic> json) {
    if (json['testimonials'] != null) {
      testimonials = <Testimonials>[];
      json['testimonials'].forEach((v) {
        testimonials!.add(Testimonials.fromJson(v));
      });
    }
    if (json['faq'] != null) {
      faq = <Faq>[];
      json['faq'].forEach((v) {
        faq!.add(Faq.fromJson(v));
      });
    }
    // if (json['audioAds'] != null) {
    //   audioAds = <Null>[];
    //   json['audioAds'].forEach((v) {
    //     audioAds!.add(new Null.fromJson(v));
    //   });
    // }
    inviteMessage = json['inviteMessage'];
    assetBaseUrl = json['asset_base_url'];
    settings = json['settings'] != null ? new Settings.fromJson(json['settings']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.testimonials != null) {
      data['testimonials'] = this.testimonials!.map((v) => v.toJson()).toList();
    }
    if (this.faq != null) {
      data['faq'] = this.faq!.map((v) => v.toJson()).toList();
    }
    // if (this.audioAds != null) {
    //   data['audioAds'] = this.audioAds!.map((v) => v.toJson()).toList();
    // }
    data['inviteMessage'] = this.inviteMessage;
    data['asset_base_url'] = this.assetBaseUrl;
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    return data;
  }
}

class Testimonials {
  String? id;
  String? picture;
  Null? description;
  Null? videoPath;

  Testimonials({this.id, this.picture, this.description, this.videoPath});

  Testimonials.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    picture = json['picture'];
    description = json['description'];
    videoPath = json['video_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['picture'] = this.picture;
    data['description'] = this.description;
    data['video_path'] = this.videoPath;
    return data;
  }
}

class Faq {
  String? id;
  String? title;
  String? answer;

  Faq({this.id, this.title, this.answer});

  Faq.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['answer'] = this.answer;
    return data;
  }
}

class Settings {
  String? walletAddCommissionPercent500;
  String? walletAddCommissionPercent1000;
  String? walletAddCommissionPercent2000;
  String? walletAddCommissionPercent5000;
  String? tspTheme;
  String? tapTheme;
  String? themeColor;
  String? googleReviewAmount;
  String? googleReviewLink;
  String? playstoreReviewAmount;
  String? playstoreReviewLink;
  String? youtubeAmount;
  String? youtubeLink;
  String? instagramAmount;
  String? instagramLink;
  String? facebookAmount;
  String? facebookLink;
  String? whatsappAmount;
  String? whatsappLink;
  String? telegramAmount;
  String? telegramLink;
  String? reel15secAmount;
  String? reel15secLink;
  String? reel30secAmount;
  String? reel30secLink;
  String? custome1Amount;
  String? custome1Link;
  String? custome2Amount;
  String? custome2Link;
  String? custome3Amount;
  String? custome3Link;
  String? custome4Amount;
  String? custome4Link;
  String? custome5Amount;
  String? custome5Link;
  String? tbpTheme;

  Settings(
      {this.walletAddCommissionPercent500,
      this.walletAddCommissionPercent1000,
      this.walletAddCommissionPercent2000,
      this.walletAddCommissionPercent5000,
      this.tspTheme,
      this.tapTheme,
      this.themeColor,
      this.googleReviewAmount,
      this.googleReviewLink,
      this.playstoreReviewAmount,
      this.playstoreReviewLink,
      this.youtubeAmount,
      this.youtubeLink,
      this.instagramAmount,
      this.instagramLink,
      this.facebookAmount,
      this.facebookLink,
      this.whatsappAmount,
      this.whatsappLink,
      this.telegramAmount,
      this.telegramLink,
      this.reel15secAmount,
      this.reel15secLink,
      this.reel30secAmount,
      this.reel30secLink,
      this.custome1Amount,
      this.custome1Link,
      this.custome2Amount,
      this.custome2Link,
      this.custome3Amount,
      this.custome3Link,
      this.custome4Amount,
      this.custome4Link,
      this.custome5Amount,
      this.custome5Link,
      this.tbpTheme});

  Settings.fromJson(Map<String, dynamic> json) {
    walletAddCommissionPercent500 = json['wallet_add_commission_percent_500'];
    walletAddCommissionPercent1000 = json['wallet_add_commission_percent_1000'];
    walletAddCommissionPercent2000 = json['wallet_add_commission_percent_2000'];
    walletAddCommissionPercent5000 = json['wallet_add_commission_percent_5000'];
    tspTheme = json['tsp_theme'];
    tapTheme = json['tap_theme'];
    themeColor = json['theme_color'];
    googleReviewAmount = json['google_review_amount'];
    googleReviewLink = json['google_review_link'];
    playstoreReviewAmount = json['playstore_review_amount'];
    playstoreReviewLink = json['playstore_review_link'];
    youtubeAmount = json['youtube_amount'];
    youtubeLink = json['youtube_link'];
    instagramAmount = json['instagram_amount'];
    instagramLink = json['instagram_link'];
    facebookAmount = json['facebook_amount'];
    facebookLink = json['facebook_link'];
    whatsappAmount = json['whatsapp_amount'];
    whatsappLink = json['whatsapp_link'];
    telegramAmount = json['telegram_amount'];
    telegramLink = json['telegram_link'];
    reel15secAmount = json['reel_15sec_amount'];
    reel15secLink = json['reel_15sec_link'];
    reel30secAmount = json['reel_30sec_amount'];
    reel30secLink = json['reel_30sec_link'];
    custome1Amount = json['custome1_amount'];
    custome1Link = json['custome1_link'];
    custome2Amount = json['custome2_amount'];
    custome2Link = json['custome2_link'];
    custome3Amount = json['custome3_amount'];
    custome3Link = json['custome3_link'];
    custome4Amount = json['custome4_amount'];
    custome4Link = json['custome4_link'];
    custome5Amount = json['custome5_amount'];
    custome5Link = json['custome5_link'];
    tbpTheme = json['tbp_theme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wallet_add_commission_percent_500'] = this.walletAddCommissionPercent500;
    data['wallet_add_commission_percent_1000'] = this.walletAddCommissionPercent1000;
    data['wallet_add_commission_percent_2000'] = this.walletAddCommissionPercent2000;
    data['wallet_add_commission_percent_5000'] = this.walletAddCommissionPercent5000;
    data['tsp_theme'] = this.tspTheme;
    data['tap_theme'] = this.tapTheme;
    data['theme_color'] = this.themeColor;
    data['google_review_amount'] = this.googleReviewAmount;
    data['google_review_link'] = this.googleReviewLink;
    data['playstore_review_amount'] = this.playstoreReviewAmount;
    data['playstore_review_link'] = this.playstoreReviewLink;
    data['youtube_amount'] = this.youtubeAmount;
    data['youtube_link'] = this.youtubeLink;
    data['instagram_amount'] = this.instagramAmount;
    data['instagram_link'] = this.instagramLink;
    data['facebook_amount'] = this.facebookAmount;
    data['facebook_link'] = this.facebookLink;
    data['whatsapp_amount'] = this.whatsappAmount;
    data['whatsapp_link'] = this.whatsappLink;
    data['telegram_amount'] = this.telegramAmount;
    data['telegram_link'] = this.telegramLink;
    data['reel_15sec_amount'] = this.reel15secAmount;
    data['reel_15sec_link'] = this.reel15secLink;
    data['reel_30sec_amount'] = this.reel30secAmount;
    data['reel_30sec_link'] = this.reel30secLink;
    data['custome1_amount'] = this.custome1Amount;
    data['custome1_link'] = this.custome1Link;
    data['custome2_amount'] = this.custome2Amount;
    data['custome2_link'] = this.custome2Link;
    data['custome3_amount'] = this.custome3Amount;
    data['custome3_link'] = this.custome3Link;
    data['custome4_amount'] = this.custome4Amount;
    data['custome4_link'] = this.custome4Link;
    data['custome5_amount'] = this.custome5Amount;
    data['custome5_link'] = this.custome5Link;
    data['tbp_theme'] = this.tbpTheme;
    return data;
  }
}
