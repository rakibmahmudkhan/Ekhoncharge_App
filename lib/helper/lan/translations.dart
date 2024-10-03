import 'package:get/get.dart';
import 'bn.dart';
import 'en.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'bn': bn};
}
