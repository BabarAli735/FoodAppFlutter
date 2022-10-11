import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sampleproject/src/Constance/them.dart';
import 'package:sampleproject/src/Screens/Home/body.dart';
import 'package:sampleproject/src/Widget/big_text.dart';
import 'package:sampleproject/src/Widget/small_text.dart';
import 'package:sampleproject/src/utils/dimentions.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 25),
            // padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            BigText(
                              text: "Pakistan",
                              color: Color.fromARGB(255, 13, 213, 228),
                            ),
                            Row(
                              children: [
                                SmallText(
                                  text: "Karachi",
                                ),
                                Icon(
                                  Icons.arrow_downward_rounded,
                                  size: 12,
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: AppColor.primary),
                        )
                      ],
                    )),
                Expanded(
                    child: SingleChildScrollView(
                  child: Body(),
                ))
              ],
            )));
  }
}
