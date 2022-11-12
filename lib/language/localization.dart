import 'package:get/route_manager.dart';

import '../utils/my_string.dart';
import 'arabic.dart';
import 'english.dart';
import 'france.dart';


class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    ene: en,
    ara: ar,
    frf: fr,
  };
}