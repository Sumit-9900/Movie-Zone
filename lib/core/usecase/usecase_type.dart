abstract interface class UsecaseType<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams {}
