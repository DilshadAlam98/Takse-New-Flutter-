import 'package:flutter/material.dart';
import 'package:takse/core/components/common_appbar.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/theme/app_text_style.dart';

class DocUploadWidget extends StatelessWidget {
  const DocUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "title"),
      body: Column(
        children: [
          Row(
            children: [
              Image.asset(AssetConst.untitledDoc, height: 60),
              Text("Upload You Aadhar card ", style: AppTextStyle.headline.large.regular)
            ],
          ),
          Image.asset(AssetConst.companyDocs),
        ],
      ),
    );
  }
}
