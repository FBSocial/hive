part of hive_flutter;

/// Flutter extensions for Hive.
extension HiveX on HiveInterface {
  /// Initializes Hive with the path from [getApplicationDocumentsDirectory].
  ///
  /// You can provide a [subDir] where the boxes should be stored.
  Future<void> initFlutter(
      [String? subDir,
      HiveStorageBackendPreference backendPreference =
          HiveStorageBackendPreference.native]) async {
    WidgetsFlutterBinding.ensureInitialized();

    String? path;
    if (!kIsWeb) {
      var appDir = await getApplicationDocumentsDirectory();
      path = path_helper.join(appDir.path, subDir);
    }
    if (Platform.isMacOS) {
      // macos下将目录改为ApplicationSupport
      var appDir = await getApplicationSupportDirectory();
      path = path_helper.join(appDir.path, subDir);
    }
    init(
      path,
      backendPreference: backendPreference,
    );
  }
}
