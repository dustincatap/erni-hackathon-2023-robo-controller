import 'package:injectable/injectable.dart';
import 'package:robo_controller/core/domain/models/result.dart';
import 'package:robo_controller/domain/controller/models/command.dart';
import 'package:robo_controller/domain/controller/repositories/command_repository.dart';

abstract interface class SendCommandUseCase {
  Result<void> connect();

  Result<void> send(Command command);

  Future<Result<void>> disconnect();
}

@Injectable(as: SendCommandUseCase)
class SendCommandUseCaseImpl implements SendCommandUseCase {
  final CommandRepository _commandRepository;

  SendCommandUseCaseImpl(this._commandRepository);

  @override
  Result<void> connect() {
    try {
      _commandRepository.connect();
      return const Success<void>(null);
    } on Exception catch (ex, st) {
      return Failure<void>(ex, st);
    } catch (ex, st) {
      return Failure<void>(Exception(ex), st);
    }
  }

  @override
  Result<void> send(Command command) {
    try {
      _commandRepository.send(command);
      return const Success<void>(null);
    } on Exception catch (ex, st) {
      return Failure<void>(ex, st);
    } catch (ex, st) {
      return Failure<void>(Exception(ex), st);
    }
  }

  @override
  Future<Result<void>> disconnect() async {
    try {
      await _commandRepository.disconnect();
      return const Success<void>(null);
    } on Exception catch (ex, st) {
      return Failure<void>(ex, st);
    } catch (ex, st) {
      return Failure<void>(Exception(ex), st);
    }
  }
}
