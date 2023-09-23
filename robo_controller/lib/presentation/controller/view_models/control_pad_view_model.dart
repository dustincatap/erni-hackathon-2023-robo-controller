import 'package:injectable/injectable.dart';
import 'package:robo_controller/core/presentation/view_models/view_model.dart';

@injectable
class ControlPadViewModel extends ViewModel {
  void onHorizontalChanged(double x) {
    print('x: $x');
  }

  void onVerticalChanged(double y) {
    print('y: $y');
  }
}
