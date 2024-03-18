import 'package:permission_handler/permission_handler.dart';

class PermissionMangment {
  static Future<bool> storagePermission() async {
    final status = await Permission.storage.request();
    return status == PermissionStatus.granted;
  }

  static Future<bool> recordingPermission() async {
    final status = await Permission.microphone.request();
    return status == PermissionStatus.granted;
  }
}
