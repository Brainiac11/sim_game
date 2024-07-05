import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'preferences_notifier.g.dart';

@riverpod
Future<SharedPreferences> prefs(PrefsRef ref) {
  return SharedPreferences.getInstance();
}
