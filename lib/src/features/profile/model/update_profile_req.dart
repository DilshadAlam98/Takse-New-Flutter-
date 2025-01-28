import 'dart:io';

import 'package:dio/src/multipart_file.dart' as multi;

class UpdateProfileRequestData {
  String name;
  String email;
  File? picture;

  UpdateProfileRequestData({
    required this.name,
    required this.email,
    this.picture,
  });

  Future<Map<String, dynamic>> toJson() async {
    Map<String, dynamic> data = {};
    data["name"] = name;
    data["email"] = email;
    if (picture != null) {
      data["picture"] = await multi.MultipartFile.fromFile(picture!.path, filename: picture!.path.split('/').last);
    }

    return data;
  }
}
