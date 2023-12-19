import 'package:intl/intl.dart';

extension StringExtension on String {
  bool get isValidEmail {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }

  bool get isValidPassword {
    return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,14}$').hasMatch(this);
  }

  int toInt() {
    return int.tryParse(this) ?? 0;
  }

  DateTime toDateTime([String format = 'yyyy.MM.dd']) {
    return DateFormat(format).parse(this);
  }
}
