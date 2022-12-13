import 'package:json_annotation/json_annotation.dart';

part 'ticks_sync.g.dart';

@JsonSerializable()
class TicksSync {
  final String? ticks;

  final int? subscribe;

  TicksSync({
    this.ticks,
    this.subscribe,
  });

  factory TicksSync.fromJson(Map<String, dynamic> json) =>
      _$TicksSyncFromJson(json);

  Map<String, dynamic> toJson() => _$TicksSyncToJson(this);
}
