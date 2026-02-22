import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ritt/app/providers/client.dart';
import 'package:ritt/app/providers/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'redmine_client.g.dart';

class RedmineClient extends http.BaseClient {
  final String userAgent = 'ritt - redmine issue time tracker';

  final http.Client _inner;

  final String? apiKey;

  RedmineClient(this._inner, this.apiKey);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (apiKey == null) {
      throw ArgumentError('Redmine API Key must be set!');
    }

    request.headers['user-agent'] = 'ritt';
    request.headers['Content-Type'] = 'application/json';
    request.headers['X-Redmine-API-Key'] = apiKey!;

    return _inner.send(request);
  }
}

@Riverpod(dependencies: [client, Settings])
RedmineClient redmineClient(Ref ref) {
  final client = ref.watch(clientProvider);
  final apiKey = ref.watch(settingsProvider.select((x) => x.redmineApiKey));

  return RedmineClient(client, apiKey);
}
