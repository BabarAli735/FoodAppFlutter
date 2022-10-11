import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  int? maxline;
  SmallText(
      {super.key,
      this.color = const Color.fromARGB(255, 230, 225, 225),
      required this.text,
      this.size = 12,
      this.maxline});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxline != null ? maxline : null,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'futur',
        fontSize: size,
      ),
    );
  }
}
