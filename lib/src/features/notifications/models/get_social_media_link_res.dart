class GetSocialMediaRes {
  Links? links;

  GetSocialMediaRes({this.links});

  GetSocialMediaRes.fromJson(Map<String, dynamic> json) {
    links = json['data'] != null ? Links.fromJson(json['data']) : null;
  }
}

class Links {
  String? youtube;
  String? instagram;
  String? twitter;
  String? whatsapp;
  String? linkedin;
  String? facebook;

  Links({this.youtube, this.instagram, this.twitter, this.whatsapp, this.linkedin, this.facebook});

  Links.fromJson(Map<String, dynamic> json) {
    youtube = json['youtube'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    whatsapp = json['whatsapp'];
    linkedin = json['linkedin'];
    facebook = json['facebook'];
  }
}
