import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import '../../controller/forms/quill_editor_controller.dart';
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

class QuillEditorScreen extends StatefulWidget {
  const QuillEditorScreen({super.key});

  @override
  State<QuillEditorScreen> createState() => _QuillEditorScreenState();
}

class _QuillEditorScreenState extends State<QuillEditorScreen> with SingleTickerProviderStateMixin, UIMixin {
  late QuillHtmlEditorController controller;

  @override
  void initState() {
    controller = Get.put(QuillHtmlEditorController());
    super.initState();
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
                    MyText.titleMedium("Quill HTML Editor", fontWeight: 600),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Forms"),
                        MyBreadcrumbItem(name: "Quill HTML Editor", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(200),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                      sizes: "lg-8",
                      child: MyContainer(
                        child: Column(
                          children: [
                            QuillSimpleToolbar(
                              controller: controller.quillController,
                              config: QuillSimpleToolbarConfig(headerStyleType: HeaderStyleType.original),
                            ),
                            SingleChildScrollView(
                              child: SizedBox(
                                height: 300,
                                child: QuillEditor.basic(controller: controller.quillController),
                              ),
                            ),
                          ],
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
