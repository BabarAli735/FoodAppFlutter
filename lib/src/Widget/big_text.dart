import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;
  BigText(
      {super.key,
      this.color = const Color.fromARGB(255, 10, 10, 10),
      required this.text,
      this.size = 16,
      this.textOverflow = TextOverflow.ellipsis});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w400,
          fontFamily: 'futur',
          fontSize: size),
    );
  }
}
