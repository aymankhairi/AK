import 'dart:io';
import 'dart:math';

import 'package:path_provider/path_provider.dart';

class StorageMangment {
  static makeDirectory({required String dirName}) async {
    final List<Directory>? directory =
        await getExternalStorageDirectories(type: StorageDirectory.podcasts);
    final _formattedDirName = '/$dirName/';

    final Directory _newDir =
        await Directory(directory!.first.path + _formattedDirName).create();
    return _newDir.path;
  }

  static get getAudioDir async => await makeDirectory(dirName: 'recordings');

  static String createRecordAudioPath(
          {required String dirpath, required String fileName}) =>
      """$dirpath${fileName.substring(0, min(fileName.length, 100))}_${DateTime.now()}.aac""";
}
