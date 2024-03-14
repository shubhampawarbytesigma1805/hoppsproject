// import 'package:hive/hive.dart';
// import 'package:hoops/utils/logger/logger_api_provider.dart';
// import 'package:hoops/utils/secure/hive_pref.dart';
// Box<dynamic>? encryptedBox;
// HivePreference hiveInstance = HivePreference();
// LoggerProvider loggerProvider = LoggerProvider();
// bool isDemoMode = false;
// bool isCalledExpired = false;
// bool isDark = false;
// bool isTrainer = false;
// String? loggedInEmail;
// String? username = "";
// String? profileImage = "";
// String? terms;
// String? privacy;
// String? help;
// enum PageTypeMode { about, faq, help, terms, privacy }

// bool checkAPIStatus(String? status) {
//   if (status == '1') {
//     return true;
//   } else {
//     return false;
//   }
// }


// bool isValidEmail(String email) {
//   final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
//   return emailRegex.hasMatch(email);
// }

// bool isValidPassWord(String password) {
//   final RegExp passwordRegex = RegExp(
//       r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
//   return passwordRegex.hasMatch(password);
// }
