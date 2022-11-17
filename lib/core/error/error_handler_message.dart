import 'package:players/core/error/failures.dart';
import 'package:players/core/utils/app_strings.dart';

String errorFailureMessage(Failures failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return AppStrings.serverFailureMessage;
    case NoConnectionFailure:
      return AppStrings.noConnectionFailureMessage;
    default:
      return AppStrings.unexpectedFailureMessage;
  }
}
