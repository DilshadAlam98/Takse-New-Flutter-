class GetAllTypeServiceRes {
  ServiceData? data;

  GetAllTypeServiceRes({this.data});

  GetAllTypeServiceRes.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ServiceData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ServiceData {
  ServicesNode? services;

  ServiceData({this.services});

  ServiceData.fromJson(Map<String, dynamic> json) {
    services = json['services'] != null ? ServicesNode.fromJson(json['services']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (services != null) {
      data['services'] = services!.toJson();
    }
    return data;
  }
}

class ServicesNode {
  List<Service>? nodes;

  ServicesNode({this.nodes});

  ServicesNode.fromJson(Map<String, dynamic> json) {
    if (json['nodes'] != null) {
      nodes = <Service>[];
      json['nodes'].forEach((v) {
        nodes!.add(Service.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (nodes != null) {
      data['nodes'] = nodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Service {
  String? id;
  String? endDate;
  int? durationMinutes;
  int? durationHours;
  String? description;

  // Null? brochure;
  String? keywords;
  String? serviceChargesTap;
  String? serviceChargesTbp;
  String? serviceChargesTsp;

  // Null? serviceAudio;
  String? startDate;
  String? marketPrice;
  String? thumbnailImage;
  int? maxPointCanUse;
  String? title;

  // Null? serviceGallery;
  String? governmentCharges;
  ServiceForm? serviceForm;

  // Services? faqs;
  bool? status;
  List<String>? serviceFeatures;
  Category? category;

  Service(
      {this.id,
      this.endDate,
      this.durationMinutes,
      this.durationHours,
      this.description,
      // this.brochure,
      this.keywords,
      this.serviceChargesTap,
      this.serviceChargesTbp,
      this.serviceChargesTsp,
      // this.serviceAudio,
      this.startDate,
      this.marketPrice,
      this.thumbnailImage,
      this.maxPointCanUse,
      this.title,
      // this.serviceGallery,
      this.governmentCharges,
      this.serviceForm,
      // this.faqs,
      this.status,
      this.serviceFeatures,
      this.category});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    endDate = json['end_date'];
    durationMinutes = json['duration_minutes'];
    durationHours = json['duration_hours'];
    description = json['description'];
    // brochure = json['brochure'];
    keywords = json['keywords'];
    serviceChargesTap = json['service_charges_tap'];
    serviceChargesTbp = json['service_charges_tbp'];
    serviceChargesTsp = json['service_charges_tsp'];
    // serviceAudio = json['service_audio'];
    startDate = json['start_date'];
    marketPrice = json['market_price'];
    thumbnailImage = json['thumbnail_image'];
    maxPointCanUse = json['max_point_can_use'];
    title = json['title'];
    // serviceGallery = json['service_gallery'];
    governmentCharges = json['government_charges'];
    serviceForm = json['service_form'] != null ? ServiceForm.fromJson(json['service_form']) : null;
    // faqs = json['faqs'] != null ? Services.fromJson(json['faqs']) : null;
    status = json['status'];
    serviceFeatures = json['service_features'].cast<String>();
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['end_date'] = endDate;
    data['duration_minutes'] = durationMinutes;
    data['duration_hours'] = durationHours;
    data['description'] = description;
    // data['brochure'] = brochure;
    data['keywords'] = keywords;
    data['service_charges_tap'] = serviceChargesTap;
    data['service_charges_tbp'] = serviceChargesTbp;
    data['service_charges_tsp'] = serviceChargesTsp;
    // data['service_audio'] = serviceAudio;
    data['start_date'] = startDate;
    data['market_price'] = marketPrice;
    data['thumbnail_image'] = thumbnailImage;
    data['max_point_can_use'] = maxPointCanUse;
    data['title'] = title;
    // data['service_gallery'] = serviceGallery;
    data['government_charges'] = governmentCharges;
    if (serviceForm != null) {
      data['service_form'] = serviceForm!.toJson();
    }
    // if (faqs != null) {
    //   data['faqs'] = faqs!.toJson();
    // }
    data['status'] = status;
    data['service_features'] = serviceFeatures;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class ServiceForm {
  String? formId;
  String? formItems;

  ServiceForm({this.formId, this.formItems});

  ServiceForm.fromJson(Map<String, dynamic> json) {
    formId = json['form_id'];
    formItems = json['form_items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['form_id'] = formId;
    data['form_items'] = formItems;
    return data;
  }
}

class FaqNodes {
  String? id;
  String? title;
  String? serviceId;
  String? category;
  String? answer;

  FaqNodes({this.id, this.title, this.serviceId, this.category, this.answer});

  FaqNodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    serviceId = json['service_id'];
    category = json['category'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['service_id'] = serviceId;
    data['category'] = category;
    data['answer'] = answer;
    return data;
  }
}

class Category {
  String? title;

  Category({this.title});

  Category.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    return data;
  }
}
