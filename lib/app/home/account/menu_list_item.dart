import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuListItem extends HookWidget {
  const MenuListItem({
    Key? key,
    required this.onTap,
    required this.title,
    this.icon,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData? icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final appUser = useProvider(appUserStreamProvider).data?.value;
    return GestureDetector(
      onTap: appUser == null ? () => SignInPage.show(context) : onTap,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            defaultPadding,
            defaultPadding * 1.5,
            defaultPadding,
            defaultPadding * 1.5,
          ),
          child: Row(
            children: [
              if (icon != null) Icon(icon, color: Colors.black54),
              SizedBox(width: defaultPadding),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(height: 1.25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
