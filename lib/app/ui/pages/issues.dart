import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart' hide PlutoGridState;
import 'package:ritt/app/ui/dialogs/async_value_dialog.dart';
import 'package:ritt/app/utils/debounce.dart';
import 'package:ritt/redmine/models/redmine_issue.dart';
import 'package:ritt/pluto_grid/providers/pluto_grid_state.dart';
import 'package:ritt/redmine/providers/redmine_issues.dart';
import 'package:ritt/app/theme/theme_extensions.dart';
import 'package:ritt/pluto_grid/utils/pluto_grid_utils.dart';
import 'package:collection/collection.dart';
import 'package:ritt/timer/models/timer.dart';
import 'package:ritt/timer/providers/timers.dart';

class IssuesPage extends HookConsumerWidget {
  const IssuesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final issuesProvider = ref.watch(redmineIssuesProvider);
    final issues = ref.read(redmineIssuesProvider.notifier).get();
    final timers = ref.watch(timersProvider);
    ref.watch(gridStateControllerProvider);

    ref.listen(redmineIssuesProvider, (_, state) => state.showError(context));

    final stateManager = useRef<PlutoGridStateManager?>(null);
    final resetKey = useState(0);

    useEffect(() {
      if (stateManager.value == null || issues.isEmpty) {
        return null;
      }

      saveGridState(ref, stateManager);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) {
          return;
        }

        stateManager.value?.removeAllRows();
        stateManager.value?.appendRows(buildRows(issues, timers));

        restoreGridState(ref, stateManager);
      });

      return null;
    }, [...issues, ...timers]);

    useEffect(() {
      final gridStateCtl = ref.read(gridStateControllerProvider.notifier);

      return () {
        final future = Future.delayed(Duration(microseconds: 1), () {
          saveGridStateOnDispose(gridStateCtl, stateManager);
        });

        Future.wait([future]);
      };
    }, const []);

    return LayoutBuilder(
      builder: (context, contraints) => Stack(
        children: [
          PlutoGrid(
            key: ValueKey(resetKey.value),
            columns: buildColumns(),
            rows: buildRows(issues, timers),
            configuration: PlutoGridConfiguration(
              style: PlutoGridStyleConfig(
                gridBorderRadius: context.radiusMD,
                gridBorderColor: Colors.transparent,
                gridBackgroundColor: context.colorScheme.surfaceContainerLow,
              ),
            ),
            mode: .select,
            onRowDoubleTap: (e) async =>
                await onRowDoubleTap(ref, e.row, stateManager),
            onLoaded: (e) {
              stateManager.value = e.stateManager;
              onPlutoLoaded(ref, e.stateManager, () {
                restoreGridState(ref, stateManager);
              });
            },
            createFooter: (_) => IssuesGridFooter(),
          ),
          if (issuesProvider.isLoading)
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.indigo.shade50.withAlpha(150),
              ),
              child: const Center(child: CircularProgressIndicator()),
            ),
          Positioned(
            bottom: context.paddingXXL.left,
            right: context.paddingXXL.left,
            child: Row(
              children: [
                FloatingActionButton(
                  tooltip: 'Reset grid configurations',
                  onPressed: () {
                    ref.read(gridStateControllerProvider.notifier).resetState();
                    resetKey.value++;
                  },
                  child: Icon(Icons.restart_alt),
                ),
                context.gapMD,
                FloatingActionButton(
                  tooltip: 'Fetch issues',
                  onPressed: () {
                    if (issuesProvider.isLoading) {
                      return;
                    }

                    ref.invalidate(redmineIssuesProvider);
                  },
                  child: Icon(Icons.download),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void saveGridState(
    WidgetRef ref,
    ObjectRef<PlutoGridStateManager?> stateManager,
  ) {
    if (stateManager.value == null) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final gridStateCtl = ref.read(gridStateControllerProvider.notifier);

      gridStateCtl.setColumnsState(
        PlutoGridUtils.saveColumnsState(stateManager.value!),
      );
      gridStateCtl.setRowGroupExpandend(
        PlutoGridUtils.saveRowGroupExpandedState(stateManager.value!),
      );
    });
  }

  void saveGridStateOnDispose(
    GridStateController gridStateCtl,
    ObjectRef<PlutoGridStateManager?> stateManager,
  ) {
    if (stateManager.value == null) {
      return;
    }

    gridStateCtl.setColumnsState(
      PlutoGridUtils.saveColumnsState(stateManager.value!),
    );
    gridStateCtl.setRowGroupExpandend(
      PlutoGridUtils.saveRowGroupExpandedState(stateManager.value!),
    );
  }

  void restoreGridState(
    WidgetRef ref,
    ObjectRef<PlutoGridStateManager?> stateManager,
  ) {
    if (stateManager.value == null) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final gridState = ref.read(gridStateControllerProvider);

      PlutoGridUtils.restoreRowGroupExpandedState(
        stateManager.value!,
        gridState.expandedRowGroups,
      );

      PlutoGridUtils.restoreColumnState(
        stateManager.value!,
        gridState.columnState,
      );
    });
  }

  Future<void> onRowDoubleTap(
    WidgetRef ref,
    PlutoRow row,
    ObjectRef<PlutoGridStateManager?> stateManager,
  ) async {
    if (row.type.isGroup) {
      return;
    }
    saveGridState(ref, stateManager);

    final timers = ref.read(timersProvider.notifier);
    final issues = ref.read(redmineIssuesProvider.notifier).get();

    final issueId = (row.cells['id']!.value as int);
    final issue = issues.where((x) => x.id == issueId).first;

    await timers.create(issueId: issueId, issue: issue);
  }

  void onPlutoLoaded(
    WidgetRef ref,
    PlutoGridStateManager stateManager,
    VoidCallback restoreCallback,
  ) {
    final gridStateCtl = ref.read(gridStateControllerProvider.notifier);

    stateManager.resizingChangeNotifier.addListener(() {
      // FIXME - not ideal, as the state is rebuilt with every change
      debounce(300, gridStateCtl.setColumnsState, [
        PlutoGridUtils.saveColumnsState(stateManager),
      ]);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      stateManager.setRowGroup(
        PlutoRowGroupByColumnDelegate(
          columns: [stateManager.columns[0]],
          showCount: true,
          enableCompactCount: true,
        ),
      );

      restoreCallback();
    });
  }

  List<PlutoColumn> buildColumns() {
    return [
      PlutoColumn(title: 'Status', field: 'status', type: .text(), width: 200),
      PlutoColumn(
        title: 'Timer',
        field: '_timer',
        type: .text(),
        width: 95,
        enableContextMenu: true,
      ),
      PlutoColumn(title: 'Issue', field: 'id', type: .text(), width: 75),
      PlutoColumn(
        title: 'Tracker',
        field: 'tracker',
        type: .text(),
        width: 120,
      ),
      PlutoColumn(
        title: 'Priority',
        field: 'priority',
        type: .text(),
        width: 90,
      ),
      PlutoColumn(
        title: 'Subject',
        field: 'subject',
        type: .text(),
        width: 260,
      ),
      PlutoColumn(
        title: 'Project',
        field: 'project',
        type: .text(),
        width: 200,
      ),
      PlutoColumn(
        title: 'Description',
        field: 'description',
        type: .text(),
        width: 260,
        hide: true,
      ),
      PlutoColumn(
        title: 'Start date',
        field: 'start_date',
        type: .date(format: 'dd.MM.yyyy'),
        width: 100,
        hide: true,
      ),
      PlutoColumn(
        title: 'Due date',
        field: 'due_date',
        type: .date(format: 'dd.MM.yyyy'),
        width: 100,
      ),
      PlutoColumn(
        title: 'Estimated hours',
        field: 'estimated_hours',
        type: .date(),
        width: 90,
        hide: true,
      ),
      PlutoColumn(
        title: 'Author',
        field: 'author',
        type: .text(),
        width: 120,
        hide: true,
      ),
      PlutoColumn(
        title: 'Assigned to',
        field: 'assigned_to',
        type: .text(),
        width: 130,
        hide: true,
      ),
      PlutoColumn(
        title: 'Updated on',
        field: 'updated_on',
        type: .date(format: 'dd.MM.yyyy'),
        width: 120,
        hide: true,
      ),
    ];
  }

  List<PlutoRow> buildRows(List<RedmineIssue> issues, List<Timer> timers) {
    return issues
        .map((i) => PlutoRow(type: .normal(), cells: getRowCells(i, timers)))
        .toList();
  }

  Map<String, PlutoCell> getRowCells(RedmineIssue issue, List<Timer> timers) {
    final matchedTimers = timers.where((t) => t.issueId == issue.id);

    final runningTimers = matchedTimers.where((x) => x.isRunning);

    var timerTxt = '⏲ ${matchedTimers.length}';

    if (runningTimers.isNotEmpty) {
      timerTxt = '$timerTxt / ▶ ${runningTimers.length}';
    }

    return {
      '_timer': PlutoCell(value: timerTxt),
      'id': PlutoCell(value: issue.id),
      'status': PlutoCell(value: issue.status.name),
      'tracker': PlutoCell(value: issue.tracker?.name),
      'priority': PlutoCell(value: issue.priority?.name),
      'subject': PlutoCell(value: issue.subject),
      'project': PlutoCell(value: issue.project.name),
      'description': PlutoCell(value: issue.description),
      'start_date': PlutoCell(value: issue.startDate),
      'due_date': PlutoCell(value: issue.dueDate),
      'estimated_hours': PlutoCell(value: issue.estimatedHours),
      'author': PlutoCell(value: issue.author?.name),
      'assigned_to': PlutoCell(value: issue.assignedTo?.name),
      'updated_on': PlutoCell(value: issue.updatedOn),
    };
  }
}

