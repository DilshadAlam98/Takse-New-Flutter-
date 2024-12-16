import 'package:flutter/material.dart';
import 'package:screwdriver/screwdriver.dart';
import 'package:takse/core/components/primary_button.dart';
import 'package:takse/core/theme/app_colors.dart';
import 'package:takse/core/theme/app_text_style.dart';

import '../../../core/components/app_textfield.dart';

class TopUpDialog extends StatefulWidget {
  const TopUpDialog({super.key, required this.onProceed});

  final Function(String amt) onProceed;

  @override
  State<TopUpDialog> createState() => _TopUpDialogState();
}

class _TopUpDialogState extends State<TopUpDialog> {
  final TextEditingController amtController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Topup Wallet", style: AppTextStyle.title.large),
            const SizedBox(height: 15),
            Form(
              key: _formKey,
              child: AppTextField(
                controller: amtController,
                validator: (val) {
                  if (val.isNullOrEmpty) {
                    return "Please enter or select amount";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 25),
            Text("Recommended", style: AppTextStyle.title.medium.regular),
            const SizedBox(height: 10),
            Center(
              child: Wrap(
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                runSpacing: 20,
                children: ["500", "1000", "2000", "5000"]
                    .map((e) => GestureDetector(
                          onTap: () {
                            amtController.text = e;
                            setState(() {});
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 55,
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                              decoration: BoxDecoration(
                                color: amtController.text == e ? AppColors.deepYellow : null,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColors.black, width: 1.5),
                              ),
                              child: Text(e, style: AppTextStyle.title.medium.bold)),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: PrimaryButton(
                text: "PROCEED TO TOP UP",
                borderRadius: 40,
                width: 250,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onProceed.call(amtController.text.trim());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
