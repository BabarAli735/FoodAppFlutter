import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sampleproject/src/Constance/them.dart';
import 'package:sampleproject/src/Screens/Home/main_page.dart';
import 'package:sampleproject/src/Widget/app_icon.dart';
import 'package:sampleproject/src/Widget/big_text.dart';
import 'package:sampleproject/src/Widget/expandable_text_widget.dart';
import 'package:sampleproject/src/Widget/icon_and_text_widget.dart';
import 'package:sampleproject/src/Widget/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKAVqW8DxISKXZoBtjL6gHn3zxPCKJ05or_w&usqp=CAU'),
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
                  onTap: (() => {Get.back()}),
                  child: AppIcon(iconData: Icons.arrow_back_ios),
                ),
                GestureDetector(
                    onTap: (() => {}),
                    child: AppIcon(iconData: Icons.shopping_cart_checkout)),
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
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: 'Biryani'),
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
                    child: ExpandableTextWidget(
                        text:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
                  ))
                ],
              ),
            )),
      ]),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10),
                  BigText(text: '1'),
                  SizedBox(width: 10),
                  Icon(
                    Icons.add,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.primary),
              child: BigText(
                text: "\$10 | Add to Cart",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
