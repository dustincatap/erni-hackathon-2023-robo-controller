import 'package:injectable/injectable.dart';
import 'package:robo_controller/core/domain/models/result.dart';
import 'package:robo_controller/core/infrastructure/logging/logger.dart';
import 'package:robo_controller/core/presentation/view_models/initializable.dart';
import 'package:robo_controller/core/presentation/view_models/view_model.dart';
import 'package:robo_controller/domain/controller/models/command.dart';
import 'package:robo_controller/domain/controller/use_cases/send_command_use_case.dart';

@injectable
class ControlPadViewModel extends ViewModel implements Initializable {
  final SendCommandUseCase _sendCommandUseCase;
  final Logger _logger;

  final ValueNotifier<int> _speed = ValueNotifier<int>(0);
  final ValueNotifier<int> _direction = ValueNotifier<int>(0);

  ControlPadViewModel(this._sendCommandUseCase, this._logger) {
    _logger.logFor<ControlPadViewModel>();
  }

  ValueListenable<int> get speed => _speed;

  ValueListenable<int> get direction => _direction;

  @override
  Future<void> initialize() async {
    final Result<void> result = _sendCommandUseCase.connect();

    if (result is Failure<void>) {
      _logger.log(LogLevel.error, 'Failed to connect', result.exception, result.stackTrace);
    }
  }

  @override
  Future<void> dispose() async {
    final Result<void> result = await _sendCommandUseCase.disconnect();

    if (result is Failure<void>) {
      _logger.log(LogLevel.error, 'Failed to disconnect', result.exception, result.stackTrace);
    }

    super.dispose();
  }

  void onSpeedChanged(int value) {
    _speed.value = value;
    final Command command = SetSpeedCommand(value);
    _sendCommand(command);
  }

  void onDirectionChanged(int value) {
    _direction.value = value;
    final Command command = SetDirectionCommand(value);
    _sendCommand(command);
  }

  void _sendCommand(Command command) {
    final Result<void> result = _sendCommandUseCase.send(command);

    if (result is Failure<void>) {
      _logger.log(LogLevel.error, 'Failed to send command: $command', result.exception, result.stackTrace);
    }

    _logger.log(LogLevel.debug, 'Sent command: $command');
  }
}
