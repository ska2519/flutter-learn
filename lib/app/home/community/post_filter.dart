import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'posts_page.dart';

class PostFilter extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final filter = useProvider(postsFilter);
    final filterDays = useProvider(postsFilterDays);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: SizedBox(
        height: 30,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => filter.state = sortType.likedCount,
              icon: Icon(
                filter.state == sortType.likedCount
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: filter.state == sortType.likedCount
                    ? firebaseOrangeColor
                    : Colors.grey,
                size: 19,
              ),
            ),
            IconButton(
              onPressed: () => filter.state = sortType.readCount,
              icon: Icon(
                filter.state == sortType.readCount
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove_red_eye_outlined,
                color: filter.state == sortType.readCount
                    ? firebaseOrangeColor
                    : Colors.grey,
                size: 19,
              ),
            ),
            IconButton(
              onPressed: () => filter.state = sortType.commentCount,
              icon: Icon(
                filter.state == sortType.commentCount
                    ? Icons.mode_comment_outlined
                    : Icons.mode_comment_outlined,
                color: filter.state == sortType.commentCount
                    ? firebaseOrangeColor
                    : Colors.grey,
                size: 18.3,
              ),
            ),
            ElevatedButton(
                onPressed: () => filterDaysPopup(context, filterDays),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: flutterAccentColor,
                ),
                child: Text(
                  '최근 ${filterDays.state} 일',
                  style: TextStyle(fontSize: 11, color: firebaseOrangeColor),
                ))
          ],
        ),
      ),
    );
  }

  Future<dynamic> filterDaysPopup(
      BuildContext context, StateController<int> filterDays) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              filterDays.state = 1;
              Navigator.pop(context);
            },
            child: Text(
              LocaleKeys.oneDay.tr(),
              style: TextStyle(
                color: filterDays.state == 1
                    ? firebaseOrangeColor
                    : flutterPrimaryColor,
              ),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              filterDays.state = 3;
              Navigator.pop(context);
            },
            child: Text(
              LocaleKeys.threeDay.tr(),
              style: TextStyle(
                color: filterDays.state == 3
                    ? firebaseOrangeColor
                    : flutterPrimaryColor,
              ),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              filterDays.state = 7;
              Navigator.pop(context);
            },
            child: Text(
              LocaleKeys.sevenDay.tr(),
              style: TextStyle(
                color: filterDays.state == 7
                    ? firebaseOrangeColor
                    : flutterPrimaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
