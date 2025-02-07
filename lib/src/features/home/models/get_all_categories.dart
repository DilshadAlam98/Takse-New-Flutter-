class GetAllCategories {
  List<Rows>? rows;
  String? total;

  GetAllCategories({this.rows, this.total});

  GetAllCategories.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(Rows.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rows != null) {
      data['rows'] = rows!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}

class Rows {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? slug;
  String? picture;
  bool? status;

  Rows({this.id, this.createdAt, this.updatedAt, this.title, this.slug, this.picture, this.status});

  Rows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    slug = json['slug'];
    picture = json['picture'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['title'] = title;
    data['slug'] = slug;
    data['picture'] = picture;
    data['status'] = status;
    return data;
  }
}
