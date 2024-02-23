import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';

class DateAndTimeService {
  Future<DateTime?> showTimerPicker(BuildContext context) async {
    final result = await showBoardDateTimePicker(
      context: context,
      pickerType: DateTimePickerType.datetime,
    );
    return result;
  }

  int convertTomillisecondsSinceEpoch(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }

  DateTime convertToDateTime(int millisecondsSinceEpoch) {
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }
  

  String convertToString(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  }
}
