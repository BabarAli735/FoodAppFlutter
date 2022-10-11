import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sampleproject/src/Constance/them.dart';
import 'package:sampleproject/src/Controller/popular_food_Controller.dart';
import 'package:sampleproject/src/Controller/recommended_food_controller.dart';
import 'package:sampleproject/src/Model/popular_model.dart';
import 'package:sampleproject/src/Screens/Food/popular_food_detail.dart';
import 'package:sampleproject/src/Widget/big_text.dart';
import 'package:sampleproject/src/Widget/icon_and_text_widget.dart';
import 'package:sampleproject/src/Widget/small_text.dart';
import 'package:sampleproject/src/utils/app_constance.dart';
import 'package:sampleproject/src/utils/dimentions.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currentPageValue = 0.0;
  double scalefactor = 0.0;
  double _height = Dimentions.pageViewerHeight;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GetBuilder<PopularFoodController>(builder: (popularFood) {
        return popularFood.isloaded
            ? Container(
                height: Dimentions.pageViewer,
                child: GestureDetector(
                  onTap: () => {Get.to(() => PopularFoodDetail())},
                  child: PageView.builder(
                      itemCount: popularFood.popularFoodList.length,
                      controller: pageController,
                      itemBuilder: (context, index) {
                        return _buildPageItem(
                            index, popularFood.popularFoodList[index]);
                      }),
                ),
              )
            : CircularProgressIndicator(
                color: AppColor.primary,
              );
      }),
      GetBuilder<PopularFoodController>(builder: (popularfood) {
        return DotsIndicator(
          dotsCount: popularfood.popularFoodList.length <= 0
              ? 1
              : popularfood.popularFoodList.length,
          position: currentPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        );
      }),
      SizedBox(
        height: Dimentions.ScreenHeight * 0.02,
      ),
      Container(
        margin: EdgeInsets.only(left: Dimentions.ScreenHeight * 0.03),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BigText(text: 'Recommended'),
            SizedBox(width: 5),
            SmallText(text: 'Food Pairing'),
          ],
        ),
      ),
      GetBuilder<RecommendedFoodController>(builder: (recommendedfood) {
        return recommendedfood.isloaded
            ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: recommendedfood.recommendedFoodList.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin:
                        EdgeInsets.only(left: 20, bottom: 5, top: 5, right: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(AppConstance.BASE_URL +
                                      "/uploads/" +
                                      recommendedfood
                                          .recommendedFoodList[index].img),
                                  fit: BoxFit.cover)),
                        ),
                        Expanded(
                            child: Container(
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 68, 18, 185),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 5)),
                              BoxShadow(
                                  color: Color.fromARGB(255, 113, 201, 31),
                                  blurRadius: 5.0,
                                  offset: Offset(-5, 0)),
                              BoxShadow(
                                  color: Color.fromARGB(255, 233, 23, 23),
                                  blurRadius: 5.0,
                                  offset: Offset(5, 0)),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(
                                    text: recommendedfood
                                        .recommendedFoodList[index].name!),
                                SizedBox(height: 5),
                                SmallText(
                                    maxline: 2,
                                    text: recommendedfood
                                        .recommendedFoodList[index]
                                        .description!),
                                SizedBox(height: 5),
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
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    IconAndTextWidget(
                                        icon: Icons.circle_sharp,
                                        text: 'Normal',
                                        iconcolor:
                                            Color.fromARGB(255, 40, 176, 240)),
                                    IconAndTextWidget(
                                        icon: Icons.location_on,
                                        text: '1.4',
                                        iconcolor:
                                            Color.fromARGB(255, 90, 163, 247)),
                                    IconAndTextWidget(
                                        icon: Icons.access_time_rounded,
                                        text: '32min',
                                        iconcolor:
                                            Color.fromARGB(255, 245, 97, 11)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ))
                      ],
                    ),
                  );
                }))
            : CircularProgressIndicator(
                color: AppColor.primary,
              );
      })
    ]);
  }

  Widget _buildPageItem(int index, ProductModel popularFoodList) {
    Matrix4 matrix4 = new Matrix4.identity();
    if (index == currentPageValue.floor()) {
      var currentscal = 1 - (currentPageValue - index) * (1 - scalefactor);
      var curTrans = _height * (1 - currentscal) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentscal, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (index == currentPageValue.floor()) {
      var currentscal =
          scalefactor + (currentPageValue - index + 1) * (1 - scalefactor);
      var curTrans = _height * (1 - currentscal) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentscal, 1)
        ..setTranslationRaw(0, curTrans, 0);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height: Dimentions.pageViewerHeight,
            margin: EdgeInsets.only(left: 5, right: 5, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: index.isEven ? Colors.blueGrey : Colors.cyanAccent,
              image: DecorationImage(
                  image: NetworkImage(AppConstance.BASE_URL +
                      "/uploads/" +
                      popularFoodList.img!),
                  fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: Dimentions.pageTextViewer,
                margin: EdgeInsets.only(left: 40, right: 40, bottom: 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 68, 18, 185),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(
                          color: Color.fromARGB(255, 113, 201, 31),
                          blurRadius: 5.0,
                          offset: Offset(-5, 0)),
                      BoxShadow(
                          color: Color.fromARGB(255, 233, 23, 23),
                          blurRadius: 5.0,
                          offset: Offset(5, 0)),
                    ]),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(children: [
                    BigText(text: popularFoodList.name!),
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
                  ]),
                )),
          ),
        ],
      ),
    );
  }
}
