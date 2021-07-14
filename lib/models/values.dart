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
import 'package:flutter_learn/secret_keys.dart';
import 'package:flutter_learn/services/firestore_database.dart';

final _userIds = [
  debugAdminUid,
  // releaseAdminUid, // ska2519@gmail.com / Ska Lee
  // 'sPGSy6SVI1UYCH1F9C0b0JPrDMk2', // skaleevn@gmail.com / 리처드 파인만
  // 'sQz4zvSVQpRKteDOOe26CXpxLcl1',
  // 'bAfJLNN3gFTvZrcwFqYNQ4RXPmD3',
];

// ignore: unused_element
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
  final currentDate = documentIdFromCurrentDate().substring(0, 25);
  final randomPostIds =
      'Random$currentDate:${_userIds[random.nextInt(_userIds.length)]}';
  return randomPostIds;
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

DateTime getRandomTimestamp() {
  final now = DateTime.now();
  return now.subtract(Duration(seconds: random.nextInt(60 * 60)));
}

Set<String> getRandomTags() {
  final stringTags = [
    'flutter',
    'firebase',
    'git',
    'github',
    'android',
    'test'
  ];
  final randomNumber = random.nextInt(stringTags.length) + 1;
  final randomList = <String>{};
  for (var i = 0; i < randomNumber; i++) {
    // final tag = <String>{};
    randomList.add(stringTags[i]);
  }
  print('randomList: $randomList');
  return randomList;
}

String getRandomPhoto() {
  final photoId = random.nextInt(21) + 1;
  return 'https://randomuser.me/api/portraits/women/$photoId.jpg';
  // return 'https://storage.googleapis.com/firestorequickstarts.appspot.com/food_$photoId.png';
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(random.nextInt(_chars.length))));

class SuperHero {
  static String random() {
    final int numberOfSuperheroes = superheroes.length;
    final int randomNumber = Random().nextInt(numberOfSuperheroes);
    return superheroes[randomNumber];
  }
}

