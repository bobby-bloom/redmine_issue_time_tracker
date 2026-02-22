import 'package:pluto_grid/pluto_grid.dart';
import 'package:ritt/pluto_grid/models/pluto_grid_column_state.dart';

class PlutoGridUtils {
  static Map<String, bool> saveRowGroupExpandedState(
    PlutoGridStateManager stateManager,
  ) {
    final expandedState = <String, bool>{};

    for (final row in stateManager.iterateAllRowGroup) {
      if (row.type.isGroup) {
        final rowKey = row.key.toString();
        expandedState[rowKey] = row.type.group.expanded;
      }
    }

    return expandedState;
  }

  static void restoreRowGroupExpandedState(
    PlutoGridStateManager stateManager,
    Map<String, bool> expandedState,
  ) {
    for (final row in stateManager.iterateAllRowGroup.toList()) {
      if (row.type.isGroup) {
        final rowKey = row.key.toString();
        final shouldBeExpanded = expandedState[rowKey] ?? false;

        if (row.type.group.expanded != shouldBeExpanded) {
          stateManager.toggleExpandedRowGroup(rowGroup: row, notify: false);
        }
      }
    }

    stateManager.notifyListeners();
  }

  static PlutoGridColumnState saveColumnState(PlutoColumn column, int order) {
    return PlutoGridColumnState(
      order: order,
      visible: !column.hide,
      width: column.width,
      frozen: column.frozen,
      sort: column.sort,
    );
  }

  static Map<String, PlutoGridColumnState> saveColumnIndexState(
    List<PlutoColumn> columns,
    int index,
  ) {
    final result = <String, PlutoGridColumnState>{};

    for (int i = 0; i < columns.length; i++) {
      final column = columns[i];
      final key = column.field;

      result[key] = saveColumnState(column, index);
    }

    return result;
  }

  static Map<String, PlutoGridColumnState> saveColumnsState(
    PlutoGridStateManager stateManager,
  ) {
    final result = <String, PlutoGridColumnState>{};

    final columns = stateManager.refColumns.originalList;

    int orderIdx = 0;
    for (int i = 0; i < columns.length; i++) {
      final column = columns[i];
      final key = column.field;

      final order = !column.hide ? stateManager.columnIndexes[orderIdx++] : -1;

      result[key] = saveColumnState(column, order);
    }

    return result;
  }

  static void restoreColumnState(
    PlutoGridStateManager stateManager,
    Map<String, PlutoGridColumnState> saved,
  ) {
    final columns = stateManager.refColumns.originalList.toList();

    for (final column in columns) {
      final key = column.field;
      final state = saved[key];
      if (state == null) {
        continue;
      }

      final shouldHide = !state.visible;
      if (column.hide != shouldHide) {
        stateManager.hideColumn(column, shouldHide);
      }

      if (column.width != state.width) {
        stateManager.resizeColumn(column, state.width);
      }

      if (column.frozen != state.frozen) {
        stateManager.toggleFrozenColumn(column, state.frozen);
      }

      if (state.sort.isAscending) {
        stateManager.sortAscending(column, notify: false);
      } else if (state.sort.isDescending) {
        stateManager.sortDescending(column, notify: false);
      }
    }

    final visibleSorted =
        columns.where((c) => (saved[c.field]?.order ?? -1) >= 0).toList()
          ..sort((a, b) {
            final aOrder = saved[a.field]!.order;
            final bOrder = saved[b.field]!.order;
            return aOrder.compareTo(bOrder);
          });

    for (
      int targetIndex = 0;
      targetIndex < visibleSorted.length;
      targetIndex++
    ) {
      final column = visibleSorted[targetIndex];
      final currentIndex = stateManager.refColumns.originalList.indexOf(column);
      if (currentIndex != targetIndex && currentIndex != -1) {
        stateManager.moveColumn(
          column: column,
          targetColumn: stateManager.refColumns.originalList[targetIndex],
        );
      }
    }

    stateManager.notifyListeners();
  }
}
