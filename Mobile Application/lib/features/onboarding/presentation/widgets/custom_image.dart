import 'package:flutter/cupertino.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {

      return Image.asset(imagePath);

  }
}
