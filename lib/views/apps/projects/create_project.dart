import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../../app_constant.dart';
import '../../../controller/apps/project/create_project_controller.dart';
import '../../../helper/extensions/string.dart';
import '../../../helper/theme/app_style.dart';
import '../../../helper/theme/app_theme.dart';
import '../../../helper/utils/my_shadow.dart';
import '../../../helper/utils/ui_mixins.dart';
import '../../../helper/utils/utils.dart';
import '../../../helper/widgets/my_breadcrumb.dart';
import '../../../helper/widgets/my_breadcrumb_item.dart';
import '../../../helper/widgets/my_button.dart';
import '../../../helper/widgets/my_card.dart';
import '../../../helper/widgets/my_container.dart';
import '../../../helper/widgets/my_dotted_line.dart';
import '../../../helper/widgets/my_flex.dart';
import '../../../helper/widgets/my_flex_item.dart';
import '../../../helper/widgets/my_list_extension.dart';
import '../../../helper/widgets/my_spacing.dart';
import '../../../helper/widgets/my_text.dart';
import '../../../helper/widgets/my_text_style.dart';
import '../../../helper/widgets/responsive.dart';
import '../../../views/layout/layout.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({super.key});

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> with SingleTickerProviderStateMixin, UIMixin {
  late CreateProjectController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(CreateProjectController());
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
                    MyText.titleMedium("Create Project", fontSize: 18, fontWeight: 600),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Projects'),
                        MyBreadcrumbItem(name: 'Create Project', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyFlex(
                  contentPadding: false,
                  children: [
                    MyFlexItem(
                      sizes: "lg-6",
                      child: MyCard(
                        paddingAll: 0,
                        shadow: MyShadow(elevation: 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: contentTheme.primary.withValues(alpha: 0.08),
                              padding: MySpacing.xy(16, 12),
                              child: Row(
                                children: [
                                  Icon(LucideIcons.plus, color: contentTheme.primary, size: 16),
                                  MySpacing.width(12),
                                  MyText.titleMedium(
                                    "create_project".tr(),
                                    fontWeight: 600,
                                    color: contentTheme.primary,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: MySpacing.xy(20, 16),
                              child: Column(
                                children: [
                                  buildTextField("Project Name", "Enter Project Name"),
                                  MySpacing.height(16),
                                  MyText.bodyMedium("Project OverView", fontWeight: 600, muted: true),
                                  MySpacing.height(8),
                                  TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                      hintText: "Enter Some Brief About Project",
                                      hintStyle: MyTextStyle.bodySmall(xMuted: true),
                                      border: outlineInputBorder,
                                      contentPadding: MySpacing.all(16),
                                      isCollapsed: true,
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                    ),
                                  ),
                                  MySpacing.height(16),
                                  Wrap(
                                    spacing: 16,
                                    children:
                                        ProjectPrivacy.values
                                            .map(
                                              (value) => InkWell(
                                                onTap: () => controller.onChangeProjectPrivacy(value),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Radio<ProjectPrivacy>(
                                                      value: value,
                                                      activeColor: contentTheme.primary,
                                                      groupValue: controller.selectProjectPrivacy,
                                                      onChanged: controller.onChangeProjectPrivacy,
                                                      visualDensity: getCompactDensity,
                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                    ),
                                                    MySpacing.width(8),
                                                    MyText.labelMedium(value.name),
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList(),
                                  ),
                                  MySpacing.height(16),
                                  MyFlex(
                                    contentPadding: false,
                                    children: [
                                      MyFlexItem(
                                        sizes: "lg-6",
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            MyText.bodyMedium("Start Date", fontWeight: 600, muted: true),
                                            MySpacing.height(8),
                                            MyContainer.bordered(
                                              paddingAll: 12,
                                              onTap: () {
                                                controller.pickStartDate();
                                              },
                                              borderColor: theme.colorScheme.secondary,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(
                                                    LucideIcons.calendar,
                                                    color: theme.colorScheme.secondary,
                                                    size: 16,
                                                  ),
                                                  MySpacing.width(10),
                                                  MyText.bodyMedium(
                                                    controller.selectedStartDate != null
                                                        ? dateFormatter.format(controller.selectedStartDate!)
                                                        : "1/10/2020",
                                                    fontWeight: 600,
                                                    color: theme.colorScheme.secondary,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      MyFlexItem(
                                        sizes: "lg-6",
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            MyText.bodyMedium("End Date", fontWeight: 600, muted: true),
                                            MySpacing.height(8),
                                            MyContainer.bordered(
                                              paddingAll: 12,
                                              onTap: () {
                                                controller.pickEndDate();
                                              },
                                              borderColor: theme.colorScheme.secondary,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(
                                                    LucideIcons.calendar,
                                                    color: theme.colorScheme.secondary,
                                                    size: 16,
                                                  ),
                                                  MySpacing.width(10),
                                                  MyText.bodyMedium(
                                                    controller.selectedEndDate != null
                                                        ? dateFormatter.format(controller.selectedEndDate!)
                                                        : "1/10/2020",
                                                    fontWeight: 600,
                                                    color: theme.colorScheme.secondary,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  MySpacing.height(16),
                                  MyText.bodyMedium("Project Priority", fontWeight: 600, muted: true),
                                  MySpacing.height(8),
                                  PopupMenuButton(
                                    itemBuilder: (BuildContext context) {
                                      return ["Medium", "High", "Low"].map((behavior) {
                                        return PopupMenuItem(
                                          value: behavior,
                                          height: 32,
                                          child: MyText.bodySmall(
                                            behavior.toString(),
                                            color: theme.colorScheme.onSurface,
                                            fontWeight: 600,
                                          ),
                                        );
                                      }).toList();
                                    },
                                    offset: const Offset(0, 40),
                                    onSelected: controller.onSelectedSize,
                                    color: theme.cardTheme.color,
                                    child: MyContainer.bordered(
                                      paddingAll: 8,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          MyText.labelMedium(
                                            controller.selectProperties.toString(),
                                            color: theme.colorScheme.onSurface,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(left: 4),
                                            child: Icon(
                                              LucideIcons.chevron_down,
                                              size: 22,
                                              color: theme.colorScheme.onSurface,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  MySpacing.height(16),
                                  buildTextField("Budget", "Enter Project Budget"),
                                  MySpacing.height(20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      MyButton(
                                        onPressed: () {},
                                        elevation: 0,
                                        padding: MySpacing.xy(20, 16),
                                        backgroundColor: contentTheme.primary,
                                        borderRadiusAll: AppStyle.buttonRadius.medium,
                                        child: Row(
                                          children: [
                                            Icon(LucideIcons.circle_check, size: 16, color: contentTheme.light),
                                            MySpacing.width(8),
                                            MyText.bodySmall('Create', color: contentTheme.onPrimary),
                                          ],
                                        ),
                                      ),
                                      MySpacing.width(16),
                                      MyButton(
                                        onPressed: () {},
                                        elevation: 0,
                                        padding: MySpacing.xy(20, 16),
                                        backgroundColor: contentTheme.secondary,
                                        borderRadiusAll: AppStyle.buttonRadius.medium,
                                        child: Row(
                                          children: [
                                            Icon(LucideIcons.x, size: 16, color: contentTheme.light),
                                            MySpacing.width(8),
                                            MyText.bodySmall('Cancel', color: contentTheme.onSecondary),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: 'lg-6',
                      child: MyContainer(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: controller.pickFile,
                              child: MyDottedLine(
                                strokeWidth: 0.2,
                                color: contentTheme.onBackground,
                                corner: const MyDottedLineCorner(
                                  leftBottomCorner: 2,
                                  leftTopCorner: 2,
                                  rightBottomCorner: 2,
                                  rightTopCorner: 2,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: MySpacing.xy(12, 44),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(LucideIcons.cloud_upload),
                                        MyContainer(
                                          width: 340,
                                          alignment: Alignment.center,
                                          paddingAll: 0,
                                          child: MyText.titleMedium(
                                            "Drop files here or click to upload.",
                                            fontWeight: 600,
                                            muted: true,
                                            fontSize: 18,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            MySpacing.height(16),
                            if (controller.files.isNotEmpty) ...[
                              MySpacing.height(16),
                              Wrap(
                                runSpacing: 16,
                                spacing: 16,
                                children:
                                    controller.files
                                        .mapIndexed(
                                          (index, file) => MyContainer(
                                            color: contentTheme.primary.withAlpha(28),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(LucideIcons.file, size: 20, color: contentTheme.primary),
                                                MySpacing.width(8),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    MyText.bodyMedium(
                                                      file.name,
                                                      color: contentTheme.primary,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      fontWeight: 600,
                                                    ),
                                                    MyText.bodySmall(
                                                      Utils.getStorageStringFromByte(file.bytes?.length ?? 0),
                                                      color: contentTheme.primary,
                                                    ),
                                                  ],
                                                ),
                                                MySpacing.width(20),
                                                IconButton(
                                                  onPressed: () => controller.removeFile(file),
                                                  icon: Icon(LucideIcons.x, color: contentTheme.primary),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                              ),
                            ],
                            MySpacing.height(16),
                            MyText.bodyMedium("Project Priority", fontWeight: 600, muted: true),
                            MySpacing.height(8),
                            PopupMenuButton(
                              itemBuilder: (BuildContext context) {
                                return ["Mike", "lorene", "Beatrice", "Geneva", "Helmed"].map((behavior) {
                                  return PopupMenuItem(
                                    value: behavior,
                                    height: 32,
                                    child: MyText.bodySmall(
                                      behavior.toString(),
                                      color: theme.colorScheme.onSurface,
                                      fontWeight: 600,
                                    ),
                                  );
                                }).toList();
                              },
                              offset: const Offset(0, 40),
                              onSelected: controller.onSelectedSize,
                              color: theme.cardTheme.color,
                              child: MyContainer.bordered(
                                paddingAll: 8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    MyText.labelMedium(
                                      controller.selectProperties.toString(),
                                      color: theme.colorScheme.onSurface,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 4),
                                      child: Icon(
                                        LucideIcons.chevron_down,
                                        size: 22,
                                        color: theme.colorScheme.onSurface,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            MySpacing.height(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MyButton(
                                  onPressed: () {},
                                  elevation: 0,
                                  padding: MySpacing.xy(20, 16),
                                  backgroundColor: contentTheme.primary,
                                  borderRadiusAll: AppStyle.buttonRadius.medium,
                                  child: Row(
                                    children: [
                                      Icon(LucideIcons.circle_check, size: 16, color: contentTheme.light),
                                      MySpacing.width(8),
                                      MyText.bodySmall('Create', color: contentTheme.onPrimary),
                                    ],
                                  ),
                                ),
                                MySpacing.width(16),
                                MyButton(
                                  onPressed: () {},
                                  elevation: 0,
                                  padding: MySpacing.xy(20, 16),
                                  backgroundColor: contentTheme.secondary,
                                  borderRadiusAll: AppStyle.buttonRadius.medium,
                                  child: Row(
                                    children: [
                                      Icon(LucideIcons.x, size: 16, color: contentTheme.light),
                                      MySpacing.width(8),
                                      MyText.bodySmall('Cancel', color: contentTheme.onSecondary),
                                    ],
                                  ),
                                ),
                              ],
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

  buildTextField(String fieldTitle, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium(fieldTitle),
        MySpacing.height(8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyTextStyle.bodySmall(xMuted: true),
            border: outlineInputBorder,
            contentPadding: MySpacing.all(16),
            isCollapsed: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ],
    );
  }
}
