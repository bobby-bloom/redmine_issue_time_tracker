// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redmine_issue.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(redmineIssue)
final redmineIssueProvider = RedmineIssueFamily._();

final class RedmineIssueProvider
    extends
        $FunctionalProvider<
          AsyncValue<RedmineIssue?>,
          RedmineIssue?,
          FutureOr<RedmineIssue?>
        >
    with $FutureModifier<RedmineIssue?>, $FutureProvider<RedmineIssue?> {
  RedmineIssueProvider._({
    required RedmineIssueFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'redmineIssueProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
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
  String debugGetCreateSourceHash() => _$redmineIssueHash();

  @override
  String toString() {
    return r'redmineIssueProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<RedmineIssue?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RedmineIssue?> create(Ref ref) {
    final argument = this.argument as int;
    return redmineIssue(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RedmineIssueProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$redmineIssueHash() => r'9dc08942c43ab1352b3d271b500a01bd7efdbae0';

final class RedmineIssueFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<RedmineIssue?>, int> {
  RedmineIssueFamily._()
    : super(
        retry: null,
        name: r'redmineIssueProvider',
        dependencies: <ProviderOrFamily>[redmineServiceProvider],
        $allTransitiveDependencies: <ProviderOrFamily>{
          RedmineIssueProvider.$allTransitiveDependencies0,
          RedmineIssueProvider.$allTransitiveDependencies1,
          RedmineIssueProvider.$allTransitiveDependencies2,
          RedmineIssueProvider.$allTransitiveDependencies3,
          RedmineIssueProvider.$allTransitiveDependencies4,
        },
        isAutoDispose: false,
      );

  RedmineIssueProvider call(int issueId) =>
      RedmineIssueProvider._(argument: issueId, from: this);

  @override
  String toString() => r'redmineIssueProvider';
}
