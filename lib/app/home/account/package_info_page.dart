import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoPage extends StatefulWidget {
  const PackageInfoPage({Key? key}) : super(key: key);

  @override
  _PackageInfoPageState createState() => _PackageInfoPageState();
}

class _PackageInfoPageState extends State<PackageInfoPage> {
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

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isNotEmpty ? subtitle : 'Not set'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.appInfo.tr())),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _infoTile('App name', _packageInfo.appName),
          _infoTile('Package name', _packageInfo.packageName),
          _infoTile('App version', _packageInfo.version),
          _infoTile('Build number', _packageInfo.buildNumber),
        ],
      ),
    );
  }
}
