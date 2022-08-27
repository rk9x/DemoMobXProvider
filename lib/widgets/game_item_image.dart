import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GameItemImageView extends StatelessWidget {
  const GameItemImageView({
    Key? key,
    required this.backgroundImage,
  }) : super(key: key);
  final String? backgroundImage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.18,
      height: MediaQuery.of(context).size.height * 0.18,
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: backgroundImage ?? '',
            progressIndicatorBuilder: (
              context,
              url,
              downloadProgress,
            ) =>
                Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress),
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.red,
            ),
          )),
    );
  }
}
