import 'package:flutter/material.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

import 'components/header.dart';
import 'components/my_files.dart';
import 'components/recent_files.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PixelPerfect(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        const MyFiles(),
                        const SizedBox(height: defaultPadding),
                        const RecentFiles(),
                      ],
                    ),
                  ),
                  const SizedBox(width: defaultPadding),
                  const Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
