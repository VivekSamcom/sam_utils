library sam_utils;

import 'package:flutter/material.dart';

import 'log_type_enum.dart';

const bool isPrintLog = true;

printLog(String strLogMessage, [LogTypeEnum? notificationType, String? strTag]) {
  if (isPrintLog && strLogMessage.isNotEmpty) {
    if (notificationType != null) {
      if (notificationType == LogTypeEnum.TYPE_ERROR) {
        debugPrint("----------> ERROR LOG${_getTagMessage(strTag)} <----------");
        debugPrint("| ###> $strLogMessage");
      } else if (notificationType == LogTypeEnum.TYPE_NULL) {
        debugPrint("----------> LOG NULL${_getTagMessage(strTag)} <----------");
        debugPrint("| ???> $strLogMessage");
      } else if (notificationType == LogTypeEnum.TYPE_SIMPLE) {
        debugPrint("----------> LOG${_getTagMessage(strTag)} <----------");
        debugPrint("| ^^^> $strLogMessage");
      } else if (notificationType == LogTypeEnum.TYPE_WITH_TAG) {
        debugPrint("----------> LOG${_getTagMessage(strTag)} <----------");
        debugPrint("| $strLogMessage");
      } else {
        debugPrint("| $strLogMessage");
      }
    } else {
      debugPrint("| $strLogMessage");
    }
  }
}

String _getTagMessage(String? strTag) {
  if (strTag != null && strTag.isNotEmpty) {
    return " : ( $strTag )";
  }
  return "";
}
