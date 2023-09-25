import 'package:robo_controller/core/domain/models/json_serializable_object.dart';

abstract interface class Command {
  String get operation;

  String get valueKey;

  Object get value;
}

abstract class SerializableCommand extends JsonSerializableObject implements Command {
  const SerializableCommand({required this.operation, required this.valueKey, required this.value});

  @override
  final String operation;

  @override
  final String valueKey;

  @override
  final Object value;

  String get action => 'sendCommandToRaspberryPI';

  @override
  Map<String, dynamic> toJson() {
    return <String, Object>{
      'action': action,
      'command': '{"operation":"$operation","$valueKey":$value}',
    };
  }
}

class SetDirectionCommand extends SerializableCommand {
  const SetDirectionCommand(int angle) : super(operation: 'set_direction', valueKey: 'angle', value: angle);
}

class SetAutoPilotCommand extends SerializableCommand {
  const SetAutoPilotCommand({bool isAutoPilot = false})
      : super(operation: 'auto', valueKey: 'auto', value: isAutoPilot);
}

class SetSpeedCommand extends SerializableCommand {
  const SetSpeedCommand(int speed) : super(operation: 'set_speed', valueKey: 'speed', value: speed);
}

class SetHeadRotateCommand extends SerializableCommand {
  const SetHeadRotateCommand(int angle) : super(operation: 'set_head_rotate', valueKey: 'angle', value: angle);
}

class SetHeadTiltCommand extends SerializableCommand {
  const SetHeadTiltCommand(int angle) : super(operation: 'set_head_tilt', valueKey: 'angle', value: angle);
}

class SayCommand extends SerializableCommand {
  const SayCommand(String text) : super(operation: 'say', valueKey: 'text', value: text);
}
