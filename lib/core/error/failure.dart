import 'package:dio/dio.dart' as dio;
import 'package:equatable/equatable.dart';

import '../http/http_decoder.dart';
import '../http/status_response_model.dart';

abstract class Failure extends Equatable {
  const Failure([this.message = '']);
  final String message;

  @override
  List<Object> get props => <Object>[message];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure([super.message]);
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super('network_error');
}

class CacheFailure extends Failure {
  const CacheFailure() : super('CacheFailure');
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure(super.errorMessage);
}

class GenericError extends Failure {
  const GenericError(this.title, this.subtitle) : super('');
  final String title;
  final String subtitle;
  @override
  List<Object> get props => <Object>[title, subtitle, message];
}

Status getGenericError() => const Status(
  code: '666300',
  message: 'GENERIC_ERROR_KEY',
  messageDev: 'Generic server error',
  status: '',
);

class ErrorMapper {
  static Status extractStatus(dynamic e) {
    try {
      if (e is dio.DioException) {
        if (null != e.response && e.response!.statusCode! >= 500) {
          return getGenericError();
        }
      }
      if (null != e.response!.data! &&
          e.response!.data! is String &&
          e.response is dio.Response<dynamic>) {
        dio.Response<dynamic> response = e.response as dio.Response<dynamic>;
        return Status(
          code: response.statusCode.toString(),
          message: response.data.toString().length > 150
              ? response.statusMessage.toString()
              : response.data.toString(),
          messageDev: response.statusMessage!,
          status: '',
        );
      } else if (null != e.response!.data! && e.response!.data! is Map) {
        Status statusAux = Status.fromJson(e.response!.data!);
        return Status(
          code: statusAux.code,
          message: CharactersDecoder.decode(statusAux.message),
          messageDev: statusAux.messageDev,
          status: statusAux.status,
        );
      }

      return getGenericError();
    } catch (error) {
      return getGenericError();
    }
  }
}
