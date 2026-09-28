import 'dart:io';

import 'package:path_provider/path_provider.dart';

class MapService {
  static Future<String> getTilePath() async {
    final dir = await getApplicationDocumentsDirectory();
    final tileDir = Directory('${dir.path}/tiles');

    if (!tileDir.existsSync()) {
      tileDir.createSync(recursive: true);
    }

    return tileDir.path;
  }
}
