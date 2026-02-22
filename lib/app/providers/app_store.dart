import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ritt/pluto_grid/models/pluto_grid_state.dart';
import 'package:ritt/app/models/timer.dart';
import 'package:ritt/app/models/user_settings.dart';
import 'package:ritt/app/providers/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_store.g.dart';

const storeIdPrefix = 'app-store';

class StoreKey<T> {
  final String id;
  final T Function(dynamic json) fromJson;
  final dynamic Function(T value) toJson;

  const StoreKey(this.id, {required this.fromJson, required this.toJson});

  String getStoreId() {
    return '$storeIdPrefix.$id';
  }
}

class AppKeys {
  static final userSettings = StoreKey<UserSettings>(
    'user-settings',
    fromJson: (json) => UserSettings.fromJson(json),
    toJson: (settings) => settings.toJson(),
  );

  static final timers = StoreKey<List<Timer>>(
    'timers',
    fromJson: (json) => (json as List).map((x) => Timer.fromJson(x)).toList(),
    toJson: (timers) => timers.map((x) => x.toJson()).toList(),
  );

  static final plutoGridState = StoreKey<PlutoGridState>(
    'pluto-grid-state',
    fromJson: (json) => PlutoGridState.fromJson(json),
    toJson: (state) => state.toJson(),
  );
}

class AppStore {
  const AppStore(this._prefs);

  final SharedPreferences _prefs;

  T? read<T>(StoreKey<T> storeKey) {
    final raw = _prefs.getString(storeKey.getStoreId());

    if (raw == null || raw.isEmpty) {
      return null;
    }

    final decoded = jsonDecode(raw);
    try {
      return storeKey.fromJson(decoded);
    } catch (e) {
      debugPrint(e.toString());
      // TODO - Handle/Log exception;
      return null;
    }
  }

  Future<void> write<T>(StoreKey<T> storeKey, T value) async {
    final key = storeKey.getStoreId();
    final raw = storeKey.toJson(value);

    await _prefs.setString(key, jsonEncode(raw));
  }

  Future<void> remove(StoreKey storeKey) async {
    await _prefs.remove(storeKey.getStoreId());
  }
}

@Riverpod(dependencies: [])
AppStore appStore(Ref ref) {
  final prefs = ref.watch(sharedPreferencesProvider);

  return AppStore(prefs);
}
