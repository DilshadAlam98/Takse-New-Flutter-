class GetBannersRes {
  String? id;
  String? title;
  String? description;
  String? picture;
  String? url;
  String? bannerType;
  List<String>? bannerLocations;

  GetBannersRes({
    this.id,
    this.title,
    this.description,
    this.picture,
    this.url,
    this.bannerType,
    this.bannerLocations,
  });

  GetBannersRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    picture = json['picture'];
    url = json['url'];
    bannerType = json['banner_type'];
    bannerLocations = json['banner_locations'].cast<String>();
  }
}
