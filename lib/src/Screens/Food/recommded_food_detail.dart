import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sampleproject/src/Constance/them.dart';
import 'package:sampleproject/src/Controller/cart_controller.dart';
import 'package:sampleproject/src/Controller/popular_food_Controller.dart';
import 'package:sampleproject/src/Controller/recommended_food_controller.dart';
import 'package:sampleproject/src/Widget/app_icon.dart';
import 'package:sampleproject/src/Widget/big_text.dart';
import 'package:sampleproject/src/Widget/expandable_text_widget.dart';
import 'package:sampleproject/src/utils/app_constance.dart';

class RecommendedFooddetail extends StatelessWidget {
  final int pageId;
  const RecommendedFooddetail({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedFoodController>().recommendedFoodList[pageId];
    Get.find<PopularFoodController>()
        .initProduct(product, Get.find<CartCotroller>());

    // print('pageId===' + product.name!);

    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              toolbarHeight: 80,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => {Get.back()},
                    child: AppIcon(iconData: Icons.arrow_back_ios),
                  ),
                  GetBuilder<PopularFoodController>(
                    builder: (controller) {
                      return Stack(
                        children: [
                          AppIcon(iconData: Icons.shopping_cart_checkout),
                          Get.find<PopularFoodController>().totalItem >= 1
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColor.primary),
                                    child: Center(
                                        child: BigText(
                                      text: Get.find<PopularFoodController>()
                                          .totalItem
                                          .toString(),
                                      color: Colors.white,
                                      size: 10,
                                    )),
                                  ))
                              : Container()
                        ],
                      );
                    },
                  )
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: BigText(text: product.name!),
                  ),
                ),
              ),
              backgroundColor: Colors.yellow,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstance.BASE_URL + "/uploads/" + product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ExpandableTextWidget(text: product.description!),
                )
              ],
            ))
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularFoodController>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                          iconData: Icons.remove,
                          backgroundColor: AppColor.primary),
                    ),
                    BigText(
                        text: '\$${product.price!} ' +
                            " X " +
                            "${controller.inCartItems}"),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                          iconData: Icons.add,
                          backgroundColor: AppColor.primary),
                    )
                  ],
                ),
              ),
              Container(
                height: 120,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 15, right: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Icon(
                        Icons.favorite,
                        color: AppColor.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addCartItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 15, right: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.primary),
                        child: BigText(
                          text: "\$ ${product.price!} | Add to Cart",
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
