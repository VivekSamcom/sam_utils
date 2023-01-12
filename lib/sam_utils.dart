library sam_utils;

import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

printLog(String strLogMessage, [String? strTag]) {
  if (strLogMessage.isNotEmpty) {
    debugPrint("----------> LOG${_getTagMessage(strTag)} <----------");
    debugPrint("| $strLogMessage");
  }
}

String _getTagMessage(String? strTag) {
  if (strTag != null && strTag.isNotEmpty) {
    return " : ( $strTag )";
  }
  return "";
}

bool isAppRunningOnWeb() {
  return kIsWeb;
}

extension EmptyPadding on num {
  SizedBox get sizedBoxH => SizedBox(height: toDouble());

  SizedBox get sizedBoxW => SizedBox(width: toDouble());
}

class SamUtils {
  bool isEmailValid(String? email) {
    if (email != null) {
      return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(email);
    } else {
      return false;
    }
  }

  Future<bool> isNetworkConnected() async {
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      printLog("utils : Connectivity result : ${connectivityResult.toString()}");
      return false;
    } else {
      return true;
    }
  }

  String getTextEditingString(TextEditingController? controller) {
    if (controller != null && controller.text.toString().trim().isNotEmpty) {
      return controller.text.toString().trim();
    }
    return "";
  }

  bool isTextEditingEmpty(TextEditingController? controller) {
    if (controller == null || controller.text.toString().trim().isEmpty) {
      return true;
    }
    return false;
  }

  double getScreenWidth(BuildContext? buildContext) {
    double screenWidth = 0;
    if (buildContext != null) {
      try {
        // ignore: unnecessary_null_comparison
        if (MediaQuery.of(buildContext).size.width != null) screenWidth = MediaQuery.of(buildContext).size.width;
      } catch (ex) {
        printLog("EX. UTILS While getting screen width... : ${ex.toString()}");
        screenWidth = 0;
      }
    }
    return screenWidth;
  }

  // This method converts any type to double
  static double parseDynamicToDouble(dynamic dAmount) {
    double returnAmount = 0.00;
    String strAmount;
    try {
      if (dAmount == null) return 0.00;
      strAmount = dAmount.toString();
      if (strAmount.isNotEmpty) {
        if (strAmount.contains(",")) {
          strAmount = strAmount.replaceAll(",", "");
        }
        returnAmount = double.tryParse(strAmount) ?? 0.00;
      } else {
        returnAmount = 0.00;
      }
      return returnAmount;
    } catch (e) {
      printLog("ERROR : While convert to double : ${e.toString()}");
      return 0.00;
    }
  }

  String getPlatformName() {
    if (Platform.isAndroid) {
      return "android";
    } else if (Platform.isIOS) {
      return "iOS";
    } else if (Platform.isMacOS) {
      return "macOS";
    } else if (Platform.isWindows) {
      return "windows";
    } else if (Platform.isLinux) {
      return "linux";
    } else if (Platform.isFuchsia) {
      return "fuchsia";
    } else if (kIsWeb) {
      return "web";
    } else {
      return "NOP";
    }
  }

  double getAppBarImageSize() {
    try {
      return AppBar().preferredSize.height - 28;
    } catch (ex) {
      printLog("ERROR : While get size : ${ex.toString()}");
      return 30;
    }
  }

  static const String ddMMyyyy = "dd-MM-yyyy";
  static const String MMddyyyy = "MM/dd/yyyy";
  static const String MMddyyyy_hhmma = "MM/dd/yyyy hh:mma";
  static const String ddMMyyyy_HHmmss = "dd-MM-yyyy HH:mm:ss";
  static const String HHmm = "HH:mm";
  static const int defaultTime = 111111;

  String getCurrentDateTime() {
    return DateFormat(ddMMyyyy_HHmmss).format(DateTime.now());
  }

  String getCurrentDate() {
    return DateFormat(ddMMyyyy).format(DateTime.now());
  }

  String getCurrentTime() {
    return DateFormat(HHmm).format(DateTime.now());
  }

  int getCurrentTimeStamp() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  int millisecondToHours(int milliseconds) {
    try {
      int seconds = (((milliseconds / 1000) % 60).round());
      int minutes = ((milliseconds / (1000 * 60)) % 60).round();
      int hours = ((milliseconds / (1000 * 60 * 60)) % 24).round();
      printLog("$hours : $minutes : $seconds . $milliseconds");
      return hours;
    } catch (ex) {
      printLog("ERROR : While convert millisecond to hours : ${ex.toString()}");
      return defaultTime;
    }
  }
}

