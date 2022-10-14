import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sampleproject/src/Constance/them.dart';
import 'package:sampleproject/src/Controller/cart_controller.dart';
import 'package:sampleproject/src/Controller/popular_food_Controller.dart';
import 'package:sampleproject/src/Routes/route_helper.dart';
import 'package:sampleproject/src/Screens/Cart/cart_page.dart';
import 'package:sampleproject/src/Screens/Home/main_page.dart';
import 'package:sampleproject/src/Widget/app_icon.dart';
import 'package:sampleproject/src/Widget/big_text.dart';
import 'package:sampleproject/src/Widget/expandable_text_widget.dart';
import 'package:sampleproject/src/Widget/icon_and_text_widget.dart';
import 'package:sampleproject/src/Widget/small_text.dart';
import 'package:sampleproject/src/utils/app_constance.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularFoodController>().popularFoodList[pageId];
    Get.find<PopularFoodController>()
        .initProduct(product, Get.find<CartCotroller>());

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          // BackGroundImage
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            AppConstance.BASE_URL + "/uploads/" + product.img!),
                        fit: BoxFit.cover)),
              )),
          // Icon Widget
          Positioned(
              left: 20,
              right: 20,
              top: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (() => {Get.toNamed(RouteHelper.initial)}),
                    child: AppIcon(iconData: Icons.arrow_back_ios),
                  ),
                  GetBuilder<PopularFoodController>(
                    builder: (controller) {
                      return Stack(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.to(() => CartPage());
                              },
                              child: AppIcon(
                                  iconData: Icons.shopping_cart_checkout)),
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
              )),
          // Introduce
          Positioned(
              left: 0,
              right: 0,
              top: 200,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: product.name!),
                    SizedBox(height: 10),
                    Row(children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  size: 15,
                                  color: AppColor.primary,
                                )),
                      ),
                      SizedBox(width: 10),
                      SmallText(text: '4.5'),
                      SizedBox(width: 10),
                      SmallText(text: '2788'),
                      SizedBox(width: 10),
                      SmallText(text: 'Comments')
                    ]),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            text: 'Normal',
                            iconcolor: Color.fromARGB(255, 40, 176, 240)),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            text: '1.4',
                            iconcolor: Color.fromARGB(255, 90, 163, 247)),
                        IconAndTextWidget(
                            icon: Icons.access_time_rounded,
                            text: '32min',
                            iconcolor: Color.fromARGB(255, 245, 97, 11)),
                      ],
                    ),
                    SizedBox(height: 10),
                    BigText(text: 'Intoduce'),
                    SizedBox(height: 10),
                    //ExpandAble Text
                    Expanded(
                        child: SingleChildScrollView(
                      child: ExpandableTextWidget(text: product.description!),
                    ))
                  ],
                ),
              )),
        ]),
        bottomNavigationBar: GetBuilder<PopularFoodController>(
          builder: (controller) {
            return Container(
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
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.setQuantity(false);
                          },
                          child: Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10),
                        BigText(text: controller.inCartItems.toString()),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            controller.setQuantity(true);
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 15, right: 15),
                      child: GestureDetector(
                        onTap: () {
                          controller.addCartItem(product);
                        },
                        child: BigText(
                          text: "\$ ${product.price!} | Add to Cart",
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.primary)),
                ],
              ),
            );
          },
        ));
  }
}
