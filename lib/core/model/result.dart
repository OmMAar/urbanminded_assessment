import '../utils/errors/errors.dart';

class Result<Data> {
  final Data? data;
  final BaseError? error;

  Result({this.data, this.error}) : assert(data != null || error != null);

  bool get hasDataOnly => data != null && error == null;

  bool get hasErrorOnly => data == null && error != null;

  bool get hasDataAndError => data != null && error != null;
}

class EmptyResultModel {}
