import 'package:freezed_annotation/freezed_annotation.dart';

part 'redmine_thing.freezed.dart';
part 'redmine_thing.g.dart';

@freezed
abstract class RedmineThing with _$RedmineThing {
  const factory RedmineThing({required int id, required String name}) =
      _RedmineThing;

  factory RedmineThing.fromJson(Map<String, dynamic> json) =>
      _$RedmineThingFromJson(json);
}
