import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:robo_controller/core/domain/models/result.dart';
import 'package:robo_controller/core/infrastructure/logging/logger.dart';
import 'package:robo_controller/domain/controller/models/command.dart';
import 'package:robo_controller/domain/controller/use_cases/send_command_use_case.dart';
import 'package:robo_controller/presentation/controller/view_models/control_pad_view_model.dart';

import '../../../unit_test_utils.dart';
import 'control_pad_view_model_test.mocks.dart';

@GenerateNiceMocks(<MockSpec<Object>>[
  MockSpec<SendCommandUseCase>(),
  MockSpec<Logger>(),
])
void main() {
  group(ControlPadViewModel, () {
    late MockSendCommandUseCase mockSendCommandUseCase;
    late MockLogger mockLogger;

    setUp(() {
      mockSendCommandUseCase = MockSendCommandUseCase();
      mockLogger = MockLogger();
      provideDummy<Result<void>>(Failure<void>(Exception()));
    });

    ControlPadViewModel createUnitToTest() {
      return ControlPadViewModel(mockSendCommandUseCase, mockLogger);
    }

    group('initialize', () {
      test('should connect before sending command on call', () async {
        final ControlPadViewModel unit = createUnitToTest();
        when(mockSendCommandUseCase.connect()).thenReturn(const Success<void>(null));

        await unit.initialize();

        verify(mockSendCommandUseCase.connect()).called(1);
      });

      test('should log error when failed to connect', () async {
        final ControlPadViewModel unit = createUnitToTest();
        when(mockSendCommandUseCase.connect()).thenReturn(Failure<void>(Exception(), StackTrace.current));

        await unit.initialize();

        verify(mockLogger.log(
          LogLevel.error,
          anyInstanceOf<String>(),
          anyInstanceOf<Exception>(),
          anyInstanceOf<StackTrace>(),
        )).called(1);
      });
    });

    group('dispose', () {
      test('should disconnect on call', () async {
        final ControlPadViewModel unit = createUnitToTest();
        when(mockSendCommandUseCase.disconnect()).thenAnswer((_) async => const Success<void>(null));

        await unit.dispose();

        verify(mockSendCommandUseCase.disconnect()).called(1);
      });

      test('should log error when failed to disconnect', () async {
        final ControlPadViewModel unit = createUnitToTest();
        when(mockSendCommandUseCase.disconnect())
            .thenAnswer((_) async => Failure<void>(Exception(), StackTrace.current));

        await unit.dispose();

        verify(mockLogger.log(
          LogLevel.error,
          anyInstanceOf<String>(),
          anyInstanceOf<Exception>(),
          anyInstanceOf<StackTrace>(),
        )).called(1);
      });
    });

    group('onSpeedChanged', () {
      test('should send command on call', () {
        const int expectedSpeed = 2;
        final ControlPadViewModel unit = createUnitToTest();
        when(mockSendCommandUseCase.send(anyInstanceOf<Command>())).thenReturn(const Success<void>(null));

        unit.onSpeedChanged(expectedSpeed);

        final VerificationResult sendVerification = verify(mockSendCommandUseCase.send(captureAnyInstanceOf<Command>()))
          ..called(1);
        final SetSpeedCommand actualCommand = sendVerification.captured.firstOrNull as SetSpeedCommand;
        expect(actualCommand.value, expectedSpeed);
        expect(unit.speed.value, expectedSpeed);
      });

      test('should log error when failed to send command', () {
        final ControlPadViewModel unit = createUnitToTest();
        when(mockSendCommandUseCase.send(anyInstanceOf<Command>()))
            .thenReturn(Failure<void>(Exception(), StackTrace.current));

        unit.onSpeedChanged(1);

        verify(mockLogger.log(
          LogLevel.error,
          anyInstanceOf<String>(),
          anyInstanceOf<Exception>(),
          anyInstanceOf<StackTrace>(),
        )).called(1);
      });
    });

    group('onDirectionChanged', () {
      test('should send command on call', () {
        const int expectedDirection = 2;
        final ControlPadViewModel unit = createUnitToTest();
        when(mockSendCommandUseCase.send(anyInstanceOf<Command>())).thenReturn(const Success<void>(null));

        unit.onDirectionChanged(expectedDirection);

        final VerificationResult sendVerification = verify(mockSendCommandUseCase.send(captureAnyInstanceOf<Command>()))
          ..called(1);
        final SetDirectionCommand actualCommand = sendVerification.captured.firstOrNull as SetDirectionCommand;
        expect(actualCommand.value, expectedDirection);
        expect(unit.direction.value, expectedDirection);
      });

      test('should log error when failed to send command', () {
        final ControlPadViewModel unit = createUnitToTest();
        when(mockSendCommandUseCase.send(anyInstanceOf<Command>()))
            .thenReturn(Failure<void>(Exception(), StackTrace.current));

        unit.onDirectionChanged(1);

        verify(mockLogger.log(
          LogLevel.error,
          anyInstanceOf<String>(),
          anyInstanceOf<Exception>(),
          anyInstanceOf<StackTrace>(),
        )).called(1);
      });
    });
  });
}
