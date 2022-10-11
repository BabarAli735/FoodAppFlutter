import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sampleproject/src/Widget/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  final Color iconcolor;
  const IconAndTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      this.color,
      required this.iconcolor});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        icon,
        color: iconcolor,
      ),
      SizedBox(width: 2),
      SmallText(text: text, color: color)
    ]);
  }
}
