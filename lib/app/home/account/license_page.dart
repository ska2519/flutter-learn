import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LicenseSimplePage extends StatefulWidget {
  const LicenseSimplePage({Key? key}) : super(key: key);

  @override
  _LicenseSimplePageState createState() => _LicenseSimplePageState();
}

class _LicenseSimplePageState extends State<LicenseSimplePage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: '',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LicensePage(
      applicationName: LocaleKeys.flutterLearn.tr(),
      applicationIcon: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Image.asset('assets/icons/dash_icon_180.png'),
      ),
      applicationVersion: _packageInfo.version,
      applicationLegalese: 'Copyright ${DateTime.now().year} Sk@',
    );
  }
}
