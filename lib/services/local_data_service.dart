import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalDataService {
  static const String kLocalData = 'local_data';

  Future<String> _getCachePath() async {
    final directory = await getApplicationCacheDirectory();
    return directory.path;
  }

  bool get isInit => _isInit;
  bool _isInit = false;
  Future<void> init() async {
    if (_isInit) return;
    final String dirPath = await _getCachePath();
    final String path = '$dirPath/$kLocalData';
    Hive.init(path);
    await Hive.openBox(kLocalData);
    _isInit = true;
  }

  // Guarda un valor en la caja de datos local
  Future<void> saveToBox<T>(String name, String key, T data) async {
    var box = await Hive.openBox<T>(name);
    await box.put(key, data);
  }

  // Obtiene un valor de la caja de datos local
  Future<T?> getFromBox<T>(String name, String key) async {
    var box = await Hive.openBox<T>(name);
    return box.get(key);
  }

  // Obtiene todos los valores de la caja de datos local
  Future<List<T>> getAllFromBox<T>(String name) async {
    var box = await Hive.openBox<T>(name);
    return box.values.toList();
  }

  // Elimina un valor de la caja de datos local
  Future<void> deleteFromBox<T>(String name, String key) async {
    var box = await Hive.openBox<T>(name);
    await box.delete(key);
  }

  // Elimina todos los valores de la caja de datos local
  Future<void> clearBox<T>(String name) async {
    var box = await Hive.openBox<T>(name);
    await box.clear();
  }

  // Registra un adaptador en la caja de datos local
  Future<void> registerAdapterBox<T>(TypeAdapter<T> adapter) async {
    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter(adapter);
    }
  }
}
