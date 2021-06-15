// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_learn/services/firestore_database.dart';

final _ids = [
  'a6hdJFD7qVfDe6yvRZF4SFwtP903',
  'RPxVy0vtJYULUesWjL4ceXB1h3H2',
  '7ytll7EosoUNI8Ix2hpPf8ZR3rH3',
];
final _userIds = [
  'a6hdJFD7qVfDe6yvRZF4SFwtP903',
  'RPxVy0vtJYULUesWjL4ceXB1h3H2',
  '7ytll7EosoUNI8Ix2hpPf8ZR3rH3',
];

final _cities = [
  'Albuquerque',
  'Arlington',
  'Atlanta',
  'Austin',
  'Baltimore',
  'Boston',
  'Charlotte',
  'Chicago',
  'Cleveland',
  'Colorado Springs',
  'Columbus',
  'Dallas',
  'Denver',
  'Detroit',
  'El Paso',
  'Fort Worth',
  'Fresno',
  'Houston',
  'Indianapolis',
  'Jacksonville',
  'Kansas City',
  'Las Vegas',
  'Long Island',
  'Los Angeles',
  'Louisville',
  'Memphis',
  'Mesa',
  'Miami',
  'Milwaukee',
  'Nashville',
  'New York',
  'Oakland',
  'Oklahoma',
  'Omaha',
  'Philadelphia',
  'Phoenix',
  'Portland',
  'Raleigh',
  'Sacramento',
  'San Antonio',
  'San Diego',
  'San Francisco',
  'San Jose',
  'Seattle',
  'Tucson',
  'Tulsa',
  'Virginia Beach',
  'Washington',
];

final _categories = [
  'Brunch',
  'Burgers',
  'Coffee',
  'Deli',
  'Dim Sum',
  'Indian',
  'Italian',
  'Mediterranean',
  'Mexican',
  'Pizza',
  'Ramen',
  'Sushi',
];

final _words = [
  'Bar',
  'Deli',
  'Diner',
  'Fire',
  'Grill',
  'Drive Thru',
  'Place',
  'Best',
  'Spot',
  'Trattoria',
  'Steakhouse',
  'Churrasco',
  'Tavern',
  'Cafe',
  'Pop-up',
  'Yummy',
  'Belly',
  'Snack',
  'Fast',
  'Turbo',
  'Hyper',
  'Prime',
  'Eating',
];

final _contents = [
  'Would never eat here again!',
  'Such an awful place!',
  'Not sure if they had a bad day off, but the food was very bad.',
  'Not my cup of tea.',
  'Unlikely that we will ever come again.',
  "Quite bad, but I've had worse!",
  'Exactly okay :/',
  'Unimpressed, but not disappointed!',
  '3 estrellas y van que arden.',
  'Actually pretty good, would recommend!',
  'I really like this place, I come quite often!',
  'A great experience, as usual!',
  'This is my favorite place. Literally',
  'This place is ALWAYS great!',
  'I recommend this to all my friends and family!',
];

final random = Random();

String getRandomIds() {
  final currentDate = documentIdFromCurrentDate();
  print('currentDate: $currentDate');
  final serverTimestamp = FieldValue.serverTimestamp();
  print('serverTimestamp: $serverTimestamp');
  // final now = DateTime.now();
  // final timestamp = <DateTime>{now};
  //${random.nextInt(currentDate)}:
  return _ids[random.nextInt(_ids.length)];
}

String getRandomUserIds() {
  return _userIds[random.nextInt(_userIds.length)];
}

String getRandomDisplayName() {
  final firstWord = random.nextInt(_words.length);
  int nextWord;
  do {
    nextWord = random.nextInt(_words.length);
  } while (firstWord == nextWord);
  return '${_words[firstWord]} ${_words[nextWord]}';
}

String getRandomTitle() {
  return _categories[random.nextInt(_categories.length)];
}

String getRandomContent() {
  return _contents[random.nextInt(_contents.length)];
}

String getRandomPhoto() {
  final photoId = random.nextInt(21) + 1;
  return 'https://randomuser.me/api/portraits/women/$photoId.jpg';
  // return 'https://storage.googleapis.com/firestorequickstarts.appspot.com/food_$photoId.png';
}
