import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    if(imagePath.endsWith('.svg')){
      return SvgPicture.asset(imagePath);
    }else{
      return Image.asset(imagePath);
    }
  }
}
