import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final bool isSuccess;
  final String errorMesage;
  final int? statusCode;

  const Failure({required this.isSuccess, required this.errorMesage, this.statusCode});

  @override
  // TODO: implement props
  List<Object?> get props => [
        isSuccess,
        errorMesage,
        statusCode,
      ];
}

// external error
class ApiFailure extends Failure {
  const ApiFailure({super.isSuccess = false, super.errorMesage = 'Something went wrong, please try again!'});
}
