import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sampleproject/src/Constance/them.dart';
import 'package:sampleproject/src/Controller/cart_controller.dart';
import 'package:sampleproject/src/Widget/app_icon.dart';
import 'package:sampleproject/src/Widget/big_text.dart';
import 'package:sampleproject/src/Widget/small_text.dart';
import 'package:sampleproject/src/utils/app_constance.dart';
import 'package:sampleproject/src/utils/dimentions.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            left: 20,
            right: 20,
            top: Dimentions.ScreenHeight * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconData: Icons.arrow_back_ios,
                  backgroundColor: AppColor.primary,
                  iconColor: Colors.white,
                ),
                SizedBox(
                  width: 50,
                ),
                AppIcon(
                  iconData: Icons.home_outlined,
                  backgroundColor: AppColor.primary,
                  iconColor: Colors.white,
                ),
                AppIcon(
                  iconData: Icons.shopping_cart,
                  backgroundColor: AppColor.primary,
                  iconColor: Colors.white,
                ),
              ],
            )),
        Positioned(
            top: 100,
            left: 20,
            right: 20,
            bottom: 0,
            child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 10),
                child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: GetBuilder<CartCotroller>(
                      builder: (cartcontroller) {
                        return ListView.builder(
                            itemCount: cartcontroller.getItems.length,
                            itemBuilder: (_, index) {
                              return Container(
                                height: Dimentions.ScreenHeight * 0.15,
                                width: double.maxFinite,
                                color: Colors.white,
                                margin: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: Dimentions.ScreenWidth * 0.22,
                                      width: Dimentions.ScreenWidth * 0.22,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.amber,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  AppConstance.BASE_URL +
                                                      "/uploads/" +
                                                      cartcontroller
                                                          .getItems[index].img
                                                          .toString()),
                                              fit: BoxFit.cover)),
                                    ),
                                    Expanded(
                                        child: Container(
                                      color: Colors.white,
                                      margin: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          BigText(
                                              text: cartcontroller
                                                  .getItems[index].name!),
                                          SmallText(
                                              text: cartcontroller
                                                  .getItems[index].name!),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(
                                                text: cartcontroller
                                                    .getItems[index].price!
                                                    .toString(),
                                                color: Colors.redAccent,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    bottom: 10,
                                                    left: 15,
                                                    right: 15),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        // controller.setQuantity(false);
                                                      },
                                                      child: Icon(
                                                        Icons.remove,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    BigText(text: ''),
                                                    SizedBox(width: 10),
                                                    GestureDetector(
                                                      onTap: () {
                                                        // controller.setQuantity(true);
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.black,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              );
                            });
                      },
                    ))))
      ]),
    );
  }
}
