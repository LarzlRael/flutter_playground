part of 'utils.dart';

String converTime(DateTime? time, {String format = 'dd/MM/yyyy HH:mm'}) {
  if (time != null) {
    final dateFormat = DateFormat(format);
    return dateFormat.format(time);
  } else {
    return '';
  }
}
