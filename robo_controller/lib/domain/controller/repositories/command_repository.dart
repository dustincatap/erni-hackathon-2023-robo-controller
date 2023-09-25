import 'package:robo_controller/domain/controller/models/command.dart';

abstract interface class CommandRepository {
  void connect();

  void send(Command command);

  Future<void> disconnect();
}
