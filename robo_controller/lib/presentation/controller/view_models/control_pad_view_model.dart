import 'package:injectable/injectable.dart';
import 'package:robo_controller/core/presentation/view_models/view_model.dart';

@injectable
class ControlPadViewModel extends ViewModel {
  double onHorizontalChanged(double x) {
    print('x: $x');
    return x;
  }

  double onVerticalChanged(double y) {
    print('y: $y');
    return y;
  }
}
