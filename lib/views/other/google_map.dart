import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../controller/other/google_map_controller.dart';
import '../../helper/extensions/string.dart';
import '../../helper/utils/ui_mixins.dart';
import '../../helper/widgets/my_breadcrumb.dart';
import '../../helper/widgets/my_breadcrumb_item.dart';
import '../../helper/widgets/my_container.dart';
import '../../helper/widgets/my_flex.dart';
import '../../helper/widgets/my_flex_item.dart';
import '../../helper/widgets/my_spacing.dart';
import '../../helper/widgets/my_text.dart';
import '../../helper/widgets/responsive.dart';
import '../../views/layout/layout.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> with SingleTickerProviderStateMixin, UIMixin {
  late GoogleMapPageController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(GoogleMapPageController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium("google_map".tr().capitalizeWords, fontSize: 18, fontWeight: 600),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Maps'.tr()),
                        MyBreadcrumbItem(name: 'Google Map'.tr(), active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                      sizes: "lg-7",
                      child: MyContainer(
                        child: GoogleMap(
                          onMapCreated: controller.onMapCreated,
                          initialCameraPosition: CameraPosition(target: controller.center, zoom: 11.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
