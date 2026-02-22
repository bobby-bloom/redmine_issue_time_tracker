// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redmine_time_entry_activities.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(timeEntryActitivies)
final timeEntryActitiviesProvider = TimeEntryActitiviesFamily._();

final class TimeEntryActitiviesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RedmineThing>>,
          List<RedmineThing>,
          FutureOr<List<RedmineThing>>
        >
    with
        $FutureModifier<List<RedmineThing>>,
        $FutureProvider<List<RedmineThing>> {
  TimeEntryActitiviesProvider._({
    required TimeEntryActitiviesFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'timeEntryActitiviesProvider',
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
  String debugGetCreateSourceHash() => _$timeEntryActitiviesHash();

  @override
  String toString() {
    return r'timeEntryActitiviesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<RedmineThing>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<RedmineThing>> create(Ref ref) {
    final argument = this.argument as int;
    return timeEntryActitivies(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TimeEntryActitiviesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$timeEntryActitiviesHash() =>
    r'88a7a8d9320e3da1a0cc1ae5fed31739b03e7123';

final class TimeEntryActitiviesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<RedmineThing>>, int> {
  TimeEntryActitiviesFamily._()
    : super(
        retry: null,
        name: r'timeEntryActitiviesProvider',
        dependencies: <ProviderOrFamily>[redmineServiceProvider],
        $allTransitiveDependencies: <ProviderOrFamily>{
          TimeEntryActitiviesProvider.$allTransitiveDependencies0,
          TimeEntryActitiviesProvider.$allTransitiveDependencies1,
          TimeEntryActitiviesProvider.$allTransitiveDependencies2,
          TimeEntryActitiviesProvider.$allTransitiveDependencies3,
          TimeEntryActitiviesProvider.$allTransitiveDependencies4,
        },
        isAutoDispose: false,
      );

  TimeEntryActitiviesProvider call(int projectId) =>
      TimeEntryActitiviesProvider._(argument: projectId, from: this);

  @override
  String toString() => r'timeEntryActitiviesProvider';
}
