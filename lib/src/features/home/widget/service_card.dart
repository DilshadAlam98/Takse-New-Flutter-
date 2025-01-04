import 'package:flutter/material.dart';
import 'package:takse/core/components/common_network_image.dart';
import 'package:takse/core/components/primary_button.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .7,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 3, // Blur radius
            offset: const Offset(1, 3), // Shadow position (x, y)
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 160,
            child: CommonNetworkImage(
              image:
                  "https://cdn.dnaindia.com/sites/default/files/2021/08/11/990042-pan-aadhaar.jpg?im=FitAndFill=(1200,900)",
            ),
          ),
          Text(
            "SSC Apply form till date aftereffect",
            textAlign: TextAlign.center,
            style: AppTextStyle.headline.medium.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "120+Application done",
                  style: AppTextStyle.headline.small.regular,
                ),
              ),
              const SizedBox(width: 10),
              RichText(
                text: TextSpan(
                  style: AppTextStyle.title.large.green,
                  text: "Rs. 26",
                  children: [
                    TextSpan(
                      text: " /100",
                      style: AppTextStyle.title.large.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          PrimaryButton(
            text: "Order Now",
            textStyle: AppTextStyle.headline.large.black,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
