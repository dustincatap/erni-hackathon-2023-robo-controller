import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract interface class WebSocketFactory {
  WebSocketChannel create(String uri);
}

@LazySingleton(as: WebSocketFactory)
class WebSocketFactoryImpl implements WebSocketFactory {
  @override
  WebSocketChannel create(String uri) {
    return WebSocketChannel.connect(Uri.parse(uri));
  }
}
