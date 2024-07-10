import 'package:tdd_project/core/utils/typedef.dart';

abstract class UsecaseWithParams<Type, Params> {
  ResultFuture<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type, Params> {
  ResultFuture<Type> call();
}
