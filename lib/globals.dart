import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class Globals {
  final imagesDir = 'assets/images/';
  final appMainColor = Color(0xFF4C71F2);
  final secondryColor = Color(0xFF9587E8);
  final accentColor = Color(0xFFE1ECFE);
  final grayColor = Colors.grey as Color; //Color(0xFFCCCBD1);
  final apiUrl = "https://www.development-q5nzhaa-sb26hc2y3xm26.uk-1.platformsh.site/";
  String currLang = "en";

  // Not the right place to put strings here but the main aim is
  // to keep strings separate from other app code so
  // can pull out easily later for proper localization implementation.
  final strings = {
    "en": {
      "location": "Location",
      "whatWanted": "What do you want?",
      "searchHint": "Search addres, city or location",
      "buy": "Buy",
      "sell": "Sell",
      'rent': 'Rent',
      'homesNearby': 'Home For Sale Near You',
      'trending': 'Trending'
    }
  };

  String t(String key) => strings[currLang]?[key] as String;
}

var globals = Globals();
