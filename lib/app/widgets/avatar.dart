import 'dart:math';

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
        backgroundColor: Colors.black12,
        backgroundImage: photoUrl != null ? NetworkImage(photoUrl!) : null,
        child: photoUrl == null
            ? displayName != null
                ? FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      displayName!.substring(0, 1).toUpperCase(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  )
                : null
            : null,
      ),
    );
  }

// = Colors.primaries[Random().nextInt(Colors.primaries.length)]
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
