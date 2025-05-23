import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../../controller/apps/project/project_list_controller.dart';
import '../../../helper/theme/app_style.dart';
import '../../../helper/theme/app_theme.dart';
import '../../../helper/utils/my_shadow.dart';
import '../../../helper/utils/ui_mixins.dart';
import '../../../helper/widgets/my_breadcrumb.dart';
import '../../../helper/widgets/my_breadcrumb_item.dart';
import '../../../helper/widgets/my_button.dart';
import '../../../helper/widgets/my_card.dart';
import '../../../helper/widgets/my_container.dart';
import '../../../helper/widgets/my_progress_bar.dart';
import '../../../helper/widgets/my_spacing.dart';
import '../../../helper/widgets/my_text.dart';
import '../../../helper/widgets/responsive.dart';
import '../../../views/layout/layout.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> with SingleTickerProviderStateMixin, UIMixin {
  late ProjectListController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ProjectListController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium("Project List", fontSize: 18, fontWeight: 600),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Projects'),
                        MyBreadcrumbItem(name: 'Project List', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyButton(
                      onPressed: controller.goToCreateProject,
                      elevation: 0,
                      padding: MySpacing.xy(12, 18),
                      backgroundColor: contentTheme.primary,
                      borderRadiusAll: AppStyle.buttonRadius.medium,
                      child: MyText.bodySmall("Create Project", color: contentTheme.onPrimary),
                    ),
                    MySpacing.height(20),
                    GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controller.projectList.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        mainAxisExtent: 280,
                      ),
                      itemBuilder: (context, index) {
                        return MyCard(
                          shadow: MyShadow(elevation: 0.5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText.bodyMedium(
                                    controller.projectList[index].appName,
                                    fontSize: 16,
                                    fontWeight: 600,
                                  ),
                                  MyContainer.none(
                                    paddingAll: 8,
                                    borderRadiusAll: 5,
                                    child: PopupMenuButton(
                                      offset: const Offset(0, 10),
                                      position: PopupMenuPosition.under,
                                      itemBuilder:
                                          (BuildContext context) => [
                                            PopupMenuItem(
                                              padding: MySpacing.xy(16, 8),
                                              height: 10,
                                              child: MyText.bodySmall("Edit"),
                                            ),
                                            PopupMenuItem(
                                              padding: MySpacing.xy(16, 8),
                                              height: 10,
                                              child: MyText.bodySmall("Delete"),
                                            ),
                                            PopupMenuItem(
                                              padding: MySpacing.xy(16, 8),
                                              height: 10,
                                              child: MyText.bodySmall("Add Member"),
                                            ),
                                            PopupMenuItem(
                                              padding: MySpacing.xy(16, 8),
                                              height: 10,
                                              child: MyText.bodySmall("Add Due Date"),
                                            ),
                                          ],
                                      child: Icon(LucideIcons.ellipsis, size: 18),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  MyContainer.rounded(
                                    color: contentTheme.primary.withAlpha(30),
                                    paddingAll: 2,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Icon(LucideIcons.user, size: 16, color: contentTheme.primary),
                                  ),
                                  MySpacing.width(12),
                                  MyText.bodyMedium("ORANGE LIMITED"),
                                ],
                              ),
                              MyText.bodyMedium(controller.dummyTexts[2], maxLines: 2, fontSize: 12),
                              Row(
                                children: [
                                  Icon(LucideIcons.clipboard_check, size: 16),
                                  MySpacing.width(8),
                                  MyText.bodySmall(
                                    "${controller.projectList[index].tasks} Task",
                                    textAlign: TextAlign.center,
                                  ),
                                  MySpacing.width(12),
                                  Icon(LucideIcons.messages_square, size: 16),
                                  MySpacing.width(8),
                                  MyText.bodySmall("${controller.projectList[index].comments} Comments"),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.bodyMedium("Task Complete"),
                                  MySpacing.height(12),
                                  MyProgressBar(
                                    width: 500,
                                    progress: controller.projectList[index].taskComplete,
                                    height: 3,
                                    radius: 4,
                                    inactiveColor: theme.dividerColor,
                                    activeColor: theme.colorScheme.primary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
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
