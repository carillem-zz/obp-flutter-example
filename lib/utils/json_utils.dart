class JsonUtils {
  static List<T> toList<T>(dynamic data, T Function(dynamic) fromJson) {
    if (data == null) {
      return null;
    }
    var result = <T>[];
    for (var element in data) {
      T value;
      if (element != null) {
        value = fromJson(element);
      }
      result.add(value);
    }
    return result;
  }
}