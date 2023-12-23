enum LogicStateStatus {
  initial,
  loading,
  success,
  error;

  String toJson() => name;

  static LogicStateStatus fromJson(String name) => values.byName(name);

  bool get isInitial => index == initial.index;

  bool get isLoading => index == loading.index;

  bool get isSuccess => index == success.index;

  bool get isError => index == error.index;
}