List<String> superheroes = [
  "3-D Man",
  "A-Bomb",
  "A.I.M.",
  "Aaron Stack",
  "Abbey",
  "Abomination",
  "Absorbing Man",
  "Abyss",
  "Acolytes",
  "Adam Destine",
  "Adam Warlock",
  "Adrienne",
  "Aegis",
  "Agent",
  "Agent Brand",
  "Agent Liberty",
  "Agent X",
  "Agent Zero",
  "Agents of Atlas",
  "Aginar",
  "Ahab",
  "Air-Walker",
  "Ajak",
  "Ajaxis",
  "Akemi",
  "Alain",
  "Albert Cleary",
  "Albion",
  "Aleta",
  "Alex Power",
  "Alex Wilder",
  "Alexa Mendez",
  "Alexander Pierce",
  "Alice",
  "Alicia Masters",
  "Alisha",
  "Alpha Flight",
  "Alvin Maker",
  "Amadeus Cho",
  "Amanda",
  "Amanda Sefton",
  "Amazi-Girl",
  "Amazoness",
  "Amber",
  "American Eagle",
  "Amethyst",
  "Amiko",
  "Amora",
  "Amphibian",
  "Amun",
  "Ancient One",
  "Andrew Chord",
  "Andromeda",
  "Angel",
  "Angela",
  "Anita Blake",
  "Anne Marie Hoag",
  "Annihilus",
  "Anole",
  "Ant-Man",
  "Anthem",
  "Anya",
  "Apocalypse",
  "Aquagirl",
  "Aquaman",
  "Aqueduct",
  "Arachne",
  "Arcade",
  "Arcana",
  "Archangel",
  "Arclight",
  "Ares",
  "Argent",
  "Arisia",
  "Armadillo",
  "Armor",
  "Armory",
  "Arnim Zola",
  "Arrowette",
  "Arsenal",
  "Arsenic",
  "Artemis",
  "Artiee",
  "Asgardian",
  "Askew-Tronics",
  "Aspen",
  "Asterix",
  "Asylum",
  "Atlas",
  "Atom",
  "Atomic",
  "Aurora",
  "Avalanche",
  "Avalon",
  "Avengelyne",
  "Avengers",
  "Azazel",
  "Azrael",
  "Aztec",
  "B.Orchid",
  "Babaing",
  "Ballistic",
  "Bane",
  "Banshee",
  "Barb",
  "Barbarella",
  "Baron Strucker",
  "Baron Zemo",
  "Baroness",
  "Baroness S'Bak",
  "Barracuda",
  "Bart Rozum",
  "Bastion",
  "Batgirl",
  "Batman",
  "Batroc the Leaper",
  "Battering Ram",
  "Battle",
  "Batwoman",
  "Baxter Stockman",
  "Bazooka",
  "Beach Head",
  "Beak",
  "Beast",
  "Beautiful",
  "Bebop",
  "Becatron",
  "Bedlam",
  "Beef",
  "Beetle",
  "Bella",
  "Belphegor",
  "Ben Grimm",
  "Ben Parker",
  "Ben Reilly",
  "Ben Urich",
  "Bengal",
  "Beta-Ray Bill",
  "Bette",
  "Betty Brant",
  "Betty Ross",
  "Beyonder",
  "Bi-Beast",
  "Big",
  "Big Bertha",
  "Big Wheel",
  "Bill Hollister",
  "Binary",
  "Bionic Commando",
  "Bishop",
  "Bizarro",
  "Black",
  "Black Bird",
  "Black Bolt",
  "Black Canary",
  "Black Cat",
  "Black Crow",
  "Black Knight",
  "Black Panther",
  "Black Queen",
  "Black Tarantula",
  "Black Tom",
  "Black Widow",
  "Blackbat",
  "Blackhawks",
  "Blackheart",
  "Blacklash",
  "Blacklight",
  "Blackout",
  "Blade",
  "Blastaar",
  "Blazing Skull",
  "Blindfold",
  "Blink",
  "Blitzkrieg",
  "Blizzard",
  "Blob",
  "Blockbuster",
  "Blok",
  "Bloke",
  "Blonde",
  "Blonde Phantom",
  "Blood Wraith",
  "Bloodaxe",
  "Bloodberry",
  "Bloodscream",
  "Bloodstorm",
  "Bloodstrike",
  "Bloom",
  "Blossom",
  "Blue",
  "Blue Beetle",
  "Blue Blade",
  "Blue Marvel",
  "Blue Shield",
  "Bluestreak",
  "Blur",
  "Bonnie",
  "Bonnie King",
  "Boodikka",
  "Boom",
  "Boom Boom",
  "Boomer",
  "Boomerang",
  "Booster",
  "Bounty",
  "Box",
  "Brainiac",
  "Brandy",
  "Bride of Nine Spiders",
  "Brittany",
  "Bromley",
  "Bronze",
  "Bronze Tiger",
  "Brood",
  "Brother Voodoo",
  "Bruce",
  "Bruce Banner",
  "Brute",
  "Bubbles",
  "Bucky",
  "Buff",
  "Buffy",
  "Bug",
  "Bulldozer",
  "Bulleteer",
  "Bulletgirl",
  "Bullseye",
  "Bumblebee",
  "Burka",
  "Burnout",
  "Bushwacker",
  "Buttercup",
  "Butterfly",
  "Cable",
  "Calamity",
  "Calendar",
  "Caliban",
  "Callisto",
  "Calypso",
  "Cammi",
  "Cammy",
  "Cannonball",
  "Cap'n Oz",
  "Captain",
  "Captain America",
  "Captain Britain",
  "Captain Cross",
  "Captain Flint",
  "Captain Marvel",
  "Captain Midlands",
  "Captain Planet",
  "Captain Stacy",
  "Captain Universe",
  "Cardiac",
  "Caretaker",
  "Cargill",
  "Carlie Cooper",
  "Carmella Unuscione",
  "Carnage",
  "Carol Danvers",
  "Carol Hines",
  "Cassandra",
  "Cassandra Nova",
  "Cat",
  "Catseye",
  "Catwoman",
  "Cecilia",
  "Cecilia Reyes",
  "Celestials",
  "Celsius",
  "Centennial",
  "Centurions",
  "Cerebro",
  "Cerise",
  "Cesspool",
  "Ch'od",
  "Chamber",
  "Chameleon",
  "Champions",
  "Chance",
  "Chandika",
  "Changeling",
  "Charles Xavier",
  "Charlie Campion",
  "Chase",
  "Chase Stein",
  "Chastity",
  "Chat",
  "Cheetah",
  "Cheetara",
  "Cherry",
  "Chimera",
  "Choice",
  "Chores MacGillicudy",
  "Christian Walker",
  "Chronomancer",
  "Chun-Li",
  "Cimarron",
  "Cinnamon",
  "Circuit",
  "Cissie King-Jones",
  "Clan Destine",
  "ClanDestine",
  "Clea",
  "Cleopatra",
  "Clint Barton",
  "Cloak",
  "Cloak and Dagger",
  "Clobber",
  "Clobberella",
  "Cloud 9",
  "Clover",
  "Coagula",
  "Cobalt Man",
  "Cobra",
  "Cobweb",
  "Colleen",
  "Colleen Wing",
  "Colonel America",
  "Colossus",
  "Colt",
  "Comedian",
  "Comet",
  "Conan the Barbarian",
  "Connor Hawke",
  "Constrictor",
  "Contessa",
  "Controller",
  "Copperhead",
  "Copycat",
  "Cornelius",
  "Corsair",
  "Cosmo",
  "Cottonmouth",
  "Count Nefaria",
  "Countess",
  "Crane",
  "Crazy",
  "Crimson",
  "Crimson Avenger",
  "Crimson Crusader",
  "Crimson Dynamo",
  "Crimson King",
  "Crossbones",
  "Crule",
  "Crusher Hogan",
  "Crystal",
  "Cuckoo",
  "Curt Conners",
  "Cuthbert",
  "Cyber",
  "Cybergirl",
  "Cybersix",
  "Cyblade",
  "Cyborg",
  "Cyclone",
  "Cyclops",
  "Cypher",
  "D'Ken Neramani",
  "Dagger",
  "Daily Bugle",
  "Daimon Hellstrom",
  "Daken",
  "Dakota North",
  "Damage Control",
  "Damian",
  "Dani Moonstar",
  "Danny Rand",
  "Daredevil",
  "Dargo Ktor",
  "Dark Avengers",
  "Dark Beast",
  "Dark Phoenix",
  "Dark X-Men",
  "Darkhawk",
  "Darkstar",
  "Darna",
  "Dart",
  "Darwin",
  "David Alleyne",
  "Dawn",
  "Dawnstar",
  "Dazzler",
  "Deacon Frost",
  "Dead",
  "Dead Girl",
  "Deadpool",
  "Death",
  "Deathbird",
  "Deathcry",
  "Deathlok",
  "Deathstrike",
  "Debra Whitman",
  "Debrii",
  "Decepticon",
  "Deena Pilgrim",
  "Deep",
  "Defenders",
  "Demogoblin",
  "Destiny",
  "Detective Soap",
  "Devastator",
  "Devi",
  "Deviants",
  "Devil Dinosaur",
  "Devos",
  "Dexter Bennett",
  "Diablo",
  "Diamond",
  "Diamondback",
  "Dick",
  "Dinah Soar",
  "Dirk Anger",
  "Diva",
  "Doc Samson",
  "Doc Savage",
  "Doctor",
  "Doctor Doom",
  "Doctor Faustus",
  "Doctor Mindbender",
  "Doctor Octopus",
  "Doctor Spectrum",
  "Doctor Strange",
  "Dog Brother #1",
  "Doll",
  "Dollar",
  "Dolphin",
  "Domino",
  "Donald Blake",
  "Donatello",
  "Donna",
  "Doomsday",
  "Doomsday Man",
  "Doop",
  "Doorman",
  "Doppelganger",
  "Dorian Gray",
  "Dormammu",
  "Dorothy",
  "Dove",
  "Dr. Strange",
  "Dracula",
  "Dragon Lord",
  "Dragon Man",
  "Dragonfly",
  "Dragonna",
  "Drax",
  "Dreadnought",
  "Dreadnoughts",
  "Dream",
  "Dreaming Celestial",
  "Druig",
  "Duck-Girl",
  "Dum Dum Dugan",
  "Dumb",
  "Dusk",
  "Dust",
  "Dyna",
  "Dynamite",
  "Earthquake",
  "Echo",
  "Eddie Brock",
  "Eddie Lau",
  "Edwin Jarvis",
  "Ego",
  "El Aguila",
  "Elasti-Girl",
  "Elastigirl/Mrs.Incredible",
  "Electra",
  "Electro",
  "Elektra",
  "Elements of Doom",
  "Elite",
  "Elixir",
  "Elloe Kaifi",
  "Elongated",
  "Elsa Bloodstone",
  "Emma",
  "Emma Frost",
  "Empath",
  "Emplate",
  "Empowered",
  "Empress",
  "Enchantress",
  "Ender Wiggin",
  "Energizer",
  "Epoch",
  "Eradicator",
  "Erik the Red",
  "Erza",
  "Eternals",
  "Eternity",
  "Excalibur",
  "Exiles",
  "Exodus",
  "Expediter",
  "Ezekiel",
  "Ezekiel Stane",
  "Fabian Cortez",
  "Fairchild",
  "Faith",
  "Falcon",
  "Fallen",
  "Fallen One",
  "Famine",
  "Fantastic Four",
  "Fantastick Four",
  "Fantomah",
  "Fantomette",
  "Fantomex",
  "Fat Cobra",
  "Fathom",
  "Felicia Hardy",
  "Fenris",
  "Feral",
  "Fever",
  "Fin Fang Foom",
  "Fire",
  "Firebird",
  "Firebrand",
  "Firedrake",
  "Firefly",
  "Firelord",
  "Firestar",
  "Firestorm",
  "Fixer",
  "Flaberella",
  "Flamebird",
  "Flash",
  "Flatman",
  "Fleet Tracking",
  "Fleur-de-Lis",
  "Flint",
  "Flora",
  "Flying Dutchman",
  "Foggy Nelson",
  "Foot Soldier",
  "Force Works",
  "Forearm",
  "Forerunner",
  "Forge",
  "Forgotten One",
  "Four Horsemen of Apocalypse",
  "Frank Castle",
  "Frankenstein's Monster",
  "Franklin Richards",
  "Franklin Storm",
  "Freak",
  "Free",
  "Freefall",
  "Frenzy",
  "Frightful Four",
  "Frog Thor",
  "Frog-Man",
  "Fury",
  "G.I. Joe",
  "GW Bridge",
  "Gabe Jones",
  "Galactus",
  "Galia",
  "Galvatron",
  "Gambit",
  "Gamma Corps",
  "Gamora",
  "Gangbuster",
  "Ganymede",
  "Garganta",
  "Gargoyle",
  "Gargoyles",
  "Garia",
  "Garrison Kane",
  "Gateway",
  "Gauntlet",
  "Geiger",
  "Gemma",
  "Gene Sailors",
  "Generation X",
  "Genesis",
  "Genis-Vell",
  "George Stacy",
  "Gertrude",
  "Gertrude Yorkes",
  "Ghost",
  "Ghost Rider",
  "Giant Girl",
  "Giant-Man",
  "Gideon",
  "Git Hoskins",
  "Gladiator",
  "Glenn Talbot",
  "Glitter",
  "Glorian",
  "Glory",
  "Gloss",
  "Goblin Queen",
  "Godiva",
  "Golden Guardian",
  "Goliath",
  "Gorgon",
  "Gorilla Man",
  "Grace",
  "Grandmaster",
  "Graphics",
  "Gravity",
  "Great Lakes Avengers",
  "Green",
  "Green Arrow",
  "Green Goblin",
  "Green Lantern",
  "Gressill",
  "Grey Gargoyle",
  "Greymalkin",
  "Grim Reaper",
  "Groot",
  "Guardian",
  "Guardians of the Galaxy",
  "Guardsmen",
  "Guile",
  "Gung-Ho",
  "Gunslinger",
  "Guy",
  "Gwen",
  "Gwen Stacy",
  "Gypsy",
  "H.A.M.M.E.R.",
  "H.E.R.B.I.E.",
  "HYDRA",
  "Hairball",
  "Hal",
  "Half-Life",
  "Halo",
  "Hammerhead",
  "Hank",
  "Hank Pym",
  "Hannibal King",
  "Happy Hogan",
  "Harbinger",
  "Hardball",
  "Harley Davidson Cooper",
  "Harley Quinn",
  "Harpoon",
  "Harrier",
  "Harry Heck",
  "Harry Osborn",
  "Hate-Monger",
  "Haven",
  "Havok",
  "Hawk",
  "Hawkeye",
  "Hawkgirl",
  "Hawkman",
  "Hawkwoman",
  "Heather",
  "Hedge Knight",
  "Hellboy",
  "Hellcat",
  "Hellfire Club",
  "Hellion",
  "Hellions",
  "Helspont",
  "Hemingway",
  "Henry Peter Gyrich",
  "Hepzibah",
  "Hercules",
  "Heroes For Hire",
  "Hex",
  "High Evolutionary",
  "Hindsight Lad",
  "Hiroim",
  "Hit",
  "Hitman",
  "Hitomi Sakuma",
  "Hobgoblin",
  "Hobogoblin",
  "Holocaust",
  "Holy",
  "Homer Simpson",
  "Hooded",
  "Hope Summers",
  "Horridus",
  "Howard Saint",
  "Howard The Duck",
  "Hulk",
  "Hulkling",
  "Human Cannonball",
  "Human Fly",
  "Human Robot",
  "Human Target",
  "Human Torch",
  "Humbug",
  "Huntara",
  "Huntress",
  "Husk",
  "Hussar",
  "Hydra",
  "Hydro-Man",
  "Hyperion",
  "Hypno-Hustler",
  "Ice",
  "Icemaiden",
  "Iceman",
  "Ichigo",
  "Ikaris",
  "Illuminati",
  "Ilyana Rasputin",
  "Imp",
  "Imperfects",
  "Imperial Guard",
  "Impossible Man",
  "Impulse",
  "In-Betweener",
  "Incredible Hulk",
  "Indigo",
  "Inertia",
  "Infant Terrible",
  "Infragirl",
  "Inhumans",
  "Ink",
  "Insect",
  "Invaders",
  "Invisible",
  "Invisible Woman",
  "Iron",
  "Iron Cross Army",
  "Iron Fist",
  "Iron Lad",
  "Iron Man",
  "Iron Monger",
  "Iron Patriot",
  "Ironclad",
  "J. Jonah Jameson",
  "Jack Flag",
  "Jack Murdock",
  "Jack O' Lantern",
  "Jack Power",
  "Jackal",
  "Jackpot",
  "Jade",
  "Jake",
  "Jakita",
  "James Buchanan Barnes",
  "James Howlett",
  "Jamie Braddock",
  "Jane Foster",
  "Jann",
  "Jarella",
  "Jasper Sitwell",
  "Jayna",
  "Jazinda",
  "Jean",
  "Jean Grey",
  "Jem",
  "Jennifer",
  "Jennifer Smith",
  "Jenny",
  "Jericho",
  "Jeryn Hogarth",
  "Jess",
  "Jesse",
  "Jessica",
  "Jessica Drew",
  "Jessica Jones",
  "Jet",
  "Jetstream",
  "Jigsaw",
  "Jimmy Woo",
  "Jinx",
  "Joan the Mouse",
  "Jocasta",
  "John Farson",
  "John Jameson",
  "John Porter",
  "John Wraith",
  "Johnny Blaze",
  "Johnny Storm",
  "Joker",
  "Jolt",
  "Jonah",
  "Jonni",
  "Joseph",
  "Joshua Kane",
  "Josiah X",
  "Joystick",
  "Jubilee",
  "Judomaster",
  "Juggernaut",
  "Jule Carpenter",
  "Julian Keller",
  "Jungle",
  "Juniper",
  "Junta",
  "Justice",
  "Justin Hammer",
  "KOS-MOS",
  "Ka-Zar",
  "Kabuki",
  "Kamandi",
  "Kang",
  "Kaoru",
  "Karate",
  "Karate Kid",
  "Karatecha",
  "Karen O'Malley",
  "Karen Page",
  "Karma",
  "Karnak",
  "Karolina",
  "Karolina Dean",
  "Kasumi",
  "Kat Farrell",
  "Katana",
  "Kate",
  "Kate Bishop",
  "Katie Power",
  "Katma",
  "Kelly",
  "Ken Ellis",
  "Kendra",
  "Khan",
  "Kid",
  "Kid Colt",
  "Killer Shrike",
  "Killmonger",
  "Killraven",
  "Kim",
  "Kimberly",
  "Kinetix",
  "King Bedlam",
  "King Cobra",
  "Kingpin",
  "Kinsey Walden",
  "Kismet",
  "Kitty",
  "Kitty Pryde",
  "Klaw",
  "Knockout",
  "Kole",
  "Komodo",
  "Korath",
  "Korg",
  "Korvac",
  "Kratha",
  "Kraven",
  "Kraven the Hunter",
  "Kree",
  "Krista Starr",
  "Kristin",
  "Kronos",
  "Krystala",
  "Kulan Gath",
  "Kumori",
  "Kyle",
  "Kylun",
  "La",
  "La Nuit",
  "Lady",
  "Lady Bullseye",
  "Lady Deathstrike",
  "Lady Mastermind",
  "Lady Shiva",
  "Lady Ursula",
  "Lady Vermin",
  "Ladyhawk",
  "Lagoon",
  "Lake",
  "Lamprey",
  "Landau",
  "Lanolin",
  "Laurel",
  "Lava-Man",
  "Lavagirl",
  "Layla",
  "Layla Miller",
  "Leader",
  "Leatherhead",
  "Leatherneck",
  "Leech",
  "Leeloo",
  "Legion",
  "Lenny Balinger",
  "Lenore",
  "Leo",
  "Leonardo",
  "Leopardon",
  "Leper Queen",
  "Lester",
  "Lethal Legion",
  "Lettuce",
  "Liberty",
  "Lieutenant Marcus Stone",
  "Lifeguard",
  "Lightning",
  "Lightning Lords of Nepal",
  "Lightspeed",
  "Lila Cheney",
  "Lilandra",
  "Lilith",
  "Lily Hollister",
  "Lime",
  "Lionheart",
  "Little",
  "Living Lightning",
  "Living Mummy",
  "Living Tribunal",
  "Liz",
  "Liz Osborn",
  "Lizard",
  "Loa",
  "Lobo",
  "Lockheed",
  "Lockjaw",
  "Logan",
  "Loki",
  "Loners",
  "Longshot",
  "Looker",
  "Lord Hawal",
  "Lord Tyger",
  "Lords of Avalon",
  "Loria",
  "Lorna Dane",
  "Luckman",
  "Lucky Pierre",
  "Lucy in the Sky",
  "Luke Cage",
  "Luminals",
  "Lyja",
  "Lynn",
  "M.O.D.A.M.",
  "M.O.D.O.G.",
  "M.O.D.O.K.",
  "Ma Gnuci",
  "Mac Gargan",
  "Mach IV",
  "Machine Man",
  "Mad Thinker",
  "Madame",
  "Madame Hydra",
  "Madame Masque",
  "Madame Web",
  "Maddog",
  "Madelyne Pryor",
  "Madripoor",
  "Madrox",
  "Maelstrom",
  "Maestro",
  "Magdalene",
  "Maggott",
  "Magik",
  "Maginty",
  "Magma",
  "Magneto",
  "Magus",
  "Maiden",
  "Major Mapleleaf",
  "Makkari",
  "Malcolm Colcord",
  "Malice",
  "Man-Thing",
  "Man-Wolf",
  "Mandarin",
  "Mandrill",
  "Mandroid",
  "Manhattan Guardian",
  "Manhunter",
  "Manitou",
  "Manta",
  "Mantis",
  "Marauders",
  "Marcus Van Sciver",
  "Maria Hill",
  "Mariko Yashida",
  "Marionette",
  "Marrina",
  "Marrow",
  "Marten Broadcloak",
  "Martian",
  "Martin Li",
  "Marvel",
  "Marvel Apes",
  "Marvel Boy",
  "Marvel Zombies",
  "Marvelman",
  "Marvex",
  "Mary",
  "Mary Jane Watson",
  "Mas",
  "Masada",
  "Masked Marvel",
  "Masque",
  "Master Chief",
  "Master Mold",
  "Mastermind",
  "Masters of Evil",
  "Mathemanic",
  "Matilda",
  "Matsu'o Tsurayaba",
  "Matthew Murdock",
  "Mattie Franklin",
  "Mauler",
  "Maverick",
  "Max",
  "Maxima",
  "Maximum",
  "Maximus",
  "May Parker",
  "Maya",
  "Medusa",
  "Mega Man",
  "Megatron",
  "Meggan",
  "Melaka",
  "Meltdown",
  "Menace",
  "Mentallo",
  "Mentor",
  "Mephisto",
  "Mephistopheles",
  "Mera",
  "Mercer",
  "Mercury",
  "Merry",
  "Mesmero",
  "Metal Master",
  "Metamorpho",
  "Meteorite",
  "Mia Dearden",
  "Michael Van Patrick",
  "Michaelangelo",
  "Micro/Macro",
  "Microbe",
  "Microchip",
  "Micromax",
  "Midnight",
  "Miek",
  "Mighty",
  "Mikhail Rasputin",
  "Millenium Guard",
  "Millie the Model",
  "Mimic",
  "Mindworm",
  "Mint",
  "Miracleman",
  "Mirage",
  "Misfit",
  "Miss",
  "Miss America",
  "Mister Fantastic",
  "Mister Fear",
  "Mister Freeze",
  "Mister Hyde",
  "Mister Sinister",
  "Misty",
  "Misty Knight",
  "Miyako",
  "Mockingbird",
  "Moira MacTaggert",
  "Mojo",
  "Mole Man",
  "Molecule Man",
  "Molly",
  "Molly Hayes",
  "Molly Von Richtofen",
  "Molten Man",
  "Momoko",
  "Mondo Gecko",
  "Mongoose",
  "Mongu",
  "Monster Badoon",
  "Monstress",
  "Moon Knight",
  "Moondragon",
  "Moonstar",
  "Moonstone",
  "Morbius",
  "Mordo",
  "Morg",
  "Morgan Stark",
  "Morlocks",
  "Morlun",
  "Morph",
  "Moth",
  "Mother Askani",
  "Mother-One",
  "Motormouth",
  "Mr. Bumpo",
  "Mr. Fantastic",
  "Mr. Fish",
  "Mr. Fixit",
  "Mr. Hyde",
  "Mr. Immortal",
  "Mr. Meugniot",
  "Mr. Negative",
  "Mr. Payback",
  "Mr. X",
  "Ms. Marvel",
  "Mulholland Black",
  "Multiple Man",
  "Musa",
  "Muskrat",
  "Mysterio",
  "Mystique",
  "Namor",
  "Namora",
  "Namorita",
  "Naoko",
  "Napoleon Bonafrog",
  "Natasha",
  "Natasha Romanoff",
  "Nayana",
  "Nebula",
  "Negative",
  "Nehzno",
  "Nekra",
  "Nelvana",
  "Nemesis",
  "Neon",
  "Network",
  "New Goblin",
  "New Mutants",
  "New Warriors",
  "New X-Men",
  "Newton Destine",
  "Next Avengers",
  "Nextwave",
  "Nick Fury",
  "Nico",
  "Nico Minoru",
  "Nicolaos",
  "Night",
  "Night Nurse",
  "Night Thrasher",
  "Nightcat",
  "Nightcrawler",
  "Nighthawk",
  "Nightmare",
  "Nightshade",
  "Nightstar",
  "Nightveil",
  "Nightwing",
  "Nikita",
  "Nikki",
  "Nimrod",
  "Niobe",
  "Nite",
  "Nite Owl",
  "Nitro",
  "Nocturne",
  "Nomad",
  "Norman Osborn",
  "Norrin Radd",
  "Northstar",
  "Nova",
  "Nuke",
  "Obadiah Stane",
  "Octobriana",
  "Odin",
  "Ogun",
  "Old Lace",
  "Omega Flight",
  "Omega Red",
  "Omega Sentinel",
  "Omega the Unknown",
  "Onslaught",
  "Onyx",
  "Oracle",
  "Ord",
  "Orion",
  "Orphan",
  "Orphan-Maker",
  "Otto Octavius",
  "Outlaw Kid",
  "Overlord",
  "Owl",
  "Owlman",
  "Owlwoman",
  "Ozymandias",
  "Paibok",
  "Paladin",
  "Panda Khan",
  "Pandemic",
  "Pantha",
  "PantyMan",
  "Paper Doll",
  "Parasite",
  "Patch",
  "Patriot",
  "Payback",
  "Penance",
  "Penguin",
  "Pepper Potts",
  "Pestilence",
  "Pet Avengers",
  "Pete Wisdom",
  "Peter Parker",
  "Peter Quill",
  "Phalanx",
  "Phantom",
  "Phantom Reporter",
  "Phil Sheldon",
  "Phoenix",
  "Photon",
  "Phyla-Vell",
  "Piledriver",
  "Pilgrim",
  "Pink",
  "Pip",
  "Pixie",
  "Plastic",
  "Plazm",
  "Poison",
  "Poison Ivy",
  "Polaris",
  "Post",
  "Power",
  "Power Man",
  "Power Pack",
  "Praxagora",
  "Preak",
  "Pretty Boy",
  "Pride",
  "Prima",
  "Prince of Orphans",
  "Princess",
  "Princess Powerful",
  "Prism",
  "Prodigy",
  "Proemial Gods",
  "Professor Monster",
  "Professor X",
  "Promethea",
  "Proteus",
  "Proudstar",
  "Prowler",
  "PsyNapse",
  "Psyche-Out",
  "Psycho-Man",
  "Psylocke",
  "Psynch",
  "Puck",
  "Pudding",
  "Puff Adder",
  "Puma",
  "Punisher",
  "Puppet Master",
  "Purifiers",
  "Purple Man",
  "Pyro",
  "Quasar",
  "Quasimodo",
  "Queen",
  "Queen Noir",
  "Quentin Quire",
  "Quicksilver",
  "Rachel Grey",
  "Rad",
  "Radioactive Man",
  "Rafael Vega",
  "Rage",
  "Raider",
  "Rainbow",
  "Rainmaker",
  "Rampage",
  "Randall",
  "Randall Flagg",
  "Random",
  "Raphael",
  "Raptor",
  "Rapture",
  "Rat King",
  "Rattler",
  "Ravage 2099",
  "Raven",
  "Ravenous",
  "Rawhide Kid",
  "Ray",
  "Ray Fillet",
  "Raza",
  "Reaper",
  "Reavers",
  "Red",
  "Red 9",
  "Red Ghost",
  "Red Hulk",
  "Red She-Hulk",
  "Red Shift",
  "Red Skull",
  "Red Wolf",
  "Redwing",
  "Reptil",
  "Rescue",
  "Retro Girl",
  "Revanche",
  "Reverse",
  "Rhea",
  "Rhino",
  "Rhodey",
  "Richard Dragon",
  "Richard Fisk",
  "Rick Jones",
  "Ricochet",
  "Rictor",
  "Riddler",
  "Riptide",
  "Risque",
  "River",
  "Roadblock",
  "Robbie Robertson",
  "Robert Baldwin",
  "Robin",
  "Robin Chapel",
  "Robin Hood",
  "Rocket",
  "Rocket Raccoon",
  "Rocket Racer",
  "Rockslide",
  "Rogue",
  "Roland Deschain",
  "Romulus",
  "Ronan",
  "Ronin",
  "Rorschach",
  "Rose",
  "Rouge",
  "Roughhouse",
  "Roulette",
  "Roxanne Simpson",
  "Roxy",
  "Rumble",
  "Rumiko Fujikawa",
  "Runaways",
  "Russian",
  "S.H.I.E.L.D.",
  "S.T.R.I.P.E.",
  "Sabra",
  "Sabretooth",
  "Sage",
  "Sailor",
  "Sakura",
  "Salacious Crumb",
  "Salem's Seven",
  "Sally Floyd",
  "Salo",
  "Samantha",
  "Samus",
  "Sandman",
  "Santa Claus",
  "Sara",
  "Saracen",
  "Sasquatch",
  "Satana",
  "Saturn",
  "Sauron",
  "Savage Land",
  "Savant",
  "Scalphunter",
  "Scarecrow",
  "Scarlet",
  "Scarlet Spider",
  "Scarlet Witch",
  "Scorpion",
  "Scourge",
  "Scourge of the Underworld",
  "Scrambler",
  "Scream",
  "Screwball",
  "Sebastian Shaw",
  "Secret",
  "Secret Warriors",
  "Selene",
  "Senator Kelly",
  "Sentinel",
  "Sentinels",
  "Sentry",
  "Sepulchre",
  "Ser Duncan",
  "Serpent Society",
  "Serpentor",
  "Sersi",
  "Shadow",
  "Shadow King",
  "Shadowcat",
  "Shadoweyes",
  "Shadu the Shady",
  "Shakti",
  "Shalla-bal",
  "Shaman",
  "Shamrock",
  "Shane Yamada-Jones",
  "Shang-Chi",
  "Shanna",
  "Shanna the She-Devil",
  "Shape",
  "Shard",
  "Sharon Carter",
  "Sharon Ventura",
  "Shatterstar",
  "Shazam",
  "She-Dragon",
  "She-Hulk",
  "She-Ra",
  "She-Thing",
  "She-Venom",
  "SheZow",
  "Sheena",
  "Shen",
  "Sheva Callister",
  "Shi",
  "Shi'Ar",
  "Shikari",
  "Shining",
  "Shinko Yamashiro",
  "Shinobi Shaw",
  "Shiva",
  "Shiver Man",
  "Shocker",
  "Shockwave",
  "Shooting Star",
  "Shotgun",
  "Shredder",
  "Shriek",
  "Shrinking",
  "Siege",
  "Sif",
  "Silhouette",
  "Silk",
  "Silk Fever",
  "Silver",
  "Silver Centurion",
  "Silver Fox",
  "Silver Sable",
  "Silver Samurai",
  "Silver Surfer",
  "Silverclaw",
  "Silvermane",
  "Sin",
  "Sinann",
  "Sinister Six",
  "Sir Ram",
  "Siren",
  "Siryn",
  "Sister Grimm",
  "Skaar",
  "Skids",
  "Skin",
  "Skreet",
  "Skrulls",
  "Skullbuster",
  "Skyrocket",
  "Slapstick",
  "Slayback",
  "Sleeper",
  "Sleepwalker",
  "Slipstream",
  "Slyde",
  "Smasher",
  "Smiling Tiger",
  "Snake-Eyes",
  "Snowbird",
  "Solo",
  "Songbird",
  "Sons of the Tiger",
  "Spacker Dave",
  "Spartan",
  "Sparx",
  "Spawn",
  "Spectrum",
  "Speed",
  "Speed Demon",
  "Speedball",
  "Speedy",
  "Spellbinder",
  "Spencer Smythe",
  "Sphinx",
  "Spider",
  "Spider-Girl",
  "Spider-Ham",
  "Spider-Man",
  "Spider-Woman",
  "Spiral",
  "Spirit",
  "Spitfire",
  "Spoiler",
  "Spot",
  "Sprite",
  "Spy",
  "Spyke",
  "Squadron Sinister",
  "Squadron Supreme",
  "Squirrel",
  "Squirrel Girl",
  "Stacy",
  "Stacy X",
  "Star Brand",
  "Star-Lord",
  "Star-Spangled",
  "Starbolt",
  "Stardust",
  "Starfire",
  "Starfox",
  "Stargirl",
  "Starhawk",
  "Starjammers",
  "Stark Industries",
  "Starwoman",
  "Stature",
  "Steel",
  "Steel Serpent",
  "Stella",
  "Stellaris",
  "Stepford",
  "Stepford Cuckoos",
  "Stephanie",
  "Stephanie de la Spiroza",
  "Stephen Strange",
  "Steve Rogers",
  "Stick",
  "Stilt-Man",
  "Stinger",
  "Stingray",
  "Stone Men",
  "Storm",
  "Stormtrooper",
  "Stranger",
  "Stripperella",
  "Strong Guy",
  "Stryfe",
  "Stunner",
  "Sub-Mariner",
  "Sue Storm",
  "Sugar Man",
  "Sumo",
  "Sun",
  "Sunfire",
  "Sunset Bain",
  "Sunspot",
  "Super Hero Squad",
  "Super-Adaptoid",
  "Super-Skrull",
  "Supergirl",
  "Supergran",
  "Superman",
  "Supernaut",
  "Superwoman",
  "Suprema",
  "Supreme Intelligence",
  "Surge",
  "Susan Delgado",
  "Swarm",
  "Sway",
  "Swift",
  "Switch",
  "Swordsman",
  "Sydney",
  "Sym",
  "Synch",
  "T'Challa",
  "Tag",
  "Talisman",
  "Talkback",
  "Talon",
  "Talos",
  "Tana Nile",
  "Tank",
  "Tara",
  "Tarantula",
  "Tarot",
  "Taskmaster",
  "Tattoo",
  "Tecna",
  "Ted Forrester",
  "Teenage Mutant Ninja Turtles",
  "Tempest",
  "Tempo",
  "Tenebrous",
  "Terra",
  "Terrax",
  "Terror",
  "Terry",
  "Texas Twister",
  "Thaddeus Ross",
  "Thanos",
  "The 198",
  "The Anarchist",
  "The Avengers",
  "The Call",
  "The Captain",
  "The Defenders",
  "The Enforcers",
  "The Executioner",
  "The Fallen",
  "The Fury",
  "The Hand",
  "The Hood",
  "The Howling Commandos",
  "The Hunter",
  "The Initiative",
  "The Leader",
  "The Liberteens",
  "The Liberty Legion",
  "The Order",
  "The Phantom",
  "The Professor",
  "The Punisher",
  "The Question",
  "The Renegades",
  "The Rocketeer",
  "The Santerians",
  "The Shadow",
  "The Shiver Man",
  "The Spike",
  "The Stranger",
  "The Twelve",
  "The Wasp",
  "The Watchers",
  "Thena",
  "Thing",
  "Thor",
  "Thor Girl",
  "Thunder",
  "Thunderball",
  "Thunderbird",
  "Thunderbolt",
  "Thunderbolt Ross",
  "Thunderbolts",
  "Thundra",
  "Tick",
  "Tiger",
  "Tiger Shark",
  "Tiger's Beautiful Daughter",
  "Tigra",
  "Tim",
  "Timeslip",
  "Tinkerer",
  "Titaness",
  "Titania",
  "Titanium Man",
  "Toad",
  "Toad Men",
  "Tomas",
  "Tombstone",
  "Tomorrow Man",
  "Tony Stark",
  "Topaz",
  "Toro",
  "Toxin",
  "Traci",
  "Trauma",
  "Triathlon",
  "Triceraton",
  "Trini",
  "Triplicate",
  "Trish Tilby",
  "Triton",
  "Troia",
  "True Believers",
  "Tsunami",
  "Turbo",
  "Tusk",
  "Two-Face",
  "Two-Gun Kid",
  "Tyger Tiger",
  "Typhoid Mary",
  "Tyrannus",
  "Tyrant",
  "U-Foes",
  "U-Go Girl",
  "U.S. Agent",
  "Uatu The Watcher",
  "Ulik",
  "Ultimate Spider-Man",
  "Ultimates",
  "Ultimatum",
  "Ultimo",
  "Ultra",
  "Ultra-Adaptoid",
  "Ultragirl",
  "Ultravioletrrr",
  "Ultrawoman",
  "Ultron",
  "Umar",
  "Unicorn",
  "Union Jack",
  "Unknown Soldier",
  "Unus",
  "Valda",
  "Valeria Richards",
  "Valis",
  "Valkyrie",
  "Vampirella",
  "Vampiro",
  "Vance Astro",
  "Vanisher",
  "Vapor",
  "Varga",
  "Vargas",
  "Vector",
  "Veda",
  "Velocity",
  "Vengeance",
  "Venom",
  "Venus",
  "Venus Dee Milo",
  "Vera",
  "Vermin",
  "Vertigo",
  "Victor Mancha",
  "Victor Von Doom",
  "Vigilante",
  "Vin Gonzales",
  "Vindicator",
  "Violations",
  "Violator",
  "Violet",
  "Viper",
  "Virginia Dare",
  "Virtuous",
  "Vision",
  "Vivisector",
  "Vixen",
  "Vogue",
  "Void",
  "Voodoo",
  "Vulcan",
  "Vulture",
  "W.I.T.C.H:",
  "Wallflower",
  "Wallop",
  "Wallow",
  "War",
  "War Machine",
  "Warbird",
  "Warbound",
  "Warhawk",
  "Warlock",
  "Warpath",
  "Warren Worthington III",
  "Warstar",
  "Wasp",
  "Watchmen",
  "Weapon Omega",
  "Weapon X",
  "Web",
  "Wendell Rand",
  "Wendell Vaughn",
  "Wendigo",
  "Wendy",
  "Werewolf By Night",
  "Whiplash",
  "WhirlGirl",
  "Whirlwind",
  "Whistler",
  "White Queen",
  "White Tiger",
  "Whizzer",
  "Wiccan",
  "Widget",
  "Wild",
  "Wild Child",
  "Wild Pack",
  "Wildcat",
  "Wildside",
  "William Stryker",
  "Willow",
  "Wilson Fisk",
  "Wind",
  "Wind Dancer",
  "Winged",
  "Winter Soldier",
  "Witchblade",
  "Witchfire",
  "Wither",
  "Wolf Cub",
  "Wolfpack",
  "Wolfsbane",
  "Wolverine",
  "Wonder",
  "Wonder Man",
  "Wonder Woman",
  "Wong",
  "Word",
  "Wraith",
  "Wrecker",
  "Wrecking Crew",
  "Wyatt Wingfoot",
  "X-23",
  "X-51",
  "X-Babies",
  "X-Cutioner",
  "X-Cutioner's Song",
  "X-Factor",
  "X-Factor Investigations",
  "X-Force",
  "X-Man",
  "X-Men",
  "X-Ray",
  "X-Statix",
  "X.S.E.",
  "XJ-9",
  "XS",
  "Xavin",
  "Xena",
  "Xera",
  "Xi’an",
  "Xorn",
  "Yellow",
  "Yellow Claw",
  "Yellowjacket",
  "Young Avengers",
  "Young X-Men",
  "Zakuro",
  "Zaladane",
  "Zaran",
  "Zarda",
  "Zarek",
  "Zatanna",
  "Zatara",
  "Zealot",
  "Zeigeist",
  "Zemo",
  "Zodiak",
  "Zombie",
  "Zuras",
  "Zzzax"
];