class IssuesGridFooter extends ConsumerWidget {
  const IssuesGridFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final issuesProvider = ref.watch(redmineIssuesProvider);
    final issues = ref.read(redmineIssuesProvider.notifier).get();

    final moreAvailable =
        issues.length < (issuesProvider.value?.firstOrNull?.totalCount ?? 0);

    return LayoutBuilder(
      builder: (_, size) {
        return SizedBox(
          width: size.maxWidth,
          height: 60,
          child: Container(
            color: context.colorScheme.primary,
            padding: context.paddingMD,
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  '${issues.length} of ${issuesProvider.value?.firstOrNull?.totalCount ?? 'unknown'}',
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.onPrimary,
                  ),
                ),
                if (moreAvailable)
                  TextButton(
                    style: TextButton.styleFrom(
                      overlayColor: context.colorScheme.primaryContainer,
                    ),
                    onPressed: () =>
                        ref.read(redmineIssuesProvider.notifier).loadNext(),
                    child: Row(
                      mainAxisAlignment: .center,
                      mainAxisSize: .min,
                      children: [
                        Icon(
                          Icons.download,
                          color: context.colorScheme.onPrimary,
                        ),
                        context.gapSM,
                        Text(
                          'More',
                          style: context.textTheme.labelLarge?.copyWith(
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
