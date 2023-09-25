import 'package:injectable/injectable.dart';
import 'package:robo_controller/data/controller/remote/command_web_socket.dart';
import 'package:robo_controller/domain/controller/models/command.dart';
import 'package:robo_controller/domain/controller/repositories/command_repository.dart';

@Injectable(as: CommandRepository)
class CommandRepositoryImpl implements CommandRepository {
  final CommandWebSocket _commandWebSocket;

  CommandRepositoryImpl(this._commandWebSocket);

  @override
  void connect() {
    _commandWebSocket.connect();
  }

  @override
  void send(Command command) {
    _commandWebSocket.send(command);
  }

  @override
  Future<void> disconnect() {
    return _commandWebSocket.disconnect();
  }
}
