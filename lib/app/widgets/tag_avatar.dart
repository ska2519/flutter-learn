import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/models/tag.dart';

class TagAvatar extends StatelessWidget {
  const TagAvatar(this.tag);
  final Tag tag;

  Future<ByteData?> myLoadAsset(String path) async {
    try {
      return await rootBundle.load(path);
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ByteData?>(
      future: myLoadAsset('assets/icons/${tag.image}'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final path = 'assets/icons/${tag.image}';
          return Image.asset(path);
        } else if (snapshot.data == null) {
          return tag.imageUrl != null
              ? CachedNetworkImage(imageUrl: tag.imageUrl!)
              : Image.asset('assets/icons/dino_icon_180.png');
        }
        return const SizedBox();
      },
    );
  }
}
