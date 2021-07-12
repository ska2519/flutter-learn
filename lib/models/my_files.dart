import 'package:flutter/material.dart';

import 'package:flutter_learn/constants/constants.dart';

class CloudStorageInfo {
  CloudStorageInfo({
    required this.svgSrc,
    required this.title,
    required this.totalStorage,
    required this.numOfFiles,
    required this.percentage,
    required this.color,
  });
  final String svgSrc, title, totalStorage;
  final int numOfFiles, percentage;
  final Color color;
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Documents",
    numOfFiles: 1328,
    svgSrc: "assets/icons/documents.svg",
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Google Drive",
    numOfFiles: 1328,
    svgSrc: "assets/icons/google_drive.svg",
    totalStorage: "2.9GB",
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "One Drive",
    numOfFiles: 1328,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "1GB",
    color: const Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Documents",
    numOfFiles: 5328,
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: "7.3GB",
    color: const Color(0xFF007EE5),
    percentage: 78,
  ),
];
