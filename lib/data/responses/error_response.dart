import 'package:easy_localization/easy_localization.dart';
import 'package:kids_edu_teacher/data/responses/response_data.dart';

class ResponseError extends ResponseData {
  final String message;

  const ResponseError(this.message);

  const ResponseError.undefined(int code) : this('$code');

  static final noInternet = ResponseError('no_internet'.tr());

  static final incorretFormat = ResponseError('incorrect_format'.tr());

  static final serverError = ResponseError('server_error'.tr());

  static final unauthorized = ResponseError('not_authorized'.tr());

  @override
  String toString() {
    return message;
  }
}