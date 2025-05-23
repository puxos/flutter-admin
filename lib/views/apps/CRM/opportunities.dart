import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../controller/apps/CRM/opportunities_controller.dart';
import '../../../helper/theme/app_style.dart';
import '../../../helper/theme/app_theme.dart';
import '../../../helper/utils/my_shadow.dart';
import '../../../helper/utils/ui_mixins.dart';
import '../../../helper/widgets/my_breadcrumb.dart';
import '../../../helper/widgets/my_breadcrumb_item.dart';
import '../../../helper/widgets/my_button.dart';
import '../../../helper/widgets/my_card.dart';
import '../../../helper/widgets/my_container.dart';
import '../../../helper/widgets/my_flex.dart';
import '../../../helper/widgets/my_flex_item.dart';
import '../../../helper/widgets/my_spacing.dart';
import '../../../helper/widgets/my_text.dart';
import '../../../helper/widgets/my_text_style.dart';
import '../../../helper/widgets/responsive.dart';
import '../../../views/layout/layout.dart';

class OpportunitiesPage extends StatefulWidget {
  const OpportunitiesPage({super.key});

  @override
  State<OpportunitiesPage> createState() => _OpportunitiesPageState();
}

class _OpportunitiesPageState extends State<OpportunitiesPage> with SingleTickerProviderStateMixin, UIMixin {
  late OpportunitiesController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(OpportunitiesController());
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
                    MyText.titleMedium("Opportunities", fontWeight: 600),
                    MyBreadcrumb(
                      children: [MyBreadcrumbItem(name: "CRM"), MyBreadcrumbItem(name: "Opportunities", active: true)],
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
                      sizes: "lg-8",
                      child: Column(
                        children: [
                          MyCard(
                            shadow: MyShadow(elevation: 0.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    MyText.bodyMedium("Sort By"),
                                    MySpacing.width(16),
                                    PopupMenuButton(
                                      itemBuilder: (BuildContext context) {
                                        return ["All", "Hot", "Cold", "InProgress", "Lost", "Won"].map((behavior) {
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
                                      child: Row(
                                        children: <Widget>[
                                          MyText.labelMedium(
                                            controller.selectSize.toString(),
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
                                  ],
                                ),
                                MyButton(
                                  onPressed:
                                      () => showDialog(
                                        context: context,
                                        builder:
                                            (context) => AlertDialog(
                                              clipBehavior: Clip.antiAliasWithSaveLayer,
                                              title: MyText.titleMedium("Add item"),
                                              titlePadding: MySpacing.xy(16, 12),
                                              insetPadding: MySpacing.y(300),
                                              actionsPadding: MySpacing.xy(190, 16),
                                              contentPadding: MySpacing.x(16),
                                              content: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  MyText.bodyMedium("Name"),
                                                  MySpacing.height(8),
                                                  TextFormField(
                                                    keyboardType: TextInputType.emailAddress,
                                                    decoration: InputDecoration(
                                                      labelText: "Enter Name",
                                                      labelStyle: MyTextStyle.bodySmall(xMuted: true),
                                                      border: outlineInputBorder,
                                                      contentPadding: MySpacing.all(16),
                                                      isCollapsed: true,
                                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                                    ),
                                                  ),
                                                  MySpacing.height(16),
                                                  MyText.bodyMedium("Email"),
                                                  MySpacing.height(8),
                                                  TextFormField(
                                                    keyboardType: TextInputType.emailAddress,
                                                    decoration: InputDecoration(
                                                      labelText: "Enter Email",
                                                      labelStyle: MyTextStyle.bodySmall(xMuted: true),
                                                      border: outlineInputBorder,
                                                      contentPadding: MySpacing.all(16),
                                                      isCollapsed: true,
                                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                                    ),
                                                  ),
                                                  MySpacing.height(16),
                                                  MyText.bodyMedium("Phone"),
                                                  MySpacing.height(8),
                                                  TextFormField(
                                                    keyboardType: TextInputType.emailAddress,
                                                    decoration: InputDecoration(
                                                      labelText: "Enter Phone Number",
                                                      labelStyle: MyTextStyle.bodySmall(xMuted: true),
                                                      border: outlineInputBorder,
                                                      contentPadding: MySpacing.all(16),
                                                      isCollapsed: true,
                                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              actions: [
                                                MyButton(
                                                  onPressed: () {},
                                                  elevation: 0,
                                                  backgroundColor: contentTheme.primary,
                                                  borderRadiusAll: AppStyle.buttonRadius.medium,
                                                  child: MyText.bodyMedium("Ok", color: contentTheme.onPrimary),
                                                ),
                                                MyButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  elevation: 0,
                                                  backgroundColor: contentTheme.primary,
                                                  borderRadiusAll: AppStyle.buttonRadius.medium,
                                                  child: MyText.bodyMedium("Cancel", color: contentTheme.onPrimary),
                                                ),
                                              ],
                                            ),
                                      ),
                                  elevation: 0,
                                  padding: MySpacing.xy(12, 18),
                                  backgroundColor: contentTheme.primary,
                                  borderRadiusAll: AppStyle.buttonRadius.medium,
                                  child: MyText.bodySmall("Add Contact", color: contentTheme.onPrimary),
                                ),
                              ],
                            ),
                          ),
                          MySpacing.height(flexSpacing),
                          SizedBox(
                            height: 660,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: controller.opportunities.length,
                              itemBuilder: (context, index) {
                                return MyCard(
                                  shadow: MyShadow(elevation: 0.5),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MyContainer.rounded(
                                        height: 50,
                                        width: 50,
                                        paddingAll: 0,
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        child: Image.asset(
                                          width: 50,
                                          height: 50,
                                          controller.opportunities[index].image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      MySpacing.width(16),
                                      Expanded(
                                        child: MyFlex(
                                          children: [
                                            MyFlexItem(
                                              sizes: "xxl-3 md-2 md-6 am-12",
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  MyText.bodyMedium(controller.opportunities[index].name),
                                                  MySpacing.height(12),
                                                  MyText.bodyMedium(
                                                    "Location: ${controller.opportunities[index].location}",
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  MySpacing.height(12),
                                                  MyText.bodyMedium(
                                                    "Category: ${controller.opportunities[index].category}",
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            MyFlexItem(
                                              sizes: "xxl-3 xl-3 md-6 sm-12",
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Icon(LucideIcons.mail, size: 16),
                                                      MySpacing.width(12),
                                                      Expanded(
                                                        child: MyText.bodyMedium(
                                                          controller.opportunities[index].email,
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  MySpacing.height(12),
                                                  Row(
                                                    children: [
                                                      const Icon(LucideIcons.phone, size: 16),
                                                      MySpacing.width(12),
                                                      Expanded(
                                                        child: MyText.bodyMedium(
                                                          controller.opportunities[index].phoneNumber,
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            MyFlexItem(
                                              sizes: "xxl-3 xl-4 md-6 sm-12",
                                              child: Wrap(
                                                spacing: 12,
                                                children: [
                                                  MyButton(
                                                    onPressed: () {},
                                                    elevation: 0,
                                                    padding: MySpacing.xy(12, 12),
                                                    borderColor: contentTheme.primary,
                                                    backgroundColor: contentTheme.primary.withValues(alpha: 0.12),
                                                    splashColor: contentTheme.primary.withValues(alpha: 0.2),
                                                    borderRadiusAll: AppStyle.buttonRadius.medium,
                                                    child: MyText.bodySmall('Assign', color: contentTheme.primary),
                                                  ),
                                                  MyButton(
                                                    onPressed: () {},
                                                    elevation: 0,
                                                    padding: MySpacing.xy(12, 12),
                                                    backgroundColor: contentTheme.primary,
                                                    borderRadiusAll: AppStyle.buttonRadius.medium,
                                                    child: MyText.bodySmall('Call', color: contentTheme.onPrimary),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            MyFlexItem(
                                              sizes: "xxl-3 xl-3 md-6 sm-12",
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(LucideIcons.mail, size: 16),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(LucideIcons.pencil, size: 16),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(LucideIcons.pencil, size: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 16);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-4",
                      child: MyFlex(
                        children: [
                          MyFlexItem(
                            sizes: "lg-12",
                            child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.bodyMedium("Leads Statics"),
                                  MySpacing.height(16),
                                  SfCartesianChart(
                                    primaryXAxis: CategoryAxis(),
                                    tooltipBehavior: controller.chartData,
                                    series: [
                                      StackedColumnSeries<ChartData2, double>(
                                        dataSource: controller.chartData2,
                                        xValueMapper: (ChartData2 data, _) => data.x,
                                        yValueMapper: (ChartData2 data, _) => data.y1,
                                        width: 0.2,
                                      ),
                                      StackedColumnSeries<ChartData2, double>(
                                        dataSource: controller.chartData2,
                                        xValueMapper: (ChartData2 data, _) => data.x,
                                        yValueMapper: (ChartData2 data, _) => data.y2,
                                        width: 0.2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          MyFlexItem(
                            sizes: "lg-12",
                            child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.titleLarge("Status Chart"),
                                  SfCircularChart(
                                    legend: Legend(isVisible: true, position: LegendPosition.bottom),
                                    series: <CircularSeries>[
                                      PieSeries<ChartData1, String>(
                                        dataSource: controller.chartData1,
                                        pointColorMapper: (ChartData1 data, _) => data.color,
                                        xValueMapper: (ChartData1 data, _) => data.x,
                                        yValueMapper: (ChartData1 data, _) => data.y,
                                        dataLabelSettings: const DataLabelSettings(isVisible: true),
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
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
