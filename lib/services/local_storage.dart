import 'dart:convert';
import 'dart:io';

import 'package:grocery_list_app/services/database.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage extends DB {
  LocalStorage();

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> getFile(String relativePath) async {
    final path = await _localPath;
    return File('$path/$relativePath');
  }

  @override
  dynamic load() async {
    final file = await getFile('users.json');
    return jsonDecode(await file.readAsString());
  }

  @override
  Future<void> save(dynamic jsonEncodableClass) async {
    final file = await getFile('users.json');

    await file.writeAsString(
      const JsonEncoder().convert(jsonEncodableClass),
    );
  }
}
