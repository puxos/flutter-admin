import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../controller/error_pages/maintenance_controller.dart';
import '../../helper/utils/ui_mixins.dart';
import '../../helper/widgets/my_text.dart';

class MaintenancePage extends StatefulWidget {
  const MaintenancePage({super.key});

  @override
  State<MaintenancePage> createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> with SingleTickerProviderStateMixin, UIMixin {
  late MaintenanceController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(MaintenanceController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: controller,
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(LucideIcons.circle_x, size: 80),
                MyText.bodyMedium("Oops !", fontSize: 60),
                MyText.bodyMedium(
                  "We're busy updating this web for you. \n Please Check back soon",
                  fontSize: 24,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
