import 'package:ritt/app/models/user_settings.dart';
import 'package:ritt/app/providers/app_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings.g.dart';

@Riverpod(dependencies: [appStore])
class Settings extends _$Settings {
  static final storeKey = AppKeys.userSettings;

  @override
  UserSettings build() {
    final appStore = ref.watch(appStoreProvider);

    return appStore.read(storeKey) ?? UserSettings();
  }

  void setrunMultipleTimersSimultaneously(bool allow) {
    state = state.copyWith(runMultipleTimersSimultaneously: allow);

    _saveState();
  }

  void setRedmineApiKey(String? apiKey) {
    state = state.copyWith(redmineApiKey: apiKey);

    _saveState();
  }

  void setRedmineHost(String? host) {
    state = state.copyWith(redmineHost: host);

    _saveState();
  }

  void setState(UserSettings Function(UserSettings settings) cb) {
    state = cb(state);

    _saveState();
  }

  void _saveState() {
    ref.read(appStoreProvider).write(storeKey, state);
  }
}
