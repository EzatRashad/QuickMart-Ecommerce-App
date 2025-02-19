
abstract class Failure {
  final String errorMessage;

   Failure({required this.errorMessage});


}
class ServerFailure extends Failure{
  ServerFailure({required super.errorMessage});
}
class NetworkFailure extends Failure{
  NetworkFailure({required super.errorMessage});
}