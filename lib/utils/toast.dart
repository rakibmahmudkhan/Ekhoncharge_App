import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:fluttertoast/fluttertoast.dart';

void eCustomToast({String? message}) {
  Fluttertoast.showToast(
    msg: message ?? '',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    fontSize: eMFontSize,
  );
}
