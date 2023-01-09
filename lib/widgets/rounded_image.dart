import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RoundedImage extends StatelessWidget {
  final String imagePath;
  final double size;
  RoundedImage({Key? key, required this.imagePath, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imagePath)),
          borderRadius: BorderRadius.all(Radius.circular(size))),
    );
  }
}

class RoundedImageProfile extends StatelessWidget {
  final String imagePath;
  final double size;
  RoundedImageProfile({Key? key, required this.imagePath, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imagePath)),
          borderRadius: BorderRadius.all(Radius.circular(size))),
    );
  }
}
