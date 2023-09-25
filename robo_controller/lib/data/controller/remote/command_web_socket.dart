import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:robo_controller/core/data/socket/web_socket_factory.dart';
import 'package:robo_controller/core/infrastructure/environment/environment_variables.dart';
import 'package:robo_controller/domain/controller/models/command.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract interface class CommandWebSocket {
  void connect();

  void send(Command command);

  Future<void> disconnect();
}

@Injectable(as: CommandWebSocket)
class CommandWebSocketImpl implements CommandWebSocket {
  final EnvironmentVariables _environmentVariables;
  final WebSocketFactory _webSocketFactory;

  WebSocketChannel? _webSocket;

  CommandWebSocketImpl(this._environmentVariables, this._webSocketFactory);

  @override
  void connect() {
    _webSocket = _webSocketFactory.create(_environmentVariables.mobileWebSocketUrl);
  }

  @override
  void send(Command command) {
    if (_webSocket == null) {
      throw UnsupportedError('WebSocket is not connected');
    }

    final String json = jsonEncode(command);
    _webSocket!.sink.add(json);
  }

  @override
  Future<void> disconnect() async {
    if (_webSocket == null) {
      throw UnsupportedError('WebSocket is not connected');
    }

    await _webSocket!.sink.close();
  }
}
