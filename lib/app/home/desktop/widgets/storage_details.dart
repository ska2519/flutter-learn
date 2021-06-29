import 'package:flutter/material.dart';

import 'package:flutter_learn/constants/constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '업데이트 예정',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            svgSrc: 'assets/icons/documents.svg',
            title: 'Documents Files',
            amountOfFiles: '1.3GB',
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: 'assets/icons/media.svg',
            title: 'Media Files',
            amountOfFiles: '15.3GB',
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: 'assets/icons/folder.svg',
            title: 'Other Files',
            amountOfFiles: '1.3GB',
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: 'assets/icons/unknown.svg',
            title: 'Unknown',
            amountOfFiles: '1.3GB',
            numOfFiles: 140,
          ),
        ],
      ),
    );
  }
}
