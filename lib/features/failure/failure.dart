abstract class Failure {
  String errorMsg;
  Failure(this.errorMsg);
}

class ConnectionFailure extends Failure {
  ConnectionFailure([String? errorMsg]):super(errorMsg?? 'please check your internet '
      'connection and try again later') ;
}

class ApiFailure extends Failure {
  ApiFailure([String? errorMsg]):super(errorMsg?? 'Something went wrong , Please try again later') ;
}
class UnAuthFailure extends Failure {
  UnAuthFailure([String? errorMsg]):super(errorMsg?? 'Session expired , please log in again') ;
}