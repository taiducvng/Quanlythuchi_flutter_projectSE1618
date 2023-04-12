import 'package:flutter/material.dart';

List<CountryMap> getLocales() => [
      CountryMap("US Dollar", const Locale('en')),

      CountryMap("Indonesia ", const Locale('id')),
      CountryMap("Vietnam Dong", const Locale('vi')),
      // CountryMap("Lebanese Pound", const Locale('ar-lb')),
      // CountryMap("Taiwan Dollar", const Locale('zh-tw')),
      // CountryMap("Sri Lanka Rupee", const Locale('si')),
      // CountryMap("Pakistan Rupee", const Locale('ur')),
      // CountryMap("Swiss Franc", const Locale('fr_CH')),
      // CountryMap("Egyptian Pound", const Locale('ar_EG')),
      // CountryMap("Brazilian Real", const Locale('pt')),
      // CountryMap("Russian Ruble", const Locale('ru')),
      // CountryMap("Chinese Yuan", const Locale('zh')),
      // CountryMap("Australia Dollar", const Locale('en_AU')),
      // CountryMap("Canadian Dollar", const Locale('en_CA')),
      // CountryMap("British Pound", const Locale('en_GB')),
      // CountryMap("Swedish Krona", const Locale('sv')),
      // CountryMap("Iranian Rial", const Locale('fa')),
      // CountryMap("South African Rand", const Locale('zu')),
      // CountryMap("New Taiwan dollar", const Locale('zh_TW')),
      // CountryMap("Ethiopian Birr", const Locale('am')),
      CountryMap("Singapore Dollar", const Locale('en_SG')),
    ];

class CountryMap {
  final String name;
  final Locale locale;

  CountryMap(this.name, this.locale);
}
