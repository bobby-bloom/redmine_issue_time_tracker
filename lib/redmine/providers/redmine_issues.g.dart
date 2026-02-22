// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redmine_issues.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RedmineIssues)
final redmineIssuesProvider = RedmineIssuesProvider._();

final class RedmineIssuesProvider
    extends $AsyncNotifierProvider<RedmineIssues, List<RedmineIssuesResponse>> {
  RedmineIssuesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'redmineIssuesProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[redmineServiceProvider],
        $allTransitiveDependencies: <ProviderOrFamily>{
          RedmineIssuesProvider.$allTransitiveDependencies0,
          RedmineIssuesProvider.$allTransitiveDependencies1,
          RedmineIssuesProvider.$allTransitiveDependencies2,
          RedmineIssuesProvider.$allTransitiveDependencies3,
          RedmineIssuesProvider.$allTransitiveDependencies4,
        },
      );

  static final $allTransitiveDependencies0 = redmineServiceProvider;
  static final $allTransitiveDependencies1 =
      RedmineServiceProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      RedmineServiceProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 =
      RedmineServiceProvider.$allTransitiveDependencies2;
  static final $allTransitiveDependencies4 =
      RedmineServiceProvider.$allTransitiveDependencies3;

  @override
  String debugGetCreateSourceHash() => _$redmineIssuesHash();

  @$internal
  @override
  RedmineIssues create() => RedmineIssues();
}

String _$redmineIssuesHash() => r'a66601a6682f52f9862a31159859ed37587c18bb';

abstract class _$RedmineIssues
    extends $AsyncNotifier<List<RedmineIssuesResponse>> {
  FutureOr<List<RedmineIssuesResponse>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<RedmineIssuesResponse>>,
              List<RedmineIssuesResponse>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<RedmineIssuesResponse>>,
                List<RedmineIssuesResponse>
              >,
              AsyncValue<List<RedmineIssuesResponse>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
