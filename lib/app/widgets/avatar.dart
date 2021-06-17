import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    this.photoUrl,
    required this.radius,
    this.borderColor,
    this.borderWidth,
    this.displayName,
  });
  final String? photoUrl;
  final double radius;
  final Color? borderColor;
  final double? borderWidth;
  final String? displayName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _borderDecoration(),
      child: CircleAvatar(
        radius: radius,
        backgroundColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
        child: photoUrl != null
            ? CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => SizedBox(),
                imageUrl: photoUrl!,
              )
            : displayName != null
                ? FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      displayName!.substring(0, 1).toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.white),
                    ),
                  )
                : Image.asset(
                    'assets/icons/camera_button_icon.png',
                    fit: BoxFit.cover,
                  ),
      ),
    );
  }

  Decoration? _borderDecoration() {
    if (borderColor != null && borderWidth != null) {
      return BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor!,
          width: borderWidth!,
        ),
      );
    }
    return null;
  }
}
