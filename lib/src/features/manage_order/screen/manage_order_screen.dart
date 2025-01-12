import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takse/src/features/manage_order/controller/manage_order_manage.dart';
import 'package:takse/src/features/manage_order/widgets/manage_order_card.dart';

import '../../../../core/components/common_appbar.dart';

class ManageOrderScreen extends GetView<ManageOrderController> {
  const ManageOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Manage Order"),
      body: ListView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: 100,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: ManageOrderCard(),
          );
        },
      ),
    );
  }
}
