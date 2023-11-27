import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/auth_binding.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/login.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';

import 'package:induk_club_promotion_app_project/src/view/desktop_promotion_view.dart';
import 'package:induk_club_promotion_app_project/src/view/mobile_promotion_view.dart';
import 'package:induk_club_promotion_app_project/src/view/tablet_promotion_view.dart';

import 'package:induk_club_promotion_app_project/src/widget/promotion_item.dart';
import 'package:induk_club_promotion_app_project/src/widget/search_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/side_menu.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class DesktopMain extends GetView<PromotionController> {
  const DesktopMain({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SideMenu(),
          Obx(
            () => (controller.promotions.isEmpty)
                ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  )
                : Expanded(
                    child: CustomScrollView(
                      controller: Get.find<AppController>().verticalController,
                      slivers: [
                        _appBar(),
                        _header(),
                        _headerItem(),
                        _more(),
                        _moreItem(),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return const SliverToBoxAdapter(
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                TitleBox(
                  label: '마감이 다되어 가요',
                  fontSize: 20,
                  type: TitleType.IMPORTANT,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _more() {
    return const SliverToBoxAdapter(
      child: Column(children: [
        Row(
          children: [
            TitleBox(label: '동아리 더보기', fontSize: 25),
          ],
        ),
      ]),
    );
  }

  Widget _moreItem() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Obx(
          () => GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.8,
              ),
              itemCount: controller.promotions.length,
              itemBuilder: (context, index) => Obx(() {
                    final promotion = controller.promotions[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => ResponsibleLayout(
                            mobile: const MobilePromotionView(),
                            tablet: const TabletPromotionView(),
                            desktop: DesktopPromotionView(
                              promotion: promotion,
                            ),
                          ),
                        );
                      },
                      child: PromotionItem(
                        promotion: promotion,
                        date: ' D - 9 ',
                        showDday: false,
                      ),
                    );
                  })),
        ),
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      pinned: false,
      floating: false,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      leadingWidth: 200,
      leading: const Center(
        child: Text(
          'LOGO',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      title: SearchTextField(
          controller: Get.find<AppController>().searchController,
          type: SearchBarType.DESKTOP),
      actions: [
        TextButton(
          onPressed: () {
            Get.to(() => const Login(), binding: LoginBinding());
          },
          child: const Text("로그인", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

  Widget _headerItem() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Obx(
          () => GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount: controller.promotions.length,
              itemBuilder: (context, index) => Obx(() {
                    final promotion = controller.promotions[index];
                    return GestureDetector(
                        onTap: () {
                          Get.to(
                            () => ResponsibleLayout(
                              mobile: const MobilePromotionView(),
                              tablet: const TabletPromotionView(),
                              desktop: DesktopPromotionView(
                                promotion: promotion,
                              ),
                            ),
                          );
                        },
                        child:
                            PromotionItem(date: "D - 9", promotion: promotion));
                  })),
        ),
      ),
    );
  }
}
